import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tom2/screens/request.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(140, 92, 37, 141),
          leading: CircleAvatar(
            maxRadius: 10,
            child: Image.asset('assets/images/profile.jpg'),
          ),
          title: Text('Username'),
        ),
        body: Center(
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              height: 100,
              width: 345,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Request()));
                    },
                    child: const Text(
                      'Request Voulnteer',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  const Image(image: AssetImage('assets/images/voulnteer.jpg')),
                ],
              ),
            ),
            Expanded(
              child: GridView(
                padding: EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: const [
                  Card(
                    color: Color.fromARGB(189, 238, 238, 238),
                    child: SizedBox(
                      height: 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.health_and_safety,
                            size: 40,
                            color: Colors.black,
                          ),
                          TextButton(
                              onPressed: null,
                              child: Text(
                                'Helath',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color.fromARGB(189, 238, 238, 238),
                    child: SizedBox(
                      height: 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.food_bank_outlined,
                            size: 40,
                          ),
                          TextButton(
                              onPressed: null,
                              child: Text(
                                'Food',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color.fromARGB(189, 238, 238, 238),
                    child: SizedBox(
                      height: 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.money,
                            size: 40,
                          ),
                          TextButton(
                              onPressed: null,
                              child: Text(
                                'Financial',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color.fromARGB(189, 238, 238, 238),
                    child: SizedBox(
                      height: 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.category,
                            size: 40,
                          ),
                          TextButton(
                              onPressed: null,
                              child: Text(
                                'Other',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
