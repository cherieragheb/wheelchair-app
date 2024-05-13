import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tom2/screens/chatpage.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: null,
            body: Column(children: [
              Stack(children: [
                Column(
                  children: [
                    Container(
                      color: const Color.fromRGBO(108, 50, 173, 1),
                      height: 190,
                      width: 395,
                    ),
                    Container(
                      color: Colors.white,
                      height: 615,
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 140),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          maxRadius: 50,
                          backgroundImage:
                              AssetImage('assets/images/profile.jpg'),
                        ),
                        const Text(
                          'username',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            itemSize: 20,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            }),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        Container(
                          height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(108, 50, 173, 1)),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ChatPage()));
                              },
                              child: const Text(
                                'Chat',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 360),
                  height: 444,
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Reviews',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10)),
                      Container(
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(9.0),
                              child: CircleAvatar(
                                maxRadius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/profile.jpg'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'username',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: const Text(
                                      'ay review 7drtk 3awzo hbjuhlijhknkjhgkhkjlgel;kjblkntgrjknkbn'),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.favorite,
                              size: 45,
                            )
                          ],
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10)),
                      Container(
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(9.0),
                              child: CircleAvatar(
                                maxRadius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/profile.jpg'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'username',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: const Text(
                                      'ay review 7drtk 3awzo hbjuhlijhknkjhgkhkjlgel;kjblkntgrjknkbn'),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.favorite,
                              size: 45,
                            )
                          ],
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10)),
                      Container(
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(9.0),
                              child: CircleAvatar(
                                maxRadius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/profile.jpg'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'username',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: const Text(
                                      'ay review 7drtk 3awzo hbjuhlijhknkjhgkhkjlgel;kjblkntgrjknkbn'),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.favorite,
                              size: 45,
                            )
                          ],
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10)),
                      Container(
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(9.0),
                              child: CircleAvatar(
                                maxRadius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/profile.jpg'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'username',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: const Text(
                                      'ay review 7drtk 3awzo hbjuhlijhknkjhgkhkjlgel;kjblkntgrjknkbn'),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.favorite,
                              size: 45,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ])
            ])));
  }
}
