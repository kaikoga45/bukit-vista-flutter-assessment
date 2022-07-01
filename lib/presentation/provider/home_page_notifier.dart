import 'package:bukit_vista_flutter_assessment/common/enum_state.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guess.dart';
import 'package:bukit_vista_flutter_assessment/domain/use_case/get_guess.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/booking.dart';

class HomePageNotifier extends ChangeNotifier {
  HomePageNotifier({required this.getGuess});

  /*
    This is state of guess being selected by user in home page.
    The default value are dummy guess data.
  */
  Guess _selectedGuess = Guess(
    name: "name",
    imgUrl:
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
    location: "location",
    email: "email",
    phoneNumber: 9373772,
    guessSince: DateTime.now(),
    booking: [
      Booking(
        id: "id",
        placeName: "placeName",
        status: "Confirmed",
        checkIn: DateTime.now(),
        checkOut: DateTime.now(),
      )
    ],
  );

  // This is getter for selected guess data.
  Guess get selectedGuess => _selectedGuess;
  // This is setter for selected guess data.
  set selectedGuess(Guess value) {
    _selectedGuess = value;
    notifyListeners();
  }

  // This is the state of the guess list
  List<Guess> _guess = [];
  // This is getter for guess list.
  List<Guess> get guess => _guess;

  // This is the state of the request.
  RequestState _requestState = RequestState.none;
  // This is getter for request state.
  RequestState get requestState => _requestState;

  //This is the information that is returned from the request when error happen.
  String _message = '';
  String get message => _message;

  final GetGuess getGuess;

  // This is a method to fetch the guess list.
  Future<void> getGuessList() async {
    /*
      Set state to loading and notify the listeners.
      So that the loading indicator will be shown to the user.
    */
    _requestState = RequestState.loading;
    notifyListeners();

    // Get the guess list.
    final result = await getGuess.execute();

    return result.fold((failed) {
      /*
        If the request failed, set the state to error and set the message.
        So that the error message will be shown to the user.
      */
      _requestState = RequestState.error;
      _message = failed.message;
      notifyListeners();
    }, (guess) {
      /*
        If the request succeeded, set the state to loaded and set the guess list.
        So that the guess list will be shown to the user.
      */
      _requestState = RequestState.loaded;
      _guess = guess;
      notifyListeners();
    });
  }
}
