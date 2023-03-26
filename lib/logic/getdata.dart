import 'package:roi/logic/initiative.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roi/screens/login.dart';
import 'dart:convert';
import 'dart:io';

import 'initiativePoll.dart';

String jsonPollInitiative = '';
List<InitiativePool> PollInitiatives = [];

List<Initiative> acceptInitiative = [];
List<Initiative> inArchieveInitiative = [];

// На голосовании
//https://www.roi.ru/api/petitions/poll.json

Future<List<InitiativePool>> getData(String region) async {
  Uri uri = Uri.parse('https://www.roi.ru/api/petitions/poll.json');
  final response =
  await http.Client().get(uri);
  if (response.statusCode == 200) {
    final jsonmap = jsonDecode(response.body);
    var initiativelist = jsonmap['data'];
    print(initiativelist);
    for (int i = 0; i < initiativelist.length; i++){
      if (initiativelist[i]['geo']['region'] == suggestons[indexSelectedRegion])
        PollInitiatives.add(InitiativePool.fromJson(initiativelist[i]));
    }
    print(PollInitiatives[0]);
  }
  return PollInitiatives;
}