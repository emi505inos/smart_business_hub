import 'package:flutter/material.dart';
import 'package:smart_business_hub/desktop/desktop_body.dart';
import 'package:smart_business_hub/mobile/mobile_body.dart';
import 'package:smart_business_hub/responsive/responsive_leyout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ResponsiveLeyout(
        mobileBody: MyMobileBody(), 
        desktopBody: MyDesktopBody()),
    );
  }
}