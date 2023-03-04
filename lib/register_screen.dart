import 'package:flutter/material.dart';
import 'package:new_project/login_screen.dart';
import 'package:new_project/share/comp.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool ispassword =true;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: Myclipper(),
              child: Stack(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 11, 76, 216),
                    height: size.height / 3,
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height / 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 30,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            MyTextFormField(
              controller: nameController,
                labelText: 'Full Name',
                prefixIcon: Icons.person,
                keyboardtype: TextInputType.text,
                padding: 15.0,
                validator: (Value){
                    if(Value!.isEmpty){
                      return 'Please Enter Your Name';
                    }
                    return null;
                  },
                ),
            MyTextFormField(
              controller: emailController,
                labelText: 'Email',
                prefixIcon: Icons.email,
                keyboardtype: TextInputType.emailAddress,
                padding: 15.0,
                validator: (Value){
                    if(Value!.isEmpty){
                      return 'Please Enter Your Email';
                    }
                    return null;
                  },
                ),
            MyTextFormField(
              controller: phoneController,
                labelText: 'Phone',
                prefixIcon: Icons.phone,
                keyboardtype: TextInputType.number,
                padding: 15.0,
                validator: (Value){
                    if(Value!.isEmpty){
                      return 'Please Enter Your Phone';
                    }
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
                    return null;
                  },
                ),
              ),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: confirmPasswordController,
                  
                  keyboardType: TextInputType.number,
                  obscureText: ispassword,
                  decoration: InputDecoration(
                    
                    labelText: 'Confirm Password',
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
                      return 'Please Confirm Your Password';
                    }
                    return null;
                  },
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height / 40),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 11, 76, 216),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width / 3.7,
                    vertical: size.height / 60,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Register'),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
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
              child: const Text('Login'),
            ),
            SizedBox(height: size.height / 20),
          ],
        ),
      ),
    );
  }
}
