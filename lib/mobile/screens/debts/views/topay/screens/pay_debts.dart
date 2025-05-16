import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PayDebts extends StatefulWidget {
  final  String  debtId;
  const PayDebts({super.key, required this.debtId});

  @override
  State<PayDebts> createState() => _PayDebtsState();
}

class _PayDebtsState extends State<PayDebts> {
  late Stream<QuerySnapshot>  debtIdStream;

  @override
  void initState() {
    super.initState();
    debtIdStream = FirebaseFirestore.instance
      .collection('debts')
      .where('suplier', isEqualTo: widget.debtId)
      .snapshots();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: debtIdStream, 
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
                0, (debtSum, item) => debtSum + (item['debtAmount'] as num).toDouble());
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
                        .collection('debts')
                        .where('suplier', isEqualTo: widget.debtId)
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
            .collection('debts')
            .where('suplier', isEqualTo: widget.debtId)
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
              var debts = snapshot.data!.docs.first['debts'] as List<dynamic>;
              return Column(
                children: [
                  SizedBox(
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: debts.length,
                    itemBuilder: (context, i) {
                      final debt = debts[i];
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
                                              (debt['description']?.isEmpty ?? true) ? 'Sin descripción' : debt['description'],
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
                                                DateFormat('d, MMMM yyyy').format(debt['dateTime'].toDate()),
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
                                        '\$ ${debt['debtAmount']}',
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