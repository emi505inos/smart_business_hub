import 'package:business_repository/repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_business_hub/mobile/screens/balance/balance_screen.dart';
import 'package:smart_business_hub/mobile/screens/balance/bloc/create_income/create_income_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/free_sales_screen.dart';

class SaleView extends StatefulWidget {
  const SaleView({super.key});

  @override
  State<SaleView> createState() => _SaleViewState();
}

class _SaleViewState extends State<SaleView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.13,
        color: Theme.of(context).colorScheme.onSecondary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.doc_plaintext,
                    size: 35,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () {
                  },
                ),
                Text(
                  'Comprobante',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.solidCircleXmark,
                    size: 35,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BalanceScreen()));
                  },
                ),
                Text(
                  'Finalizar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 35,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider(
                      create: (context) => CreateIncomeBloc(
                        FirebaseIncomeRepo()
                      ),
                      child: FreeSalesScreen(),
                    )
                  )
                );
                  },
                ),
                Text(
                  'Nueva Venta',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
        .collection('income')
        .orderBy('dateTime')
        .limit(1)
        .snapshots(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No se encontraron ingresos',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
              ),
            );
          }
          final income = snapshot.data!.docs.first['income'] ?? 0;
          return Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Center(
                  child: Icon(
                    Icons.check_circle_outline_outlined,
                    size: 100,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Text(
                    '¡Creaste una Venta!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  Text(
                    'Se registró una venta por un valor de ',
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  Text(
                    '\$ $income',
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
      
    );
  }
}