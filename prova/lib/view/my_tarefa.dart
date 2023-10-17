import 'package:flutter/material.dart';
import 'package:prova/model/tarefas.dart';
import 'package:prova/repository/tarefa_repository.dart';

class MyTarefa extends StatefulWidget {
  const MyTarefa({super.key});

  @override
  State<MyTarefa> createState() => _MyTarefaState();
}

class _MyTarefaState extends State<MyTarefa> {

  String nome = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController tarefaControl = TextEditingController();
  TarefaRepository listTarefa = TarefaRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Lista de tarefas", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              backgroundColor: const Color.fromARGB(255, 100, 4, 117),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: tarefaControl,
                              validator: (value){
                                if(value == "" || value!.isEmpty){
                                  return "Campo não pode ser vazio";
                                }else if(value.length <= 2){
                                  return "Campo deve ter no mínimo 3 caracteres";
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
                            ),
                          ),
              
                          TextButton(
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                nome = tarefaControl.text;
                                Tarefa t = Tarefa(nome);
                                listTarefa.adicionar(t);
                                setState(() {
                                  tarefaControl.clear();
                                });
                              }
                            }, 
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 100, 4, 117),
                              )
                            ),
                            child: const Text("Adicionar Tarefa", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
              
                          SingleChildScrollView(
                            child: SizedBox(
                              height: 400,
                              child: ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) => const Divider(thickness: 2,),
                                itemCount: TarefaRepository.getListaTarefa.length,
                                itemBuilder: (BuildContext context, int index){
                                  return ListTile(
                                    leading: const Icon(Icons.task),
                                    title: Text(TarefaRepository.getListaTarefa[index].nome),
                                    trailing: Icon(Icons.check_box_outline_blank),
                                  );
                                }, 
                              ),
                            ),
                          ),
              
                          ElevatedButton(
                            onPressed: (){
                              setState(() {
                                listTarefa.limpaLista();
                              });
                            }, 
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 100, 4, 117),
                              )
                            ),
                            child: const Text("Limpar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                          ),
                        ],
                      ))
                  ],
                ),
              ) 
            ),
          );
  }
}