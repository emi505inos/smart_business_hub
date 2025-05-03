import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/business/business_screen.dart';
import 'package:smart_business_hub/mobile/screens/homescreen/home_screen.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';


class MyMobileBody extends StatelessWidget {
  const MyMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: CustomeNavigationBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // HomeScreen()
              BusinessScreen()
            ],
          ),
        ),
      ),
    );
  }
}