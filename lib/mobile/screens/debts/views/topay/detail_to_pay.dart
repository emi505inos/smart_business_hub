import 'package:flutter/material.dart';

class DetailToPay extends StatefulWidget {
  const DetailToPay({super.key});

  @override
  State<DetailToPay> createState() => _DetailToPayState();
}

class _DetailToPayState extends State<DetailToPay>  with TickerProviderStateMixin{
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
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        titleSpacing: 100,
        title: Text(
          'Deudas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 1, 
        child: Column(
          children: <Widget>[
            TabBar(
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Deudas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Abonos',
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
                  Card.filled(child:Placeholder()),
                  Card.filled(child: Placeholder()),
                ]
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          ],
        ),
        
      ),
    );
  }
}