import 'package:roi/logic/initiative.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roi/logic/initiativeAdvisement.dart';
import 'package:roi/logic/initiativeArchieve.dart';
import 'package:roi/screens/login.dart';
import 'dart:convert';
import 'dart:io';

import 'initiativeComplete.dart';
import 'initiativePoll.dart';

String jsonPollInitiative = '';
List<InitiativePool> PollInitiatives = [];
List<InitiativeAdvisement> AdvisementInitiative = [];
List<InitiativeComplete> CompleteInitiative = [];
List<InitiativeArchieve> ArchieveInitiative = [];

// На голосовании
//https://www.roi.ru/api/petitions/poll.json



Future<List<InitiativePool>> getPollInitiatives(String region) async {
  if (PollInitiatives.isNotEmpty)
    return PollInitiatives;
  Uri uri = Uri.parse('https://www.roi.ru/api/petitions/poll.json');
  final response =
  await http.Client().get(uri);
  if (response.statusCode == 200) {
    final jsonmap = jsonDecode(response.body);
    var initiativelist = jsonmap['data'];
    //print(initiativelist);
    for (int i = 0; i < initiativelist.length; i++){
      if (initiativelist[i]['geo']['region'] == suggestons[indexSelectedRegion])
        PollInitiatives.add(InitiativePool.fromJson(initiativelist[i]));
    }
    //print(PollInitiatives[0]);
  }
  
  return PollInitiatives;
}

Future<List<InitiativeAdvisement>> getAdvisementInitiative(String region) async {
    if (AdvisementInitiative.isNotEmpty)
    return AdvisementInitiative;
  Uri uri = Uri.parse('https://www.roi.ru/api/petitions/advisement.json');
  final response =
  await http.Client().get(uri);
  if (response.statusCode == 200) {
    final jsonmap = jsonDecode(response.body);
    var initiativelist = jsonmap['data'];
    //print(initiativelist);
    for (int i = 0; i < initiativelist.length; i++){
      if (initiativelist[i]['geo']['region'] == suggestons[indexSelectedRegion])
        AdvisementInitiative.add(InitiativeAdvisement.fromJson(initiativelist[i]));
    }
    //print(PollInitiatives[0]);
  }
  
  return AdvisementInitiative;
}

Future<List<InitiativeComplete>> getCompleteInitiative(String region) async {
  if (CompleteInitiative.isNotEmpty)
    return CompleteInitiative;
  Uri uri = Uri.parse('https://www.roi.ru/api/petitions/advisement.json');
  final response =
  await http.Client().get(uri);
  if (response.statusCode == 200) {
    final jsonmap = jsonDecode(response.body);
    var initiativelist = jsonmap['data'];
    //print(initiativelist);
    for (int i = 0; i < initiativelist.length; i++){
      if (initiativelist[i]['geo']['region'] == suggestons[indexSelectedRegion])
        CompleteInitiative.add(InitiativeComplete.fromJson(initiativelist[i]));
    }
    //print(PollInitiatives[0]);
  }
  
  return CompleteInitiative;
}

Future<List<InitiativeArchieve>> getInitiativeArchieve(String region) async {
  if (ArchieveInitiative.isNotEmpty)
    return ArchieveInitiative;
  Uri uri = Uri.parse('https://www.roi.ru/api/petitions/archive.json');
  final response =
  await http.Client().get(uri);
  if (response.statusCode == 200) {
    final jsonmap = jsonDecode(response.body);
    var initiativelist = jsonmap['data'];
    //print(initiativelist);
    for (int i = 0; i < initiativelist.length; i++){
      if (initiativelist[i]['geo']['region'] == suggestons[indexSelectedRegion])
        ArchieveInitiative.add(InitiativeArchieve.fromJson(initiativelist[i]));
    }
    //print(PollInitiatives[0]);
  }
  
  return ArchieveInitiative;
}