import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:income_repository/income_repository.dart';
import 'package:intl/intl.dart';
import 'package:smart_business_hub/mobile/screens/balance/balance_screen.dart';
import 'package:smart_business_hub/mobile/screens/balance/bloc/create_income/create_income_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/date_selector.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/pay_selector.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/sale_view.dart';
import 'package:uuid/uuid.dart';

class FreeSalesScreen extends StatefulWidget {
  const FreeSalesScreen({super.key});

  @override
  State<FreeSalesScreen> createState() => _FreeSalesScreenState();
}

class _FreeSalesScreenState extends State<FreeSalesScreen> {
  TextEditingController incomeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController payMethodController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController clientsController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late Income income;
  bool isLoading = false;
  

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat.yMMMMd('es_AR').format(DateTime.now());
    income = Income.empty;
    income.saleId = const Uuid().v1();
  }

  @override
  Widget build(BuildContext context) {
    return
    BlocListener<CreateIncomeBloc, CreateIncomeState>(
      listener: (context, state) {
        if(state is CreateIncomeSuccess) {

        }else if (state is CreateIncomeLoading) {
          setState(() {
            isLoading = true;
            income = Income.empty;
          });
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BalanceScreen()));
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                ),
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          title: Text(
            'Nueva Venta',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          
        ),
        bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height*0.1,
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
          onPressed: () {
            final parsedDate = DateFormat.yMMMMd('es_AR').parse(dateController.text);
            setState(() {
              income.saleId = const Uuid().v1();
              income.dateTime = parsedDate;
              income.income = int.parse(incomeController.text);
              income.description = descriptionController.text;
              income.clients = clientsController.text;
              income.payMethod = income.payMethod;
              context.read<CreateIncomeBloc>().add(CreateIncome(income));
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SaleView())); 
              
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height*0.015,
              horizontal: MediaQuery.of(context).size.width*0.2
            )
          ),
          child: Text(
            'Crear Venta',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        )
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  DateSelector(),
                  PaySelector(),
                  ],  
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        'Valor',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 4,
                  child: TextFormField(
                    controller: incomeController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.dollarSign,
                        size: 16,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), 
                        borderSide: BorderSide.none),
                    ),
                    validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in this field';
                    }
                    return null;
                    }
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        'Concepto',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 4,
                  child: TextFormField(
                    controller: descriptionController,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                    decoration: InputDecoration(
                      hintText: 'Dale un nombre a tu venta',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        CupertinoIcons.tag,
                        size: 20,
                        color: Colors.black
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), 
                        borderSide: BorderSide.none),
                    ),
                    validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in this field';
                    }
                    return null;
                    }
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        'Cliente',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 4,
                  child: TextFormField(
                    controller: clientsController,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                    decoration: InputDecoration(
                      hintText: 'Escoge tu cliente',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        CupertinoIcons.person_add,
                        size: 20,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), 
                        borderSide: BorderSide.none),
                    ),
                    validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in this field';
                    }
                    return null;
                    }
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        'Selecciona el método de pago',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.26,
                    width: MediaQuery.of(context).size.width*4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  income.payMethod = 0;
                                });
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Ink(
                                height: MediaQuery.of(context).size.height*0.12,
                                width: MediaQuery.of(context).size.width*0.28,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(10),
                                  border: income.payMethod == 0
                                  ? Border.all(
                                    width: 2,
                                    color: Theme.of(context).colorScheme.onSecondary 
                                  )
                                  :null,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.grey.withValues(alpha: 0.5),
                                      spreadRadius: 1,
                                    )
                                  ]
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.moneyBill1,
                                      size: 33,
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.015),
                                    Text(
                                      'Efectivo',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.onSurface,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.01),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  income.payMethod = 1;
                                });
                                
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Ink(
                                height: MediaQuery.of(context).size.height*0.12,
                                width: MediaQuery.of(context).size.width*0.28,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(10),
                                  border: income.payMethod == 1
                                  ? Border.all(
                                    width: 2,
                                    color: Theme.of(context).colorScheme.onSecondary 
                                  )
                                  :null,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.grey.withValues(alpha: 0.5),
                                      spreadRadius: 1,
                                    )
                                  ]
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.creditCard,
                                      size: 33,
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.015),
                                    Text(
                                      'Tarjeta',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.onSurface,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.01),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  income.payMethod = 2;
                                });
                                
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Ink(
                                height: MediaQuery.of(context).size.height*0.12,
                                width: MediaQuery.of(context).size.width*0.28,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(10),
                                  border: income.payMethod == 2
                                  ? Border.all(
                                    width: 2,
                                    color: Theme.of(context).colorScheme.onSecondary 
                                  )
                                  :null,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.grey.withValues(alpha: 0.5),
                                      spreadRadius: 1,
                                    )
                                  ]
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/bank.png',
                                      scale: 30,
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.01),
                                    Text(
                                      'Transferencia',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.onSurface,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  income.payMethod = 3;
                                });
                                
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Ink(
                                height: MediaQuery.of(context).size.height*0.12,
                                width: MediaQuery.of(context).size.width*0.28,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(10),
                                  border: income.payMethod == 3
                                  ? Border.all(
                                    width: 2,
                                    color: Theme.of(context).colorScheme.onSecondary 
                                  )
                                  :null,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.grey.withValues(alpha: 0.5),
                                      spreadRadius: 1,
                                    )
                                  ]
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/others.png',
                                      scale: 10,
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.01),
                                    Text(
                                      'Otro',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.onSurface,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ),
                ),
              ],
            ),
          )  
        ),
      ),
    );
  }
}
