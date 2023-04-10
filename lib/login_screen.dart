import 'package:flutter/material.dart';
import 'package:shared_pref/home_screen.dart';
import 'package:shared_pref/student_screen.dart';
import 'package:shared_pref/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(hintText: 'password'),
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Age'),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString("email", emailController.text.toString());
                  sp.setString('age', ageController.text.toString());
                  sp.setBool('isLogin', true);

                  //admin, student, teacher
                 // sp.setString('userType', 'student');
                 // sp.setString('userType', 'teacher');

                  if (sp.getString("userType") == "student") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentScreen()));
                  } else if (sp.getString("userType") == "teacher") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TeacherScreen()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()));
                  }
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => StudentScreen()));
                  // print(sp.getString('name'));
                  // print(sp.getInt('age'));
                  // print(sp.getBool('isLogin'));
                  //
                  // (sp.remove('name'));
                  // print(sp.get('nane'));

                  //seyabAli();
                  //  print('Tap');
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Text('Login',
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> seyabAli() async {
    await Future.delayed(
      const Duration(seconds: 7),
    );
    print('Delayed');
  }
}
