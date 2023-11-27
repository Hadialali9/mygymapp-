import 'package:flutter/material.dart';
import 'package:mygymapp/users.dart';

import 'package:mygymapp/Home.dart';

class Account extends StatefulWidget {
  const Account({super.key, required this.email});
  final String email;

  @override
  _Account createState() => _Account();
}

class _Account extends State<Account> {
  late Map<String, dynamic> user;
  late Map<String, dynamic> classes;

  @override
  void initState() {
    user = users.firstWhere((users) => users['Email'] == widget.email);
    classes = userClasses
        .firstWhere((userClasses) => userClasses['Email'] == widget.email);
    print(classes['classes'].keys);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>Home()));
          },
          icon: Icon(Icons.arrow_back,color: Colors.red,),
        ),
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/474x/d0/af/43/d0af4351c4e1d9131537c9b77cd658c7.jpg'),
          fit: BoxFit.cover,
        )),
        child: Opacity(
          opacity: 0.8,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Name : ',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text('${user['Name']}',
                          style:
                              const TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Email : ',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text('${user['Email']}',
                          style:
                              const TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Password : ',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text('${user['Password']}',
                          style:
                              const TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Classes',
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  )
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      for (var key in classes['classes'].keys.where((key) =>
                          classes['classes'][key].compareTo('No Fitness Class') !=
                              0 &&
                          classes['classes'][key].compareTo('No Maw Tai Class') !=
                              0))
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 300,
                            height: 35,
                            color: Colors.red,
                            child: Center(
                                child: Text(
                              '$key ${classes['classes'][key]}',
                              style: const TextStyle(color: Colors.white, fontSize: 18),
                            )),
                          ),
                        )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
