import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

//método que roda a aplicação
void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  //construção do app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação com API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  @override
  home_state createState() => home_state();
}

class home_state extends State<home> {
  //permite manipular o texto dentro do campo de input
  TextEditingController controleTexto = TextEditingController();
  String conteudo = '';
  String imagem = '';

  Future<void> buscar() async {
    String entrada = controleTexto.text;
    String url = 'https://pt.wikipedia.org/api/rest_v1/page/summary/$entrada';
    final resposta = await http.get(Uri.parse(url));

//se a busca estiver certa
    if (resposta.statusCode == 200) {
      Map<String, dynamic> dado = json.decode(resposta.body);
      setState(() {
        conteudo = dado['extract'];
        imagem = dado['originalimage']['source'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicativo com API'),
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://wallpaper4k.top/wp-content/uploads/2023/09/Download-Wallpaper-3840x2400-red-black-abstract-Ultra-HD-4K-HD-1024x640.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          //2 - contrução do card
          Padding(
              padding: const EdgeInsets.all(70.0),
              child: Center(
                child: Card(
                  color: Colors.white,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text('Ola Mundo'),
                        Expanded(
                       child: TextField(
                          controller: controleTexto,
                          decoration: const InputDecoration(
                            labelText: 'Digite o texto',
                          ),
                        ),
                      ),
                    //    const SizedBox(height: 20.0),//
                        ElevatedButton(
                          onPressed: buscar,
                          child: const Text('Buscar'),
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          'Resultado',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10.0),
                        Text(conteudo, style: TextStyle(fontSize: 16.0)),
                        const SizedBox(height: 20.0,),
                        if(imagem.isNotEmpty
                        Center(child: Image.network(imagem, height: 150,)),)
                      ],
                    ),
                  ),
                ),
              )),

        ],
      ),
    );
  }
}

class ImagemTelaInteira extends StatelessWidget {
  final String imagemParametro;

ImagemTelaInteira({super.key, required this.imagemParametro});
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body: Center(
      child: Hero(
        tag: imagemParametro,
        child: Image.network(imagemParametro),
        ),
        ),
  );
}

}