import 'package:flutter/material.dart';
import 'package:roi/logic/getdata.dart';
import 'package:roi/logic/initiative.dart';
import 'package:roi/screens/login.dart';

import '../main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  

  @override
  State<Home> createState() => _HomeState();
}

TextStyle categoryTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,

);

late List<Initiative> CurinitiativeList = PollInitiatives;

void changeTabIndex(int index){
  switch (index) {
    case 0:
      CurinitiativeList = PollInitiatives;
      break;
    case 1:
      CurinitiativeList = AdvisementInitiative;
      break;
    case 2:
      CurinitiativeList = CompleteInitiative;
      break;
    case 3:
      CurinitiativeList = ArchieveInitiative;
      break;
    default:
  }
}

Future<List<Initiative>> getALLInitiatives() async {
  await getPollInitiatives(suggestons[indexSelectedRegion]);
  await getAdvisementInitiative(suggestons[indexSelectedRegion]);
  await getCompleteInitiative(suggestons[indexSelectedRegion]);
  await getInitiativeArchieve(suggestons[indexSelectedRegion]);
  // if (CurinitiativeList.isEmpty)
  //   CurinitiativeList = PollInitiatives;
  return CurinitiativeList;
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //getData(suggestons[indexSelectedRegion]);
    setMainSystemColors();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 73,69,254),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextButton(
              onPressed: (){}, 
              child: Text(
                suggestons[indexSelectedRegion],
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                )
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 164, 162, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), 
                  topRight:  Radius.circular(25), 
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  )
              ),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.sort, color: Colors.white,)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: TextButton(
                              onPressed: () { 
                                setState(() {
                                changeTabIndex(0);
                              });  
                              },
                              child: Text('На голосовании', style: categoryTextStyle,),
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: TextButton(
                              onPressed: () { setState(() {
                                changeTabIndex(1);
                              });   },
                              child: Text('На рассмотрении', style: categoryTextStyle,),
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: TextButton(
                              onPressed: () { setState(() {
                                changeTabIndex(2);
                              });   },
                              child: Text('Решение принято', style: categoryTextStyle,),
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: TextButton(
                              onPressed: () { setState(() {
                                changeTabIndex(3);
                              });   },
                              child: Text('В архиве', style: categoryTextStyle,),
                            )
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: getALLInitiatives(),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if (!snapshot.hasData){
                          return Column(
                            children: [
                              Expanded(child: Container()),
                              const CircularProgressIndicator(color: Colors.white,),
                              const SizedBox(height: 20,),
                              const Text(
                                'Получение списка инициатив', 
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(child: Container()),
                            ],
                          );
                        }
                      return ListView.builder(
                        itemCount: CurinitiativeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    CurinitiativeList[index].title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.greenAccent,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                                            child: Text(
                                              CurinitiativeList[index].leveltitle,
                                              style: TextStyle(
                                                color: Colors.black
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //Text('На федеральном уровне запретить этим мелким спиногрызам самоликвидироваться путём прыжка рыбкой из окна десятиэтажки.')
                          
                                ],
                              ),
                            ),
                          );
                        }
                      );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}