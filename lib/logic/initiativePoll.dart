import 'initiative.dart';

class InitiativePool extends Initiative{

//data Корневой элемент данных array
late int id; //Идентификатор
//late String title; // Наименование инициативы 
//late List<Object> geo; // Информация о местоположении 
late String geoarea; // Федеральный округ 
late String georegion; // Регион 
late String geomunicipality; // Муниципалитет
//late List<Object> level;
late int levelid;
//late String leveltitle;
//late List<Object> status;
late int statusid;
late String statustitle;

  InitiativePool(
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

  InitiativePool.fromJson(Map<String, dynamic> json){
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