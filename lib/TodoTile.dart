import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget{
 final String taskName;
 final bool taskComplete;
 Function(bool?)? onChanged;
 void Function(BuildContext)? DeleteTask;

  ToDoTile({super.key, required this.taskName ,required this.taskComplete, required this.onChanged,required this.DeleteTask});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children:[
            SlidableAction(onPressed:DeleteTask,
             icon: Icons.delete, 
              backgroundColor:Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),

          ]),
          child: Container(
            margin: EdgeInsets.only(left: 20,right:20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.yellow[500],
                borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Checkbox(value:taskComplete, onChanged: onChanged, activeColor: Colors.black,),
                Text('$taskName' ,style: TextStyle(fontSize: 16,decoration: taskComplete ? TextDecoration.lineThrough:TextDecoration.none),),
              ],
            )
          ),
        ),
      ],
    );
  }

}