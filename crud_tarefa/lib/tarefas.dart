import 'dart:html';

import 'package:flutter/material.dart';

class Tarefas extends StatefulWidget {
  const Tarefas({super.key});

  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {

  final formKey = GlobalKey<FormState>();
  TextEditingController tarefaControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Lista de tarefas"),
            backgroundColor: const Color.fromARGB(255, 100, 4, 117),
          ),
          body: Center(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: tarefaControl,
                        validator: (value){
                          if(value == "" || value!.isEmpty){
                            return "Campo não pode ser vazio";
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          label: const Text("Tarefa"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )
                        ),
                      )
                    ],
                  ))
              ],
            ) 
          ),
        ),
      )
    );
  }
}