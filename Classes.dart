import 'package:flutter/material.dart';
import 'package:mygymapp/users.dart';

class Classes extends StatefulWidget{

  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Classes',style: TextStyle(color: Colors.red),)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.red,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            for(var i = 0;i<classes.length;i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      color: Colors.black,
                      child: Center(child: Text(classes[i],style: TextStyle(color: Colors.red,fontSize: 18),)),
                    ),
                    Center(
                      child:Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: classes[i]=='Maw tai'?NetworkImage(
                              'https://th.bing.com/th/id/R.d62eb927507897830323377144879efe?rik=9aikzjyfacvTWg&pid=ImgRaw&r=0'
                            ):NetworkImage(
                              'https://th.bing.com/th/id/OIP.vYzIDvnaR9AorPBogt6iiwHaEu?rs=1&pid=ImgDetMain'
                            )
                          )
                        ),
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}