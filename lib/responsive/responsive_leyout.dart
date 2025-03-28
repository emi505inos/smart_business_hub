import 'package:flutter/material.dart';
import 'package:smart_business_hub/responsive/dimensions.dart';

class ResponsiveLeyout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  const ResponsiveLeyout({
    super.key, 
    required this.mobileBody, 
    required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileBody;
        }else {
          return desktopBody;
        }
      },
    );
  }
}