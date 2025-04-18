import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/transaction/expense_transaction.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/transaction/income_transaction.dart';

class BalanceByIncExp extends StatefulWidget {
  const BalanceByIncExp({super.key});

  @override
  State<BalanceByIncExp> createState() => _BalanceByIncExpState();
}

class _BalanceByIncExpState extends State<BalanceByIncExp> with TickerProviderStateMixin{
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
      initialIndex: 1,
      length: 2, 
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Ingresos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface
                  )
                ),
              ),
              Tab(
                child: Text(
                  'Egresos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface
                  )
                ),
              ),
            ]
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
              Card.filled(
                child: IncomeTransaction()
              ),
              Card.filled(
                child: ExpenseTransaction()
              ),
              ]
            ),
          ),
          SizedBox(height: 20,),
        ],
      )
    );
  }
}