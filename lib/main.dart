import 'package:bukit_vista_flutter_assessment/domain/entities/guess.dart';
import 'package:bukit_vista_flutter_assessment/presentation/pages/guess_detail_page.dart';
import 'package:bukit_vista_flutter_assessment/presentation/pages/main_navigation_page.dart';
import 'package:bukit_vista_flutter_assessment/presentation/provider/home_page_notifier.dart';
import 'package:bukit_vista_flutter_assessment/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.locator<HomePageNotifier>()),
      ],
      builder: (_, __) {
        return MaterialApp(
          title: 'Bukit Vista',
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: const MainNavigationPage(),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case MainNavigationPage.id:
                return MaterialPageRoute(
                    builder: (_) => const MainNavigationPage());
              case GuessDetailPage.id:
                final guess = settings.arguments as Guess;
                return MaterialPageRoute(
                    builder: (_) => GuessDetailPage(guess: guess));
              default:
                return MaterialPageRoute(
                  builder: (_) {
                    return const Scaffold(
                      body: Center(
                        child: Text('Page not found :('),
                      ),
                    );
                  },
                );
            }
          },
        );
      },
    );
  }
}
