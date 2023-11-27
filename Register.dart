import 'package:flutter/material.dart';
import 'package:mygymapp/Home.dart';
import 'package:mygymapp/users.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  Map<String, String> regClasses = {};
  List<String> selectedItems = ['No Maw Tai Class', 'No Fitness Class'];
  late String email;
  String _selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (builder) => const Home()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
        title: const Center(
            child: Text(
          'Register In Our Gym',
          style: TextStyle(color: Colors.red),
        )),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: 300,
                    color: Colors.red,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          hintText: 'Enter Your Name',
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
                  child: Container(
                    width: 300,
                    color: Colors.red,
                    child: RadioListTile<String>(
                      title: const Text(
                        'Male',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 'Male',
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    color: Colors.red,
                    width: 300,
                    child: RadioListTile<String>(
                      title: const Text(
                        'Female',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 'Female',
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      for (var i = 0; i < selectedItems.length; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 100,
                                height: 45,
                                color: Colors.red,
                                child: Center(
                                    child: Text(
                                  classes[i],
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.red,
                                child: DropdownButton<String>(
                                  value: selectedItems[i],
                                  dropdownColor: Colors.red,
                                  items: dropdownItems[i]
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedItems[i] = newValue!;
                                      regClasses['${classes[i]}'] = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
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
                      if (users.any((user) => user['Email'] == email)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Email Already Exist.Try Another One.')));
                      } else {
                        users.add({
                          'Name': nameController.text,
                          'Email': email,
                          'Password': passwordController.text,
                          'Gender':_selectedValue
                        });
                        userClasses
                            .add({'Email': email, 'classes': regClasses});
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (builder) => const Home()));
                      }
                    },
                    child: const Text('Register'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
