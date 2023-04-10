import 'package:flutter/material.dart';
import 'package:shared_pref/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '', age = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Email:"),
                Text(email.toString()),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text("Age:"),
              Text(age.toString()),
            ]),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
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
}
