import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';

class SupliersScreen extends StatefulWidget {
  const SupliersScreen({super.key});

  @override
  State<SupliersScreen> createState() => _SupliersScreenState();
}

class _SupliersScreenState extends State<SupliersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: CustomeNavigationBar(),
    );
  }
}