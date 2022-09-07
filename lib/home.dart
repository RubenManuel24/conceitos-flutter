
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future _recuperarCep() async{
   
   final urlCep = Uri.https(
    'viacep.com.br', 
    '/ws/04005020/json/');
     
     final Response = await http.get(urlCep);
     
      Map<String, dynamic> retorno = json.decode(Response.body);
      String logradouro = retorno["logradouro"];
      String complemento = retorno["complemento"];
      String bairro = retorno["bairro"];
      String localidade = retorno["localidade"];
  
      print("Respostas: logradouro: ${logradouro}, complemento: ${complemento}, bairro: ${bairro}, localidade: ${localidade}");

     //print("Resposta da API: "+Response.body);
     //print("Resposta da API: "+Response.statusCode.toString());
      /*if(Response.statusCode.toString() == "200"){
        print("Está tudo OK");
      }
      else{
       print("Fudeu! Deu erro.");
     }*/

  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de Serviço Web"),
        backgroundColor: Color(0xFFFF70300),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(children: <Widget>[
            TextButton(
              onPressed:() => _recuperarCep(), 
              child: Text("Click here", style: TextStyle(
                color: Color(0xFFFFFFFF)
              ), ),
              style: TextButton.styleFrom(backgroundColor: Color(0xfff90000)),
              )
        ]),
      ),
    );
    
  }
}