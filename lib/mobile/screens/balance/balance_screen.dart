import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/balance_by_inc_exp.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/bottom_buttons.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/date%20balance/date_balance.dart';
// import 'package:smart_business_hub/mobile/screens/balance/views/date%20balance/date_balance_view.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/date%20balance/date_selector_list.dart';
import 'package:smart_business_hub/mobile/screens/homescreen/views/new_business.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';
import 'package:smart_business_hub/mobile/screens/usermenu/user_menu.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  late DateBalance  dateBlance;
  late String selectedDate;
  late List<Map<String, dynamic>> filteredMonths;
  late ScrollController _scrollController;


@override
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es', null);
    _scrollController = ScrollController();

    int currentYear = DateTime.now().year;
    int previousYear = currentYear - 1;
    int currentMonthNumber = DateTime.now().month;


    filteredMonths = dateSelectorList.where((e) =>
      (e['select'] >= 10 && e['year'] == previousYear) ||  
      (e['select'] <= currentMonthNumber && e['year'] == currentYear)
    ).toList();


    String currentMonth = DateFormat('MMMM', 'es').format(DateTime.now());


    selectedDate = filteredMonths.firstWhere(
      (e) => e['mont'].toLowerCase() == currentMonth.toLowerCase(),
      orElse: () => {'mont': filteredMonths.last['mont']}
    )['mont'];


    WidgetsBinding.instance.addPostFrameCallback((_) {
      int index = filteredMonths.indexWhere((e) => e['mont'] == selectedDate);
      if (index != -1) {
        double scrollPosition = index * 100.0;
        _scrollController.animateTo(
          scrollPosition,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
      final int mesSeleccionado = selectedDate.isEmpty
      ? DateTime.now().month
      : dateSelectorList.firstWhere(
      (e) => e['mont'] == selectedDate,
      orElse: () => {'select': 0},
    )['select'];

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
              child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('business').snapshots(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final business = snapshot.data!.docs.first['name'];
                return Row(
                  children: [
                    Text(
                      '$business',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context).colorScheme.onSurface
                    )
                  ],
                );
                },
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
          preferredSize: Size.fromHeight(60), 
          child: 
          // DateBalanceView()
          SizedBox(
          height: MediaQuery.of(context).size.height*0.055,
          width: MediaQuery.of(context).size.width, 
          child: Column(
            children: [
            Divider(
                height: 5,
                indent: 1,
                endIndent: 1,
                thickness: 1.7,
                color: Theme.of(context).colorScheme.onSurface
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                    width: MediaQuery.of(context).size.width*0.87,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 20,),
                          ...dateSelectorList.map((e) =>
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedDate = e['mont'] ?? '';
                                });
                              },
                              borderRadius: BorderRadius.circular(5),
                              child: Ink(
                                height: MediaQuery.of(context).size.height*0.025,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: selectedDate.toLowerCase() == (e['mont'] ?? '').toLowerCase() 
                                  ? Colors.white
                                  : Color.fromRGBO(92, 226, 170, 1)
                                ),
                                child: Center(
                                  child: Text(
                                    e['mont'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              )
                            ), 
                          )
                        ],
                      )
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.02,
                    width: MediaQuery.of(context).size.width*0.004,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface
                    ),
                  ),
                  
                  Container(
                    width: MediaQuery.of(context).size.width*0.126,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary
                    ),
                    child: IconButton(
                    onPressed: () async{
                      DateTime? pickedDate = await 
                      showDatePicker (
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101)
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = DateFormat('MMMM').format(pickedDate);
                        });
                      }
                    }, 
                    icon: Icon(Icons.calendar_month)),
                  )
                ],
              ),
            ],
          ),
        )
        ),
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
                          stream: selectedDate == ''
                          ? FirebaseFirestore.instance.collection('income').snapshots()
                          : FirebaseFirestore.instance
                          .collection('income')
                          .where('dateTime', isGreaterThanOrEqualTo: DateTime(
                            DateTime.now().year,
                            mesSeleccionado,
                            1,
                          )).where('dateTime', isLessThan: DateTime(
                            DateTime.now().year,
                            mesSeleccionado + 1,
                            1,
                          ))
                          .snapshots(),
                          builder: (context, incomeSnapshot) {
                            if (!incomeSnapshot.hasData || incomeSnapshot.data!.docs.isEmpty) {
                              final totalIncome = 0;
                              return StreamBuilder<QuerySnapshot>(
                                stream: selectedDate == ''
                                ? FirebaseFirestore.instance.collection('expence').snapshots()
                                : FirebaseFirestore.instance
                                .collection('expence')
                                .where('dateTime', isGreaterThanOrEqualTo: DateTime(
                                  DateTime.now().year,
                                  mesSeleccionado,
                                  1,
                                )).where('dateTime', isLessThan: DateTime(
                                  DateTime.now().year,
                                  mesSeleccionado + 1,
                                  1,
                                ))
                                .snapshots(),
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
                                stream: selectedDate == ''
                                ? FirebaseFirestore.instance.collection('expence').snapshots()
                                : FirebaseFirestore.instance
                                .collection('expence')
                                .where('dateTime', isGreaterThanOrEqualTo: DateTime(
                                  DateTime.now().year,
                                  mesSeleccionado,
                                  1,
                                )).where('dateTime', isLessThan: DateTime(
                                  DateTime.now().year,
                                  mesSeleccionado + 1,
                                  1,
                                ))
                                .snapshots(),
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
                            stream: selectedDate == ''
                            ? FirebaseFirestore.instance.collection('income').snapshots()
                            : FirebaseFirestore.instance
                            .collection('income')
                            .where('dateTime', isGreaterThanOrEqualTo: DateTime(
                              DateTime.now().year,
                              mesSeleccionado,
                              1,
                            )).where('dateTime', isLessThan: DateTime(
                              DateTime.now().year,
                              mesSeleccionado + 1,
                              1,
                            ))
                            .snapshots(),
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
                              stream: selectedDate == ''
                                ? FirebaseFirestore.instance.collection('expence').snapshots()
                                : FirebaseFirestore.instance
                                .collection('expence')
                                .where('dateTime', isGreaterThanOrEqualTo: DateTime(
                                  DateTime.now().year,
                                  mesSeleccionado,
                                  1,
                                )).where('dateTime', isLessThan: DateTime(
                                  DateTime.now().year,
                                  mesSeleccionado + 1,
                                  1,
                                ))
                                .snapshots(), 
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
