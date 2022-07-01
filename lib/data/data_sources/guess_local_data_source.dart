import 'dart:convert';

import 'package:bukit_vista_flutter_assessment/data/models/guess_model.dart';
import 'package:flutter/material.dart';

import '../models/guess_list_model.dart';

abstract class GuessLocalDataSource {
  Future<List<GuessModel>> getGuess();
}

class GuessLocalDataSourceImpl implements GuessLocalDataSource {
  GuessLocalDataSourceImpl({required this.client});
  final AssetBundle client;

  final guessDataPath = 'dummy_data/guess.json';

  @override
  Future<List<GuessModel>> getGuess() async {
    final response = await client.loadString(guessDataPath);
    return GuessListModel.fromJson(json.decode(response)).guessList;
  }
}
