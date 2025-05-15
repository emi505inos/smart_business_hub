import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/debts/views/receivable/screens/pay_receivable.dart';
import 'package:smart_business_hub/mobile/screens/debts/views/receivable/screens/receivable_debts.dart';

class DetailReceivable extends StatefulWidget {
  final String clientId;
  const DetailReceivable({super.key, required this.clientId});

  @override
  State<DetailReceivable> createState() => _DetailReceivableState();
}

class _DetailReceivableState extends State<DetailReceivable> with TickerProviderStateMixin {
  late String  clientId2;
  late Stream<QuerySnapshot>  clientIdStream;
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    clientId2 = widget.clientId;
    clientIdStream = FirebaseFirestore.instance
      .collection('creditDebt')
      .where('client', isEqualTo: widget.clientId)
      .snapshots();
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
        title: StreamBuilder(
            stream: clientIdStream, 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
              }if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    'No se encontraron deudas',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                  ),
                );
              }
              final debts = snapshot.data!.docs.first;
             return 
             Text(
                '${debts['client']}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              );  
            },
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
                  Card.filled(child: ReceivableDebts(clientId: clientId2,)),
                  Card.filled(child: PayReceivable(clientId: clientId2,)),
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