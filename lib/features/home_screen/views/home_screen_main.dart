import 'package:coffee_shop_app/features/home_screen/views/widgets/home_screen.dart';
import 'package:coffee_shop_app/features/home_screen/views/widgets/home_screen_shimmer.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({super.key});

  @override
  State<HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {

  bool _showShimmer = true;

  @override
  void initState() {
    super.initState();

    ///Todo: Replace manual shimmer state with network calls
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 5), () {
        setState(() {
          _showShimmer = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showShimmer
        ? HomeScreenShimmer()
        : HomeScreen();
  }
}
