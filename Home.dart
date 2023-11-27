import 'package:flutter/material.dart';

import 'Classes.dart';
import 'Register.dart';
import 'account.dart';
import 'users.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Welcome To Our Gym',
          style: TextStyle(color: Colors.red),
        )),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/474x/d0/af/43/d0af4351c4e1d9131537c9b77cd658c7.jpg'),
          fit: BoxFit.cover,
        )),
        child: Opacity(
          opacity: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: 300,
                    color: Colors.red,
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: 'Enter Your Email',
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: EdgeInsets.all(9.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: 300,
                    color: Colors.red,
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: EdgeInsets.all(9.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {

                      setState(() {
                        email = emailController.text;
                      });
                      if(users.any((user) => user['Email']==email && user['Password']==passwordController.text)){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=> Account(email: email)));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email or password incorrect')));
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Classes()));
                          },
                          child: const Text('Classes'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>Register()));
                          },
                          child: const Text('Register'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
