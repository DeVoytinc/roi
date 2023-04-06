import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roi/screens/home.dart';

import '../main.dart';


List<String> suggestons = [
'Белгородская область'
,'Брянская область'
,'Владимирская область'
,'Воронежская область'
,'г. Москва'
,'Ивановская область'
,'Калужская область'
,'Костромская область'
,'Курская область'
,'Липецкая область'
,'Московская область'
,'Орловская область'
,'Рязанская область'
,'Смоленская область'
,'Тамбовская область'
,'Тверская область'
,'Тульская область'
,'Ярославская область'
,'Астраханская область'
,'Волгоградская область'
,'г. Севастополь'
,'Краснодарский край'
,'Республика Адыгея'
,'Республика Калмыкия'
,'Республика Крым'
,'Ростовская область'
,'Курганская область'
,'Свердловская область'
,'Тюменская область без автономных округов'
,'Ханты-Мансийский автономный округ - Югра'
,'Челябинская область'
,'Ямало-Ненецкий автономный округ'
,'Амурская область'
,'Еврейская автономная область'
,'Камчатский край'
,'Магаданская область'
,'Приморский край'
,'Республика Саха (Якутия)'
,'Сахалинская область'
,'Хабаровский край'
,'Чукотский автономный округ'
,'Алтайский край'
,'Забайкальский край'
,'Иркутская область'
,'Кемеровская область'
,'Красноярский край'
,'Новосибирская область'
,'Омская область'
,'Республика Алтай'
,'Республика Бурятия'
,'Республика Тыва'
,'Республика Хакасия'
,'Томская область'
,'Кабардино-Балкарская Республика'
,'Карачаево-Черкесская Республика'
,'Республика Дагестан'
,'Республика Ингушетия'
,'Республика Северная Осетия-Алания'
,'Ставропольский край'
,'Чеченская Республика'
,'Кировская область'
,'Нижегородская область'
,'Оренбургская область'
,'Пензенская область'
,'Пермский край'
,'Республика Башкортостан'
,'Республика Марий Эл'
,'Республика Мордовия'
,'Республика Татарстан'
,'Самарская область'
,'Саратовская область'
,'Удмуртская Республика'
,'Ульяновская область'
,'Чувашская Республика'
,'Архангельская область'
,'Вологодская область'
,'г. Санкт-Петербург'
,'Калининградская область'
,'Ленинградская область'
,'Мурманская область'
,'Ненецкий автономный округ'
,'Новгородская область'
,'Псковская область'
,'Республика Карелия'
,'Республика Коми'
];

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));


List<String> searchedSuggestion = suggestons;
int indexSelectedRegion = 0;
bool keyboadrIsActive = false;
int? selectedRegion;

class _LoginState extends State<Login> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //indexSelectedRegion = selectedRegion!;
  }

  @override
  Widget build(BuildContext context) {

    keyboadrIsActive = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 73,69,254),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'lib/images/login_back.png',
            fit: BoxFit.fitWidth,
            //width: double.infinity,
          ),
          Expanded(
            flex: keyboadrIsActive ? 0 : 2,
            child: Visibility(
              visible: !keyboadrIsActive,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    'Сервис для быстрого доступа ко всем инициативам российских граждан.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  'Регистрация',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: TextField(
                inputFormatters: [],
                cursorColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    searchedSuggestion = suggestons.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
                  });
                },
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 75, 75)
                ),
                decoration: InputDecoration(
                  hintText: 'Регион/область',
                  hintStyle: TextStyle(
                    color: Colors.black26,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
              )
            ),
          ),
          
          Visibility(
            visible: keyboadrIsActive,
            child: Expanded(
              flex: 3, 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  //color: Color.fromARGB(255, 255, 255, 255),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:  BorderRadius.circular(15),
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: searchedSuggestion.length,
                    itemBuilder: (BuildContext context, int index){
                      return TextButton(
                        onPressed: () { 
                          indexSelectedRegion = suggestons.indexOf(searchedSuggestion[index]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Home()),
                          );
                          selectedRegion = indexSelectedRegion;
                          saveRegion();
                        },
                        style: ButtonStyle(
                          alignment: Alignment.centerLeft,
                        ),
                        child: Text(
                          searchedSuggestion[index], 
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 40),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  )),
                ),
                onPressed: (){}, 
                child: Container(
                  child: Text(
                    'Продолжить',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 73,69,254),
                    ),
                  ),
                )
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: TextButton(
                onPressed: null,
                child: Text(
                  'Продолжить без регистрации',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Сервис работает на технологиях Российской общественной инициативы. Не является официальным приложением.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white30,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}