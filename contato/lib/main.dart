import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Contato());
}
 
 class Contato extends StatelessWidget{
  //necessário para inicializar a widget, passa a classe pai
  const Contato({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    title: 'Gaster Site Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      useMaterial3: true,
    ),
    home: const Principal(title: 'Contato Pessoal'),
  
    );

  }
 }
  class Principal extends StatefulWidget {
    //passa parâmetros informações para dentro dessa classe
        const Principal({super.key, required this.title});
        final String title;
 
      //cria um estado que vai se referir a classe _PrincipalEstado
      @override
      State<Principal> createState() => _PrincipalEstado();
  }

 
 //Classe _PrincipalEstado herdando o Estado - Estado: vai ficar atualizando
 class _PrincipalEstado extends State<Principal> {

  final foto = const CircleAvatar(
    backgroundImage: NetworkImage(
      "https://i.scdn.co/image/ab67616d0000b273bdc61b80b24a09b0cb22488e"),
    radius: 150,
    );

    final nome = const  Text(
      'Doctor WD',
      style: TextStyle(fontSize: 30, color: Colors.white),
      textAlign: TextAlign.center,      
    );

    final obs = const Text(
      'Undertale Theorist Full Of Determination',
      style: TextStyle(fontSize: 20, color: Colors.purpleAccent),
      textAlign: TextAlign.center,
    );

    final email = IconButton(
      icon: const Icon(Icons.mail),
      color: Colors.purple,
      onPressed: () {
        launchUrl(Uri(
          scheme: 'Gaster.Blaster',
          path: 'wd.gaster@doctor.pr.undertale.br',
          queryParameters: {
            'subject': 'Assunto do email',
            'body': 'Corpo do email',
          },
          ));
      },);
    final telefone = IconButton(
      icon: const Icon(Icons.phone),
      color: Colors.purple,
    onPressed: () {
      launchUrl(Uri(scheme: 'tel', path: '+5544998659782'));
     },
    );

    final sms = IconButton(
      color: Colors.purple,
      icon: const Icon(Icons.sms),
      onPressed: () {
        launchUrl(Uri(scheme: 'sms', path: '+5544998659782'));
      },
      );
      final site = IconButton(
        color: Colors.white,
        icon: const Icon(Icons.open_in_browser),
        onPressed: () {
          launchUrl(Uri.parse(
            'https://www.youtube.com/@octorw.d1662'));
        },
        );
  @override 
    Widget build(BuildContext context) {
        return Scaffold(  
          backgroundColor: Colors.black,
          appBar: AppBar(
            // ignore: prefer_const_constructors
            title: Text(
              'Aplicativo de Contato',
              style: const TextStyle(color: Colors.white),
             
              ),
              backgroundColor: Colors.purple,
              leading: IconButton(
              // ignore: prefer_const_constructors
              icon: Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {},
          ),
          ),
    //organizar em coluna
    body: Column(
      //alinhar conteúdo no centro - acima/baixo
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        foto, nome, obs,
        // ignore: prefer_const_constructors
        const Text(
          "W. D. Gaster was the Royal Scientist before Alphys, and was stated to have irreplaceable brilliance. Gaster's Followers imply that he created the CORE and has disappeared. During normal gameplay, W. D. Gaster is typically unmentioned.",
          style: TextStyle( color: Colors.white),
          textAlign: TextAlign.center,
          ),

        //criando linha
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [email,telefone,sms],
          //botões do aplicativo
        ),
      ],
    ),
);
    }
 }
