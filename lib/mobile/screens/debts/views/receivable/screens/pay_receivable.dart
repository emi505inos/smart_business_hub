import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PayReceivable extends StatefulWidget {
  final  String  clientId;
  const PayReceivable({super.key, required this.clientId});

  @override
  State<PayReceivable> createState() => _PayReceivableState();
}

class _PayReceivableState extends State<PayReceivable> {
  late Stream<QuerySnapshot>  clientIdStream;
  @override
  void initState() {
    super.initState();
    clientIdStream = FirebaseFirestore.instance
      .collection('creditDebt')
      .where('client', isEqualTo: widget.clientId)
      .snapshots();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
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
              var debts = snapshot.data!.docs.first['debts'] as List<dynamic>;
              double totalDebt = debts.fold(
                0, (debtSum, item) => debtSum + (item['amount'] as num).toDouble());
             return Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.onPrimary,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${totalDebt.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                        .collection('creditDebt')
                        .where('client', isEqualTo: widget.clientId)
                        .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                          }
                          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
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
                          int totalDebtsCount = snapshot.data!.docs.fold<int>(
                            0,
                            (previousValue, document) {
                              final data = document.data() as Map<String, dynamic>?;
                              if (data != null && data.containsKey('debts')) {
                                List<dynamic> debtsList = data['debts'] ?? [];
                                return previousValue + debtsList.length;
                              }
                              return previousValue;
                            },
                          );
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.07,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(92, 226, 170, 0.5),
                              shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Text(
                                '$totalDebtsCount',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onSecondary
                                )
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enviar recordatorio',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0,
                            color: Theme.of(context).colorScheme.onSurface,
                            spreadRadius: 2,
                          ) 
                        ]
                      ),
                      child: IconButton(
                        onPressed: () {
                          
                        }, 
                        icon: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          size: 40,
                          
                        )
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.07,),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0,
                            color: Theme.of(context).colorScheme.onSurface,
                            spreadRadius: 2,
                          ) 
                        ]
                      ),
                      child: IconButton(
                        onPressed: () {
                          
                        }, 
                        icon: FaIcon(
                          FontAwesomeIcons.envelope,
                          size: 40,
                        )
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
            .collection('creditDebt')
            .where('client', isEqualTo: widget.clientId)
            .snapshots(), 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
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
              var creditDebts = snapshot.data!.docs.first['debts'] as List<dynamic>;
              return Column(
                children: [
                  SizedBox(
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: creditDebts.length,
                    itemBuilder: (context, i) {
                      final creditDebt = creditDebts[i];
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              
                            },
                            child: Ink(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 41,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height *0.085,
                                        width: MediaQuery.of(context).size.width *0.085,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(92, 226, 170, 0.5),
                                          shape: BoxShape.circle
                                        ),
                                        child: Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.moneyBill1,
                                            size: 23,
                                            color: Theme.of(context).colorScheme.onSecondary
                                          )
                                        )
                                      ),
                                      SizedBox(width:MediaQuery.of(context).size.width * 0.02,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                              creditDebt['description'],
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[700]
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Deuda',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                              Text(
                                                DateFormat('d, MMMM yyyy').format(creditDebt['dateTime'].toDate()),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey[700]
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$ ${creditDebt['amount']}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      );
                      
                    },
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}