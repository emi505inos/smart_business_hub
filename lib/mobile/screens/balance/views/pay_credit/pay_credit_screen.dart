import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_business_hub/mobile/screens/balance/balance_screen.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/date_selector.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/pay_selector.dart';

import '../../bloc/create_income/create_income_bloc.dart';

class PayCreditScreen extends StatefulWidget {
  const PayCreditScreen({super.key});

  @override
  State<PayCreditScreen> createState() => _PayCreditScreenState();
}

class _PayCreditScreenState extends State<PayCreditScreen> {
    TextEditingController incomeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController payMethodController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController clientsController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return
      BlocListener<CreateIncomeBloc, CreateIncomeState>(
        listener: (context, state) {
          if(state is CreateIncomeSuccess) {

          }else if (state is CreateIncomeLoading) {
            setState(() {
              isLoading = true;
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
                setState(() {
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateSelector(),
                  PaySelector()
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
            ],
          ),
        ),
      )
    );
  }
}