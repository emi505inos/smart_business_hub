import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/debts/views/receivable.dart';
import 'package:smart_business_hub/mobile/screens/debts/views/to_pay.dart';

class DebtsSelector extends StatefulWidget {
  const DebtsSelector({super.key});

  @override
  State<DebtsSelector> createState() => _DebtsSelectorState();
}

class _DebtsSelectorState extends State<DebtsSelector>  with TickerProviderStateMixin {
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
    return DefaultTabController(
      length: 2,
      initialIndex: 1, 
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Por cobrar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Por pagar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.6,
            child:TabBarView(
              controller: _tabController, 
              children: <Widget>[
                Card.filled(child:Receivable()),
                Card.filled(child: ToPay()),
              ]
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
        ],
      ),
      
    );
  }
}