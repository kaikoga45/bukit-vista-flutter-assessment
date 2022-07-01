import 'package:bukit_vista_flutter_assessment/domain/entities/booking.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guess.dart';
import 'package:bukit_vista_flutter_assessment/presentation/widget/reusable_back_button_nav.dart';
import 'package:bukit_vista_flutter_assessment/presentation/widget/reusable_item_card.dart';
import 'package:bukit_vista_flutter_assessment/presentation/widget/reusable_header.dart';
import 'package:bukit_vista_flutter_assessment/presentation/widget/reusable_tab.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GuessDetailPage extends StatelessWidget {
  static const id = '/guess_detail';

  const GuessDetailPage({Key? key, required this.guess}) : super(key: key);

  final Guess guess;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Drawer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            const ReusableHeader(
                title: "Guest Details", leading: ReusableBackButton()),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ReusableItemCard(
                    imgUrl: guess.imgUrl,
                    title: guess.name,
                    bodyText:
                        "Guest since ${DateFormat('MMM').format(guess.guessSince)} ${guess.guessSince.year}",
                  ),
                ),
                ReusableTab(tabs: const [
                  Tab(text: "Overview"),
                  Tab(text: "Bookings"),
                  Tab(text: "Personas"),
                ], view: [
                  OverviewView(guess: guess),
                  BookingsView(bookings: guess.booking),
                  const PersonasView()
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OverviewView extends StatelessWidget {
  const OverviewView({Key? key, required this.guess}) : super(key: key);

  final Guess guess;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          buildListTile("Email", guess.email, textTheme),
          buildListTile("Phone Number", "+${guess.phoneNumber}", textTheme),
          buildListTile("Guess Origin", guess.location, textTheme),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, String subtitle, TextTheme textTheme) {
    return ListTile(
      title: Text(
        title,
        style: textTheme.overline!.apply(color: Colors.black45),
      ),
      subtitle: Text(
        subtitle,
        style: textTheme.caption!.copyWith(fontWeight: FontWeight.bold),
      ),
      dense: true,
    );
  }
}

class BookingsView extends StatelessWidget {
  const BookingsView({Key? key, required this.bookings}) : super(key: key);

  final List<Booking> bookings;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(25),
      itemCount: bookings.length,
      itemBuilder: (_, index) {
        final booking = bookings[index];
        final isRed = booking.status == "Canceled" ? true : false;
        return ReusableItemCard(
          leading: const Icon(
            Icons.home_outlined,
            color: Color(0xFFF0C47F),
          ),
          title: booking.id,
          subtitle: booking.placeName,
          bodyText:
              '${DateFormat("d MMM yyyy").format(booking.checkIn)} - ${DateFormat("d MMM yyyy").format(booking.checkOut)}',
          statusMessage: booking.status,
          isRed: isRed,
        );
      },
    );
  }
}

class PersonasView extends StatelessWidget {
  const PersonasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Personas");
  }
}
