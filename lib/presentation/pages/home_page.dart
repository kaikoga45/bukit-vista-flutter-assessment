import 'package:bukit_vista_flutter_assessment/common/enum_state.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guess.dart';
import 'package:bukit_vista_flutter_assessment/presentation/provider/home_page_notifier.dart';
import 'package:bukit_vista_flutter_assessment/presentation/widget/reusable_item_card.dart';
import 'package:bukit_vista_flutter_assessment/presentation/widget/reusable_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/booking.dart';
import 'guess_detail_page.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<HomePageNotifier>(context, listen: false).getGuessList());
  }

  Guess? selectedGuessData = _dummyGuess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawerEnableOpenDragGesture: false,
      drawer: GuessDetailPage(
        guess: selectedGuessData!,
      ),
      appBar: const ReusableHeader(
        title: "Guess List",
        displaySearchField: true,
        leading: null,
      ),
      body: Consumer<HomePageNotifier>(builder: (_, provider, __) {
        switch (provider.requestState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.loaded:
            return ListView.builder(
              itemCount: provider.guess.length,
              padding: const EdgeInsets.all(30),
              itemBuilder: (_, index) {
                final guess = provider.guess[index];
                return ReusableItemCard(
                  title: guess.name,
                  bodyText: guess.location,
                  imgUrl: guess.imgUrl,
                  onTap: () {
                    setState(() => selectedGuessData = guess);
                    _key.currentState!.openDrawer();
                  },
                );
              },
            );
          case RequestState.error:
            return Center(child: Text("Error : ${provider.message}"));
          default:
            return const SizedBox.shrink();
        }
      }),
    );
  }
}

final Guess _dummyGuess = Guess(
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
