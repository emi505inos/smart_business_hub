import 'package:flutter/material.dart';

import 'package:smart_business_hub/mobile/screens/explorer/explorer_screen.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/statistics/screens/pie_chart_data_expense.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/statistics/screens/pie_chart_income.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen>  with TickerProviderStateMixin{
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
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
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              initialIndex: 1,
              length: 2, 
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    labelColor: Theme.of(context).colorScheme.onSurface,
                    tabs:  <Widget>[
                      Tab(
                        child: Text(
                          'Ingresos',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Egresos',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        Card.filled(child: PieChartIncome()), 
                        Card.filled(child: PieChartDataExpense()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}