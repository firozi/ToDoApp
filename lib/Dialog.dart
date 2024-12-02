import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget{
  final TextEditingController controller;
   VoidCallback onSave;
   VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller
    ,required this.onSave
    ,required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
       backgroundColor: Colors.yellow[200],
       content:Container(height: 130,padding:EdgeInsets.all(5),

       child: Column(
         children:[
           TextField(
             controller: controller,
             decoration: InputDecoration(
               focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(5),
                 borderSide: BorderSide(color: Colors.black, width: 1),
               ),
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(5),
                 borderSide: BorderSide(color: Colors.grey,width: 1)
               ),
               hintText: "Add a new task"
             ),
           ),
           SizedBox(
             height: 15,
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
              children:[
                ElevatedButton(
                    onPressed:onSave ,
                  child:Text('save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[400],
                    foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  )
                ),
                SizedBox(width: 8,),
                ElevatedButton(
                  onPressed: onCancel,
                    child: Text('cancel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[400],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                ),
              ],
            ),
          ],
        ),
       ) ,
    );
  }

}