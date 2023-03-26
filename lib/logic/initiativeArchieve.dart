import 'initiative.dart';

class InitiativeArchieve extends Initiative{

//data Корневой элемент данных array
late int id; //Идентификатор
//late String title; // Наименование инициативы 
late String geoarea; // Федеральный округ 
late String georegion; // Регион 
late String geomunicipality; // Муниципалитет
late int levelid;
//late String leveltitle;
late int statusid;
late String statustitle;

  InitiativeArchieve(
     this.id,
     //this.title,
     //this.geo, 
     this.geoarea,
     this.georegion,
     this.geomunicipality,
     //this.level, 
     this.levelid, 
     //this.leveltitle, 
     //this.status,
     this.statusid,
     this.statustitle,
  );

  InitiativeArchieve.fromJson(Map<String, dynamic> json){
     id = json['id'];
     title = json['title'];
     //geo = json['geo'];
     geoarea = json['geo']['area'];
     georegion = json['geo']['region'];
     //geomunicipality = json['geo']['municipality'];
     //level = json['level'];
     levelid = json['level']['id'];
     leveltitle = json['level']['title'];
     //status = json['status'];
     statusid = json['status']['id'];
     statustitle = json['status']['title'];
  }
}