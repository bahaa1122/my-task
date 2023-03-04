import 'package:flutter/material.dart';
import 'package:new_project/register_screen.dart';
import 'package:new_project/share/comp.dart';

import 'animated_list.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool ispassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey= GlobalKey<FormState>();


  Widget build(BuildContext context) {
    
    
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ClipPath(
                  clipper: Myclipper(),
                  child: Container(
                    color: const Color.fromARGB(255, 11, 76, 216),
                    height: size.height / 3,
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height / 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                MyTextFormField(
                  controller: emailController,
                    labelText: 'Email',
                    prefixIcon: Icons.email,
                    keyboardtype: TextInputType.emailAddress,
                    padding: 15.0,
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please Enter Your Email';
                      }
                      else if (
                        emailController.text.contains('@') == false ||
                        emailController.text.contains('.') == false)
                        {return 'Please Enter a Valid Email';}
                      return null;
                    },
                    ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.number,
                    obscureText: ispassword,
                    decoration: InputDecoration(
                      
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            ispassword = !ispassword;
                          });
                        },
                        icon: ispassword 
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)
                      ),
                      border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.5),
              ),
                    ),
                    validator: (Value){
                      if(Value!.isEmpty){
                        return 'Please Enter Your Password';
                      }
                      else if (Value.length < 8 ){
                        return 'Password Must be at Least 8 Characters';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height / 40),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()){

                        MyNav(context: context, widget: const AnimatedListScreen());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 11, 76, 216),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width / 3,
                        vertical: size.height / 60,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const RegisterScreen();
                      }),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width / 3.3,
                      vertical: size.height / 60,
                    ),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 11, 76, 216),
                      width: 1,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 11, 76, 216),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Register'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
