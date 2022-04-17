import 'package:flutter/material.dart';
import '../view/registrpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthPage extends StatefulWidget {
   AuthPage({Key? key}) : super(key: key);
  //final firestoreInstance = Firestore.instance;
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.blue),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
                "Login now to track all your expenses\nand income at a place!"),
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Phone"),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: ("Ex +998 99 495 81 86"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(
                        Icons.alternate_email,
                        color: Colors.blue,
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.blue,),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrPage(),
                    ),
                  );
                },
                child: const Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
