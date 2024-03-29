import 'package:animate_do/animate_do.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:tell_me/views/main_view.dart';
import 'package:tell_me/widgets/card.dart';

import '../utils/card_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ScaffoldPage(
      content: FutureBuilder(
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return FlipInY(
                  duration: const Duration(seconds: 2),
                  child: MyCard(path: CardNames.cards[0]));
            }

            return const MainView();
          },
          future: loading()),
    );
  }

  Future<bool> loading() async {
    await Future.delayed(const Duration(seconds: 4));

    return true;
  }
}
