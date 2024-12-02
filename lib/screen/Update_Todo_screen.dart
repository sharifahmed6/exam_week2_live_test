import 'package:todo_app_create/screen/todo.dart';
import 'package:flutter/material.dart';

class UpdateTodoScreen extends StatefulWidget{
  const UpdateTodoScreen({super.key, required this.todo, required this.onUpdateTodo});

  final Todo todo;
  final Function(Todo) onUpdateTodo;

  @override
  State<UpdateTodoScreen> createState() => _UpdateTodoScreenState();
}

class _UpdateTodoScreenState extends State<UpdateTodoScreen>{

  final TextEditingController _titleTEControlar= TextEditingController();
  final TextEditingController _descriptonTEControlar= TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleTEControlar.text= widget.todo.title;
    _descriptonTEControlar.text= widget.todo.description;
  }

  @override
  Widget Build(BuildContext context){
    return Scaffold();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:const Text('Update Todo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEControlar,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  decoration:const InputDecoration(
                      labelText: 'Title',
                      hintText: 'Write Your Todo Title'
                  ),
                  validator: (String? value){
                    if(value== null || value.trim().isEmpty){
                      return 'Enter Your Title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _descriptonTEControlar,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  decoration:const InputDecoration(
                      labelText: 'Description',
                      hintText: 'Write your description here'
                  ),
                  validator: (String? value){
                    if(value== null || value.trim().isEmpty){
                      return 'Enter Your description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 21,),
                ElevatedButton(
                    onPressed: (){ if(_formKey.currentState!.validate()){
                      Todo todo= Todo(title: _titleTEControlar.text.trim(), description: _descriptonTEControlar.text.trim());
                      widget.onUpdateTodo(todo);
                      Navigator.pop(context);
                    }},
                    child:const Text('Update')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}