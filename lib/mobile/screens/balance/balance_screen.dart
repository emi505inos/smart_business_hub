import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/balance_by_inc_exp.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/bottom_buttons.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/date%20balance/date_balance_view.dart';
import 'package:smart_business_hub/mobile/screens/homescreen/views/new_business.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';
import 'package:smart_business_hub/mobile/screens/usermenu/user_menu.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserMenuScreen(),
                        ));
                  },
                  icon: Icon(
                    Icons.person_outline_outlined,
                    color: Theme.of(context).colorScheme.onSurface,
                  ))),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: false,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  builder: (context) {
                    return NewBusiness();
                  },
                );
              },
              child: Row(
                children: [
                  Text(
                    'Empresa',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Icon(Icons.arrow_drop_down,
                      color: Theme.of(context).colorScheme.onSurface)
                ],
              ),
            ),
            Text(
              'Propietario',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
                onTap: () {},
                child: Icon(
                  FontAwesomeIcons.filter,
                  size: 25,
                  color: Theme.of(context).colorScheme.onSurface,
                )),
          )
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(60), child: DateBalanceView()),
      ),
      bottomNavigationBar: CustomeNavigationBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 4,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 1,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Balance',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700]),
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('income').snapshots(),
                          builder: (context, incomeSnapshot) {
                            if (!incomeSnapshot.hasData || incomeSnapshot.data!.docs.isEmpty) {
                              final totalIncome = 0;
                              return StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance.collection('expence').snapshots(),
                                builder: (context, expenseSnapshot) {
                                  if (!expenseSnapshot.hasData || expenseSnapshot.data!.docs.isEmpty) {
                                    final totalExpense = 0;
                                    int balance = totalIncome - totalExpense;
                                    return Text(
                                      balance >= 0
                                          ? '\$ $balance'
                                          : '-\$ ${balance.abs()}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: balance >= 0
                                            ? Theme.of(context).colorScheme.onSecondary
                                            : Theme.of(context).colorScheme.secondary,
                                      ),
                                    );
                                  } else {
                                    final totalExpense = expenseSnapshot.data!.docs.fold<int>(
                                      0,
                                      (previousValue, document) =>
                                          previousValue + (document['totalExpense'] as int? ?? 0),
                                    );
                                    int balance = totalIncome - totalExpense;
                                    return Text(
                                      balance >= 0
                                          ? '\$ $balance'
                                          : '-\$ ${balance.abs()}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: balance >= 0
                                            ? Theme.of(context).colorScheme.onSecondary
                                            : Theme.of(context).colorScheme.secondary,
                                      ),
                                    );
                                  }
                                },
                              );
                            } else {
                              final totalIncome = incomeSnapshot.data!.docs.fold<int>(
                                0,
                                (previousValue, document) =>
                                previousValue + (document['income'] as int? ?? 0),
                              );
                              return StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance.collection('expence').snapshots(),
                                builder: (context, expenseSnapshot) {
                                  if (!expenseSnapshot.hasData || expenseSnapshot.data!.docs.isEmpty) {
                                    final totalExpense = 0; 
                                    int balance = totalIncome - totalExpense;
                                    return Text(
                                      balance >= 0
                                          ? '\$ $balance'
                                          : '-\$ ${balance.abs()}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: balance >= 0
                                            ? Theme.of(context).colorScheme.onSecondary
                                            : Theme.of(context).colorScheme.secondary,
                                      ),
                                    );
                                  } else {
                                    final totalExpense = expenseSnapshot.data!.docs.fold<int>(
                                      0,
                                      (previousValue, document) =>
                                          previousValue + (document['totalExpense'] as int? ?? 0),
                                    );
                                    int balance = totalIncome - totalExpense;
                                    return Text(
                                      balance >= 0
                                          ? '\$ $balance'
                                          : '-\$ ${balance.abs()}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: balance >= 0
                                            ? Theme.of(context).colorScheme.onSecondary
                                            : Theme.of(context).colorScheme.secondary,
                                      ),
                                    );
                                  }
                                },
                              );
                            }
                          },
                        ) 
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Divider(
                        height: 5,
                        indent: 1,
                        endIndent: 1,
                        thickness: 1.7,
                        color: Colors.grey),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                FaIcon(FontAwesomeIcons.arrowTrendUp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  'Ingresos',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance.collection('income').snapshots(), 
                              builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return CircularProgressIndicator();
                              }
                              if (!snapshot.hasData || snapshot.data!.docs.isEmpty ) {
                                return Text(
                                  '\$ 0',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                );
                              }
                              final totalIncome = snapshot.data!.docs.fold<int>(
                                0, 
                                (previousValue, document) => previousValue + (document['income'] as int? ?? 0)
                              );
                              return Text(
                                '\$ $totalIncome',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.004,
                          decoration: BoxDecoration(color: Colors.grey),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.arrowTrendUp,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  'Egresos',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance.collection('expence').snapshots(), 
                              builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return CircularProgressIndicator();
                              }
                              if (!snapshot.hasData || snapshot.data!.docs.isEmpty ) {
                                return Text(
                                  '\$ 0',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                );
                              }
                              final totalExpense = snapshot.data!.docs.fold<int>(
                                0, 
                                (previousValue, document) => previousValue + (document['totalExpense'] as int? ?? 0)
                              );
                              return Text(
                                '\$ $totalExpense',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Divider(
                        height: 5,
                        indent: 1,
                        endIndent: 1,
                        thickness: 1.7,
                        color: Colors.grey),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Descargar Reportes',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                'Ver Balance',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[700]),
                              ),
                              Icon(Icons.keyboard_arrow_right_outlined,
                                  color: Colors.blue[700])
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          BalanceByIncExp(),
          
          BottomButtons(),
        ],
      ),
    );
  }
}
