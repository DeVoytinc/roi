import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roi/screens/home.dart';
import 'package:roi/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isAlreadyLogin = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color.fromARGB(255, 73,69,254),
    statusBarColor: Color.fromARGB(255, 255, 255, 255),
  ));

 if(await checkSavingRegion()){
  await getRegion();
  if (selectedRegion != null) {
    isAlreadyLogin = true;
  }
 }
  runApp(const MyApp());
}

Future<bool> checkSavingRegion() async{
  var prefs = await SharedPreferences.getInstance();
  return prefs.containsKey('region');
}

Future saveRegion() async{
  var prefs = await SharedPreferences.getInstance();
  prefs.setInt('region', selectedRegion!);
}

Future getRegion() async{
  var prefs = await SharedPreferences.getInstance();
  selectedRegion = prefs.getInt('region');
  indexSelectedRegion = selectedRegion!;
}

void setMainSystemColors(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color.fromARGB(255, 164, 162, 255),
    statusBarColor: Color.fromARGB(255, 73,69,254),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: isAlreadyLogin ? const Home() : const Login(),
    );
  }
}

