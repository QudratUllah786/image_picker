import 'package:flutter/material.dart';
class InputScreen extends StatefulWidget {

 InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
    List<String> peopleList = [
      'Wade',
      'Dave',
      'Seth',
      'Ivan',
      'Qudrat',
      'Asif',
      'Tematar',
      'Helipadi',
      'Akhtri',
      'Akbari',
      'Golo',
      'Gochu',
      'Birju',
    ];
    List<String> secondList = [];
    TextEditingController? _textEditingController = TextEditingController();
  var num = 0;
 // TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller:_textEditingController,
            onChanged: (value){
              setState((){
                secondList =peopleList.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
        )
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount:_textEditingController!.text.isNotEmpty?secondList.length: peopleList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(_textEditingController!.text.isNotEmpty?secondList[index]:peopleList[index]),
          );
        },
      //  mainAxisAlignment: MainAxisAlignment.center,
       
        

          // Center(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Text('$num'),
          //       ElevatedButton(onPressed: (){
          //         setState((){
          //           num++;
          //         });
          //       }, child: Text('incriment')),
        
            ),
           );
  }
}
