import 'dart:async';

import 'package:flutter/material.dart';
//método principal - o primeiro a ser chamado para iniciar
void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatefulWidget{
  //construção de chave, ajuda o flutter a gerenciar as atualizações de tela 
  //A chame key é passada para o construtor da superClasse
  const Aplicativo({Key? key}) : super(key:key);

//serve para indicar como criar e associar um estado/alteração -  Atualiza Interface 
//State - representa os dados mutáveis de um widget em um momento
//atualiza a tela sempre que houver alterações
  @override
  State<Aplicativo> createState() => _EstadoAplicativo();

}

//"_" na classe indica que a classe só pode ser acessada neste arquivo
//Estado aplicativo herda as caracteristicas da lasse State, que está 
//vinculada a aplicativo
class _EstadoAplicativo extends State<Aplicativo> {
  int contador1 = 0;
  int contador2 = 0;
  int _tempo = 60;
  late Timer _timer;
  bool _clique = true;
  Color cor1 = Colors.yellow;
  Color cor2 = Colors.yellow;
  double posicao = 0;

  void movimentar() {
    setState(() {
      if(contador1 > contador2) {
        //imagem fica na esquerda
        posicao = 50.0;
      } else if (contador2 > contador1 ) {
        //imagem fica na direita
        posicao = MediaQuery.of(context).size.width - 250.0;
      } else {
        //personagem no meio
        posicao = MediaQuery.of(context).size.width / 2 - 150;
      }
    });
  }

  //inicia o que estiver dentro, antes mesmo de carregar a tela - inicia o timer
  @override
    void initState() {
      super.initState();
      _iniciarTimer();
    }
  //cancelar timer - dispose - limpa todos os recursos
  void _iniciarTimer() {
    //Timer.periodic executa uma função a cada segundo
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      //se o tempo < que zero, yem dimunui 1 (--)
      setState((){
        if (_tempo > 0) {
          _tempo--;
        } else {
          _timer.cancel;
          _clique = false;
        }
      });
     });
  }

  void mudarCor() {
    if (contador1 > contador2) {
      cor1 = Colors.purple;
      cor2 = Colors.redAccent;
    }else if (contador2 > contador1) {
     cor1 = Colors.red;
     cor2 = Colors.purple;
    }else {
      cor1 = Colors.orange;
       cor2= Colors.orange;

    }
  }


  void _reiniciar(){
    //setState -  comunica ao flutter que houve alteração, atualiza a tela toda
    setState(() {
      contador1 = 0;
      contador2 = 0;
      _tempo = 60;
      _clique = true;


    });
    _timer.cancel();
    _iniciarTimer();
  }




    @override
  Widget build(BuildContext context) {
    mudarCor(); 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: Colors.black,
       appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 162, 0, 255),
        title: const Text(
          'Jogo Contador',
          style: TextStyle(color: Colors.white),
          ),


       ),

       body: Stack(
        children: [
         Center( 

          child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          //representa os filhos de widget column
          children: [
            
            Text(
              'Contador 1: $contador1 ', 
              style: TextStyle(fontSize: 30, color: cor1),
              ),
              SizedBox(height: 20),
              Text(
                'Contador 2: $contador2',
                style: TextStyle(fontSize: 30, color: cor2),
                ),
              Text(
                  'Tempo restante: $_tempo segundos',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),

           ),

           AnimatedPositioned(
            duration: Duration(milliseconds: 500),
             bottom: 100.0,
             left: posicao,
             curve: Curves.elasticInOut,
            child: Image.asset(
              'Wdgaster.png', 
                width: 200, 
                height: 200,
              ),
              

            ),
          
          ],
         
       ),
        
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
             padding: const EdgeInsets.only(left: 50.0),

             child: FloatingActionButton(
              //onPressed: _clique ? (){ setState( (){ contador1++; }); } : null,
              onPressed: () { 
                //sinaliza que houve mudança, para atualizar a tela
               
                setState(() { 
                  //adicionar +1 na váriavel contador
                  contador1++;
                  movimentar(); 
                  }); 
                  },
              tooltip: 'Incrementar Contador 1',
              child: Icon(Icons.add),
             ),
             ),

             FloatingActionButton(
              onPressed: _reiniciar,
              tooltip: 'Zerar Contagem',
              child: Icon(Icons.refresh),
              ),
              Padding(
              padding: const EdgeInsets.only(right: 20.00),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_clique == true) {
                    contador2++;
                    movimentar();
                    }
                  });
                },
                tooltip: 'Incrementar contador 2',
                child: Icon(Icons.add),
              ),
              ),
          ]
        ),
      ),
      );
    
  }
}
