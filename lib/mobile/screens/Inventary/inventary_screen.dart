import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';

class InventaryScreen extends StatelessWidget {
  const InventaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomeNavigationBar(),
    );
  }
}