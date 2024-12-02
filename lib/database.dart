import 'package:hive_flutter/adapters.dart';

class database{
  List TodoTask=[];
  final _mybox=Hive.box('mybox');

  void SaveData(){
    _mybox.put('TODOTASK',TodoTask);
  }

  void IntialData(){
    TodoTask=[
      ['Swipe left to delete',false]
    ];
  }

  void loadData(){
    TodoTask=_mybox.get('TODOTASK');
  }

}