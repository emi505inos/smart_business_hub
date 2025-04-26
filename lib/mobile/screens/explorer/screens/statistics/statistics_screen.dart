import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/explorer/explorer_screen.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExplorerScreen()));
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                ),
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          title: Text(
            'Estadisticas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          
        ),
      bottomNavigationBar: CustomeNavigationBar(),
    );
  }
}