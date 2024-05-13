import 'package:flutter/material.dart';
import 'package:tom2/screens/home.dart';
import 'package:tom2/screens/signup.dart';

class login extends StatefulWidget {
  static const String screenroute = 'login';
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final username = TextEditingController();
  final pasword = TextEditingController();
  bool isvisble = false;

  final formkey = GlobalKey<FormState>;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color.fromARGB(140, 92, 37, 141),
            body: Center(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Container(
                    margin:
                        const EdgeInsetsDirectional.only(bottom: 0, top: 60),
                    child: const Form(
                      child: Column(children: [
                        Text(
                          'TOM',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Text(
                          'Target On Map',
                          style: TextStyle(
                              color: Color.fromARGB(255, 231, 231, 235),
                              fontSize: 24),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 50),
                      height: 610,
                      width: 380,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45.0),
                            topRight: Radius.circular(45.0),
                          )),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 50),
                      child: Center(
                        child: Column(children: [
                          Container(
                            margin: const EdgeInsets.only(right: 70),
                            child: const Text(
                              textAlign: TextAlign.left,
                              'Log in to your account',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20)),

                          //email
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.deepPurple.withOpacity(.2)),
                            child: TextFormField(
                                decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              border: InputBorder.none,
                              hintText: 'Username',
                            )),
                          ),
                          //password
                          const Padding(padding: EdgeInsets.only(top: 15.0)),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.deepPurple.withOpacity(.2)),
                              child: TextFormField(
                                  obscureText: !isvisble,
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.lock),
                                      border: InputBorder.none,
                                      hintText: 'password',
                                      suffixIcon: IconButton(
                                        onPressed: (null),
                                        icon: Icon(Icons.visibility),
                                      )))),

                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width * .99,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromARGB(140, 92, 37, 141)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()));
                                },
                                child: const Text(
                                  'Log in',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('do not have an account?'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => signup()));
                                  },
                                  child: const Text('Sign Up'))
                            ],
                          ),
                        ]),
                      )),
                ]),
              ),
            ))));
  }
}
