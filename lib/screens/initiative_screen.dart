import 'package:flutter/material.dart';
import 'package:roi/logic/getdata.dart';
import 'package:roi/logic/initiative.dart';
import 'package:roi/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:unixtime/unixtime.dart';

//CHARTS
import 'dart:math';
//import 'package:url_launcher/url_launcher.dart';

class InitiativeScreen extends StatelessWidget {
  const InitiativeScreen({
    super.key,
    required this.index,
  });

  final int index;

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 0, right: 10),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            IconButton(
                onPressed: () {
                  goBack(context);
                },
                icon: Icon(Icons.arrow_back)),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Hero(
                tag: 'titleInit' + index.toString(),
                child: new Material(
                  child: Text(
                    CurinitiativeList[index].title,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: Text(
                        CurinitiativeList[index].statustitle,
                        style: TextStyle(
                            color: Color.fromARGB(255, 230, 230, 230)),
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'initLevel' + index.toString(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.greenAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Material(
                          color: Color.fromARGB(0, 0, 0, 0),
                          child: Text(
                            CurinitiativeList[index].leveltitle,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: getInitiativeInfo(index),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          return Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: List.generate(
                                  curInitiative.categorytitle.length, (index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 240, 177, 105),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 5),
                                    child: Text(
                                      curInitiative.categorytitle[index],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                );
                              }));
                        }
                        return Container();
                      }),
                ],
              ),
            ),
            FutureBuilder(
                future: getInitiativeInfo(index),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator(
                      color: Color.fromARGB(255, 190, 36, 36),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            curInitiative.description,
                            style: TextStyle(fontSize: 17),
                          ),
                          const Text(
                            '\nПрактический результат:',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45),
                          ),
                          Text(
                            curInitiative.prospective,
                            style: TextStyle(fontSize: 17),
                          ),
                          const Text(
                            '\nРешение:',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45),
                          ),
                          Text(
                            curInitiative.decisiontext,
                            style: const TextStyle(fontSize: 17),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.room),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${curInitiative.geoarea}, \n${curInitiative.georegion}',
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${curInitiative.datepollbegin.toUnixTime().toString().substring(0, 10)} - ${curInitiative.datepollend.toUnixTime().toString().substring(0, 10)}',
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () =>
                                launchUrl(Uri.parse(curInitiative.url)),
                            child: const Text(
                              'Открыть инициативу на сайте',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    );
                  }
                }),
          ]),
        ),
      ),
    );
  }
}
