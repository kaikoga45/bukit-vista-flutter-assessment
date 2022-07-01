import 'package:bukit_vista_flutter_assessment/data/models/guess_model.dart';

class GuessListModel {
  final List<GuessModel> guessList;

  GuessListModel({required this.guessList});

  factory GuessListModel.fromJson(Map<String, dynamic> json) => GuessListModel(
        guessList:
            (json["guess"] as List).map((x) => GuessModel.fromJson(x)).toList(),
      );
}
