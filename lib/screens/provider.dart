import 'package:flutter/material.dart';

class provider extends StatefulWidget {
  static const String screenroute = 'provider';

  @override
  State<provider> createState() => _providerState();
}

class _providerState extends State<provider> {
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
//

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
                          onPressed: () {},
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
