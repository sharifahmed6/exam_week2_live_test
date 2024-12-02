import 'package:todo_app_create/screen/todo.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_create/screen/Update_Todo_screen.dart';
import 'package:todo_app_create/screen/Add_New_Todo_screen.dart';
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  final List<Todo> listOfTodo=[];

  void _addtodo(Todo tdo){
    listOfTodo.add(tdo);
    setState(() {});
  }
  void _deleteTodo(int index){
    listOfTodo.removeAt(index);
    setState(() {});
  }
  void _updateTodo(int index,Todo todo){
    listOfTodo[index]=todo;
    setState(() {});
  }
  void _updateTodoStatus(int index, TodoStatus status){
    listOfTodo[index].status= status;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Todo List'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Visibility(
        visible: listOfTodo.isNotEmpty,
        replacement: Center(
          child: Text('Empty'),
        ),
        child: ListView.builder(
            itemCount: listOfTodo.length,
            itemBuilder: (context,index){
              Todo todo=listOfTodo[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
                leading: Text(todo.status.name),
                trailing: Wrap(
                  children: [
                    IconButton(onPressed: (){
                      _deleteTodo(index);
                    },
                        icon:const Icon(Icons.delete)),
                    IconButton(onPressed:() => _ShowChangeStatusDialog(index),
                        icon:const Icon(Icons.edit)),
                  ],
                ),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => UpdateTodoScreen(
                    todo: todo,
                    onUpdateTodo: (Todo updatedTodo){
                      _updateTodo(index, updatedTodo);
                    },
                  ) ));
                },
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
           Todo? todo= await Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewTodoScreen()));
          if(todo != null){
            _addtodo(todo);
          }
           },
          child:const Icon(Icons.add),
      ),
    );
  }
  void _ShowChangeStatusDialog(int index){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Change Status'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('Idle'),
                  onTap: (){
                    onTapUpgradeStatus(index,TodoStatus.idle);
                  },
                ),
                Divider(height: 0),
                ListTile(
                  title: Text('In Progress'),
                  onTap: (){
                    onTapUpgradeStatus(index,TodoStatus.Inprogress);
                  },
                ),
                Divider(height: 0),
                ListTile(
                  title: Text('Done'),
                  onTap: (){
                    onTapUpgradeStatus(index,TodoStatus.done);
                  },
                ),
              ],
            ),
          );
        }
    );
  }
  void onTapUpgradeStatus(int index, TodoStatus status){
    _updateTodoStatus(index, status);
      Navigator.pop(context);

  }
}
