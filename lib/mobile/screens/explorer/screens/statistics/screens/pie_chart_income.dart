import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';


class PieChartIncome extends StatefulWidget {
  const PieChartIncome({super.key});

  @override
  State<PieChartIncome> createState() => _PieChartIncomeState();
}

class _PieChartIncomeState extends State<PieChartIncome> {
  int _touchedIndex = -1;
  Map<String, double> incomeData = {};
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
      stream: FirebaseFirestore.instance.collection('income').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
    
        incomeData.clear();
        for (var doc in snapshot.data!.docs) {
          String description = doc['description'];
          double income = (doc['income'] as num).toDouble();
          incomeData[description] = income;
        }
    
        List<PieChartSectionData> sections = incomeData.entries.map((entry) {
          final index = incomeData.keys.toList().indexOf(entry.key);
          final isTouched = _touchedIndex == index;
          final defaultColor = _touchedIndex == -1 ? Color.fromRGBO(92, 226, 170, 1) : Colors.grey;
          return PieChartSectionData(
            showTitle: false,
            value: entry.value,
            color: isTouched ? Color.fromRGBO(92, 226, 170, 1) : defaultColor,
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
                      stream: FirebaseFirestore.instance.collection('income').snapshots(), 
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
                        final totalIncome = snapshot.data!.docs.fold<int>(
                          0, 
                          (previousValue, document) => previousValue + (document['income'] as int? ?? 0)
                        );
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _touchedIndex != -1
                              ? incomeData.keys.elementAt(_touchedIndex)
                              : 'Ingresos',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              _touchedIndex != -1
                              ? '\$ ${incomeData.values.elementAt(_touchedIndex).toStringAsFixed(2)}'
                              : '\$ ${totalIncome.toStringAsFixed(2)}',
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
              stream: FirebaseFirestore.instance.collection('income').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox(
                  height:   1,
                  width: 1,
                  child: CircularProgressIndicator());
                }
                final incomes = snapshot.data!.docs;
                return Expanded(
                  child: ListView.builder(
                    itemCount: incomes.length,
                    itemBuilder: (context, int i) {
                      final income = incomes[i]; 
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
                                            '${income['quantity']}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[700]
                                              ),
                                            ),
                                            SizedBox(width: MediaQuery.of(context).size.width *0.02,),
                                            Text(
                                            income['description'],
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
                                              _getPaymentMethod(income['payMethod']),
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                            SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                            Text(
                                              DateFormat('▪ d, MMMM -').add_jm().format(income['dateTime'].toDate()),
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
                                      '\$ ${income['income'].toStringAsFixed(2)}',
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
