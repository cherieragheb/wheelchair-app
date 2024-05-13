import 'package:flutter/material.dart';
import 'package:tom2/screens/home.dart';
import 'package:tom2/screens/nav_menu.dart';

class Provider extends StatefulWidget {
  static const String screenroute = 'provider';

  const Provider({super.key});

  @override
  State<Provider> createState() => _ProviderState();
}

class _ProviderState extends State<Provider> {
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
                        'place information:',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
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
                          icon: Icon(Icons.home_work_sharp),
                          border: InputBorder.none,
                          hintText: 'Name of place ',
                        ))),
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
                          icon: Icon(Icons.category_sharp),
                          border: InputBorder.none,
                          hintText: 'type of place',
                        ))),
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
                        icon: Icon(Icons.location_pin),
                        border: InputBorder.none,
                        hintText: 'location',
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
                            decoration: const InputDecoration(
                          icon: Icon(Icons.timelapse),
                          border: InputBorder.none,
                          hintText: 'work time',
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
                          icon: Icon(Icons.link),
                          border: InputBorder.none,
                          hintText: 'website',
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
                                    builder: (context) => NavMenu()));
                          },
                          child: const Text(
                            'finish',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
