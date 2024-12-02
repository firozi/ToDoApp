
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/TodoTile.dart';
import 'package:todo/Dialog.dart';
import 'package:todo/database.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage>{
  final _mybox=Hive.box('mybox');
  database db= database();
  @override
  void initState() {
    super.initState();
    if(_mybox.get('TODOTASK')==null){
      db.IntialData();
    }else{
      db.loadData();
    }

  }

  final TextEditingController InputController=TextEditingController();
  void _onsave(){
    var Task=InputController.text.toString();
    db.TodoTask.add([Task,false]);
    db.SaveData();
    InputController.clear();
    Navigator.of(context).pop();
    setState(() {});
  }
  void _onCancel(){
  Navigator.of(context).pop(); //close the DialogBox
  }

void CheckBoxChanged(int index){
  db.TodoTask[index][1]=!db.TodoTask[index][1];
  setState(() {});

}
void CreatNewTask(){
  showDialog(context: context, builder:(context) {
    return DialogBox(
      controller:InputController ,
      onSave: _onsave,
      onCancel: _onCancel,
    );
  },
  );
}
void _onDelete(int index){
    db.TodoTask.removeAt(index);
    db.SaveData();
    setState(() {

    });
}
  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.yellow[200], // Optional: set status bar color
      systemNavigationBarColor: Colors.yellow[200], // Set navigation bar color
    ));
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        title:Center(child: Text('TO DO',style: TextStyle(fontWeight:FontWeight.w600),)),
      ),
      floatingActionButton: FloatingActionButton(onPressed:CreatNewTask,
      child: Icon(Icons.add),
        backgroundColor: Colors.yellow[500],
      ),
      body: ListView.builder(
        itemCount: db.TodoTask.length,
        itemBuilder: (context,index){
          return ToDoTile(taskName: db.TodoTask[index][0],
            taskComplete:db.TodoTask[index][1],
            onChanged:(value)=>CheckBoxChanged(index),
            DeleteTask:(value)=> _onDelete(index),
          );
        },

      ),
    );
  }
}

