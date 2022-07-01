import 'package:bukit_vista_flutter_assessment/common/enum_state.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guess.dart';
import 'package:bukit_vista_flutter_assessment/domain/use_case/get_guess.dart';
import 'package:flutter/material.dart';

class HomePageNotifier extends ChangeNotifier {
  HomePageNotifier({required this.getGuess});

  List<Guess> _guess = [];
  List<Guess> get guess => _guess;

  RequestState _requestState = RequestState.none;
  RequestState get requestState => _requestState;

  String _message = '';
  String get message => _message;

  final GetGuess getGuess;

  Future<void> getGuessList() async {
    _requestState = RequestState.loading;
    notifyListeners();

    final result = await getGuess.execute();
    return result.fold((failed) {
      _requestState = RequestState.error;
      _message = failed.message;
      notifyListeners();
    }, (guess) {
      _requestState = RequestState.loaded;
      _guess = guess;
      notifyListeners();
    });
  }
}
