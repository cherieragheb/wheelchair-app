import 'package:flutter/material.dart';
import 'package:tom2/screens/home.dart';
import 'package:tom2/screens/login.dart';
import 'package:tom2/screens/provider.dart';
import 'package:tom2/screens/voulnteer.dart';

class signup extends StatefulWidget {
  static const String screenroute = 'signup';

  List<String> items = <String>[
    'voulnteer'
        'wheelchair'
        'provider'
  ];

  signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final username = TextEditingController();
  final pasword = TextEditingController();
  final confirmPassword = TextEditingController();
  final formkey = GlobalKey<FormState>;
  bool isvisble = false;
  String dropdownValue = 'w';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ListTile(
                      title: Text(
                        'Create An Account',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ),
// ------------------- First COntainer

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
                        hintText: 'First Name',
                      )),
                    ),
//
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
                              icon: Icon(Icons.person),
                              border: InputBorder.none,
                              hintText: 'Last Name',
                            ))),
//
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
                              icon: Icon(Icons.email),
                              border: InputBorder.none,
                              hintText: 'E-mail',
                            ))),
                    //
                    const Padding(padding: EdgeInsets.only(top: 15.0)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.deepPurple.withOpacity(.2)),
                      child: TextFormField(
                          decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        border: InputBorder.none,
                        hintText: 'Phone Number',
                      )),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15.0)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.deepPurple.withOpacity(.2)),
                      child: TextFormField(
                          decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: 'password',
                      )),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15.0)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.deepPurple.withOpacity(.2)),
                      child: TextFormField(
                          decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: 'confirm password',
                      )),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15.0)),
                    Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.deepPurple.withOpacity(.2),
                        ),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          isExpanded: true,
                          icon: const Icon(
                            Icons.menu,
                          ),
                          style: const TextStyle(color: Colors.white),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (String? newvalue) {
                            setState(() {
                              dropdownValue = newvalue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'v',
                              child: Text(
                                'voulneteer',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'w',
                              child: Text(
                                'wheelchair',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'p',
                              child: Text(
                                'provider',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        )),
                    //
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
                            switch (dropdownValue) {
                              case 'p':
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Provider()));
                                break;
                              case 'w':
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                                break;
                              case 'v':
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Voulnteer()));
                                break;
                              default:
                                print("Wrong choice");
                            }
                          },
                          child: const Text(
                            'next',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const login()));
                            },
                            child: const Text('log in'))
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
