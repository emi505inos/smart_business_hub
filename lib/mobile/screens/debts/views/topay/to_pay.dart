import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_business_hub/mobile/screens/debts/views/topay/detail_to_pay.dart';

class ToPay extends StatefulWidget {
  const ToPay({super.key});

  @override
  State<ToPay> createState() => _ToPayState();
}

class _ToPayState extends State<ToPay> {
  var dateNow = DateFormat.yMMMMd('es_AR').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(15),
            child: Ink(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: 3,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.doc_plaintext,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                  Text(
                  'Reportes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface
                    )
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  color: Colors.grey.withValues(alpha: 0.5),
                  spreadRadius: 1,
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('debts').snapshots(), 
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          }
                          final totalCreditDebt = snapshot.data!.docs.fold<int>(
                            0, 
                            (previousValue, document) {
                              final data = document.data() as Map<String, dynamic>?;
                              if (data != null && data.containsKey('debts')) {
                                List<dynamic> debtsList = data['debts'] ?? [];
                                int sumDebts = debtsList.fold(
                                  0,
                                  (debtSum , debt) => debtSum + (debt['debtAmount'] as int? ?? 0),
                                );
                                return previousValue + sumDebts;
                              }
                              return previousValue;
                            }
                          );
                          return Text(
                            '\$ $totalCreditDebt',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          );
                        },
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('debts').snapshots(), 
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          }
                          final totalAmount = snapshot.data!.docs.fold<int>(
                            0, 
                            (previousValue, document) {
                              final data = document.data() as Map<String, dynamic>?;
                              if (data != null && data.containsKey('debts')) {
                                List<dynamic> debtsList = data['debts'] ?? [];
                                int amountCount = debtsList.length;
      
                                return previousValue + amountCount;
                              }
                              return previousValue;
                            }
                          );
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.07,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(92, 226, 170, 0.35),
                              shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Text(
                                '$totalAmount',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[700]
                                )
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('debts').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }
                      Set<String> uniqueClients = {};
                      for (var doc in snapshot.data!.docs) {
                        uniqueClients.add(doc['suplier']);
                      }
                      return Text(
                        '${uniqueClients.length} Deuda(s)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('debts').snapshots(), 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(height: 1,width: 1,child: CircularProgressIndicator());
              } if (!snapshot.hasData || snapshot.data == null ||snapshot.data!.docs.isEmpty) {
                return Center(
                child: Text(
                  'No hay datos disponibles',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSurface
                    ),
                  ),
                );
              }
              final debts = snapshot.data!.docs;
              return Column(
                children: [
                  SizedBox(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: debts.length,
                    itemBuilder: (context, i) {
                      final debt = debts[i];
                      final data = debt.data() as Map<String, dynamic>?;
                      int totalDebtAmount = 0;
                      if (data != null && data.containsKey('debts')) {
                        List<dynamic> debtsList = data['debts'] ?? [];
                        totalDebtAmount = debtsList.fold<int>(0, (debtSum, debt) {
                          if (debt is Map<String, dynamic> && debt.containsKey('debtAmount')) {
                            return debtSum + (debt['debtAmount'] as int);
                          }
                          return debtSum;
                        });
                      }
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailToPay(debtId: debt['suplier'],),));
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Ink(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onPrimary,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1,
                                    color: Colors.grey.withValues(alpha: 0.5),
                                    spreadRadius: 1,
                                  )
                                ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      debt['suplier'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.onSurface
                                      )
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$ $totalDebtAmount',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey
                                          )
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context).size.height * 0.05,
                                              width: MediaQuery.of(context).size.width * 0.05,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(92, 226, 170, 0.35),
                                                shape: BoxShape.circle
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${debt['debts'].length}',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green[700]
                                                  )
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              CupertinoIcons.chevron_forward,
                                              size: 25,
                                              color: Theme.of(context).colorScheme.onSurface
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                    Text(
                                      dateNow,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[700]
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.02,)
                        ],
                      );
                    },
                  ),
                )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}