import 'package:flutter/material.dart';

//método principal que inicia a aplicação
void main() {
  runApp(Aplicativo()); //runApp - roda app - Chama classe Aplicativo
}

//A classe aplicativo vai herdar Stateless - não tem alteração dentro da rwka
class Aplicativo extends StatelessWidget {
  //Widget build vai contruir a aplicação
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //remove o simbolo de debug na tela do aplicativo
      //oferece padrão de design e componentes
      home: Pagina1(), //home - representa tela inicial - a primeira que abre
    );
  }
}

class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //fornece estruturas básicas
    return Scaffold(
      //barra de cima
      appBar: AppBar(
        //texto dentro da barra - cor da letra
        title: const Text(
          'Pagina1',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple, //Cor da barra
      ),
      //body- corpo - Center - Centralizar
      body: Center(
        //organize em sentido coluna
        child: Column(
          //centraliza sentido(acima-abaixo)
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://miro.medium.com/v2/resize:fit:1358/1*6JxdGU2WIzHSUEGBx4QeAQ.jpeg',
              width: 400,
              height: 400,
            ),
            const Text(
              'Bem-vindo a tela inicial',
              style: TextStyle(fontSize: 30),
            ),
            const Text(
              'Flutter é uma ferramenta multiplataforma - Android e IOS com um único código',
            ),
            ElevatedButton(
              onPressed:() {
                //Navigator, gerencia navegações entre elas 
                //push - empurra uma novas rota, para a pilha de navegação
                Navigator.push(
                  //context identifica pagina atual 
                  context,
                  //MaterialpageRoutter - define animação e layout para ir para outra tela
                  //builder - Constroi a nova tela Pagina2
                  MaterialPageRoute(builder: (context) => Pagina2()),
                );
              }, 
              child : Text('Ir para Página 2',),
            ),
          ],
        ),
      ),
    );
  }
}

class Pagina2 extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagina2'), backgroundColor: Colors.purple,
      ),
      
      //ignore: Prefer_const_constructors
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://m.media-amazon.com/images/I/51nn2rWyTVL.jpg',
            width: 400,
            height: 400,
            ),
            const SizedBox(height: 20),

            const Text('Linguagem DART', style: TextStyle(fontSize: 30),),
            const Text('É uma linguagem versátil que combina eficiência e desempenho'),

           const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pagina3())),
              },
               child: const Text('Ir para página 3'),
               ),

          ],
        )
      )
    );
  }
}
  class Pagina3 extends StatelessWidget{
    @override 
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Pagina 3'),
          backgroundColor: Color.fromARGB(255, 255, 0, 242),
        ),
      );
    }
  }