 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PieChartDataExpense extends StatefulWidget {
  const PieChartDataExpense({super.key});

  @override
  State<PieChartDataExpense> createState() => _PieChartDataExpenseState();
}

class _PieChartDataExpenseState extends State<PieChartDataExpense> {
  int _touchedIndex = -1;
  Map<String, double> expenseData = {};
  String _getPaymentMethod(int payMethod) {
    switch (payMethod) {
      case 0:
        return 'Efectivo';
      case 1:
        return 'Tarjeta';
      case 2:
        return 'Transferencia';
      case 3:
        return 'Otro';
      default:
        return 'Desconocido';
    }
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('expence').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
    
         Map<String, double> expenseData = {};

        for (var doc in snapshot.data!.docs) {
          String category = doc['category'] as String? ?? 'Unknown';
          double totalExpense = (doc['totalExpense'] as num).toDouble();
          
          if (expenseData.containsKey(category)) {
            expenseData[category] = expenseData[category]! + totalExpense;
          } else {
            expenseData[category] = totalExpense;
          }
        }
    
        List<PieChartSectionData> sections = expenseData.entries.map((entry) {
          final index = expenseData.keys.toList().indexOf(entry.key);
          final isTouched = _touchedIndex == index;
          final defaultColor = _touchedIndex == -1 ? Color.fromARGB(228, 193, 77, 69) : Colors.grey;
          return PieChartSectionData(
            showTitle: false,
            value: entry.value,
            color: isTouched ? Color.fromARGB(255, 193, 77, 69) : defaultColor,
            radius: isTouched ? 60 : 50,
            
          );
        }).toList();
    
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      sections: sections,
                      sectionsSpace: 5,
                      startDegreeOffset: 35,
                      centerSpaceRadius: 100,
                      pieTouchData: PieTouchData(
                        touchCallback: (p0, p1) {
                          if (p1 != null && p1.touchedSection != null) {
                            setState(() {
                              _touchedIndex = p1.touchedSection!.touchedSectionIndex;
                            });
                          } else {
                            setState(() {
                              _touchedIndex = -1;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('expence').snapshots(), 
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return SizedBox(
                          height:   1,
                          width: 1,
                          child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty ) {
                          return Text(
                            '\$ 0',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          );
                        }
                        final totalExpense = snapshot.data!.docs.fold<int>(
                          0, 
                          (previousValue, document) => previousValue + (document['totalExpense'] as int? ?? 0)
                        );
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _touchedIndex != -1
                              ? expenseData.keys.elementAt(_touchedIndex)
                              : 'Egresos',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              _touchedIndex != -1
                              ? '\$ ${expenseData.values.elementAt(_touchedIndex).toStringAsFixed(2)}'
                              : '\$ ${totalExpense.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        );
                      },
                    ) 
                  ),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('expence').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox(
                  height:   1,
                  width: 1,
                  child: CircularProgressIndicator());
                }
                final expenses = snapshot.data!.docs;
                return Expanded(
                  child: ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (context, int i) {
                      final expense = expenses[i]; 
                      return Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        child: InkWell(
                          onTap: () {},
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
                                        color: Color.fromARGB(255, 255, 222, 222),
                                        shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.moneyBill1,
                                          size: 23,
                                          color: Color.fromARGB(255, 193, 77, 69),
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
                                            expense['category'] ?? 'Sin categoria',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[700]
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              _getPaymentMethod(expense['payMethod']),
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                            SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                            Text(
                                              DateFormat('▪ d, MMMM -').add_jm().format(expense['dateTime'].toDate()),
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
                                      '\$ ${expense['totalExpense'].toStringAsFixed(2)}',
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
                      );
                    }
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}