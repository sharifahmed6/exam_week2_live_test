import 'package:todo_app_create/screen/todo.dart';
import 'package:flutter/material.dart';

class AddNewTodoScreen extends StatefulWidget{
  const AddNewTodoScreen({super.key});

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen>{

  final TextEditingController _titleTEControlar= TextEditingController();
  final TextEditingController _descriptonTEControlar= TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget Build(BuildContext context){
    return Scaffold();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:const Text('Add New Todo'),
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
                        Navigator.pop(context,todo);
                      }},
                      child:const Text('Add')
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }
}