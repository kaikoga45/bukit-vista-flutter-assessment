import 'package:bukit_vista_flutter_assessment/common/enum_state.dart';
import 'package:bukit_vista_flutter_assessment/presentation/provider/home_page_notifier.dart';
import 'package:bukit_vista_flutter_assessment/presentation/widget/reusable_item_card.dart';
import 'package:bukit_vista_flutter_assessment/presentation/widget/reusable_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'guess_detail_page.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomePageNotifier _homePageNotifier;

  @override
  void initState() {
    super.initState();
    _homePageNotifier = Provider.of<HomePageNotifier>(context, listen: false);
    Future.microtask(() => _homePageNotifier.getGuessList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawerEnableOpenDragGesture: false,
      drawer: GuessDetailPage(
        guess: _homePageNotifier.selectedGuess,
      ),
      appBar: const ReusableHeader(
        title: "Guess List",
        displaySearchField: true,
        leading: null,
      ),
      body: Consumer<HomePageNotifier>(
        builder: (_, provider, __) {
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
                      setState(() => _homePageNotifier.selectedGuess = guess);
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
        },
      ),
    );
  }
}
