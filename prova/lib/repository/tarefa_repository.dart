import '../model/tarefas.dart';

class TarefaRepository{
  // ignore: prefer_final_fields
  static List<Tarefa> _listaTarefa = [
    Tarefa("Lição de química"),
    Tarefa("Prova de DDM"),
    Tarefa("Seminário de Física"),
  ];

  //getters e setters
  static get getListaTarefa => _listaTarefa;

  set listaTarefa(value) => _listaTarefa = value;

  //voids
  void adicionar(Tarefa t){
    _listaTarefa.add(t);
  }

  void excluir(Tarefa t){
    _listaTarefa.remove(t);
  }

  void limpaLista(){
    _listaTarefa.clear();
  }

}