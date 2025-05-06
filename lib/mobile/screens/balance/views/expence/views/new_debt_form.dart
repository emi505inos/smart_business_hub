import 'package:business_repository/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/expence/bloc/create_debt/create_debt_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/expence/models/categories_list.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/expence/models/supplies_list.dart';
import 'package:uuid/uuid.dart';

class NewDebtForm extends StatefulWidget {
  const NewDebtForm({super.key});

  @override
  State<NewDebtForm> createState() => _NewDebtFormState();
}

class _NewDebtFormState extends State<NewDebtForm> {
  TextEditingController expenceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController payMethodController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController clientsController = TextEditingController();
  String selectedOption = 'Selecciona una opción';
  String selectedSupplier = 'Escoge tu proveedor';
  DateTime selectedDate = DateTime.now();
  late Debts debt;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat.yMMMMd('es_AR').format(DateTime.now());
    debt = Debts.empty;
    debt.debtId = const Uuid().v1();
  }

  @override
  Widget build(BuildContext context) {
    return 
    BlocListener<CreateDebtBloc, CreateDebtState>(
      listener: (context, state) {
       if (state is CreateDebtSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Deuda creada con éxito'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        } else if (state is CreateDebtFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Deuda al crear el gasto'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: 
      Scaffold(
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
                Navigator.pop(context);
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
          'Nuevo Gasto',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.1,
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                final parsedDate = DateFormat.yMMMMd('es_AR').parse(dateController.text);
                setState(() {
                  debt.debtId = const Uuid().v1();
                  debt.debtAmount = int.parse(expenceController.text);
                  debt.clients = selectedOption;
                  debt.payMethod = debt.payMethod;
                  debt.dateTime = parsedDate;
                  debt.description = descriptionController.text;
                  debt.suplier = selectedSupplier;
                  context
                      .read<CreateDebtBloc>()
                      .add(CreateDebt(debt));
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onSecondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.015,
                      horizontal: MediaQuery.of(context).size.width * 0.2)),
              child: Text(
                'Crear Deuda',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            )
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Fecha del gasto',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 4,
                  child: TextFormField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: debt.dateTime,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now());
                      if (newDate != null) {
                        setState(() {
                          dateController.text =
                              DateFormat.yMMMMd('es_AR').format(newDate);
                          debt.dateTime = newDate;
                        });
                      }
                    },
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Categoría del gasto',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Escoge una categoría',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                            FontAwesomeIcons.solidCircleXmark,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface)),
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                ...categories.map(
                                  (category) => ListTile(
                                    leading: Icon(
                                      category['icon'],
                                      size: 30,
                                    ),
                                    title: Text(
                                      category['name'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(context).colorScheme.onSurface,
                                      ),
                                    ),
                                    trailing: Icon(
                                      selectedOption == category['name']
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_unchecked,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        selectedOption = category['name'];
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Ink(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedOption,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: Theme.of(context).colorScheme.onSurface,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        'Valor',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 4,
                  child: TextFormField(
                      controller: expenceController,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        }
                        return null;
                      }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      'Proveedor',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Escoge tu proveedor',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                            FontAwesomeIcons.solidCircleXmark,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface)),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                                SearchBar(
                                    elevation: WidgetStateProperty.all(0),
                                    backgroundColor:
                                        WidgetStateProperty.all(Colors.white),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    leading: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                      size: 26,
                                    ),
                                    hintText: 'Busca',
                                    hintStyle: WidgetStatePropertyAll(
                                      TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )),
                                SizedBox(height: 16.0),
                                ...supplies.map(
                                  (supply) => ListTile(
                                    leading: Icon(
                                      supply['icon'],
                                      size: 30,
                                    ),
                                    title: Text(
                                      supply['name'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(context).colorScheme.onSurface,
                                      ),
                                    ),
                                    trailing: Icon(
                                      selectedSupplier == supply['name']
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_unchecked,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        selectedSupplier = supply['name'];
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Ink(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedSupplier,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: Theme.of(context).colorScheme.onSurface,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        'Método de pago',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.26,
                    width: MediaQuery.of(context).size.width * 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  debt.payMethod = 0;
                                });
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Ink(
                                height: MediaQuery.of(context).size.height * 0.12,
                                width: MediaQuery.of(context).size.width * 0.28,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    borderRadius: BorderRadius.circular(10),
                                    border: debt.payMethod == 0
                                        ? Border.all(
                                            width: 2,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary)
                                        : null,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1,
                                        color: Colors.grey.withValues(alpha: 0.5),
                                        spreadRadius: 1,
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.moneyBill1,
                                      size: 33,
                                    ),
                                    SizedBox(
                                        height: MediaQuery.of(context).size.height *
                                            0.015),
                                    Text(
                                      'Efectivo',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(context).colorScheme.onSurface,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  debt.payMethod = 1;
                                });
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Ink(
                                height: MediaQuery.of(context).size.height * 0.12,
                                width: MediaQuery.of(context).size.width * 0.28,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    borderRadius: BorderRadius.circular(10),
                                    border: debt.payMethod == 1
                                        ? Border.all(
                                            width: 2,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary)
                                        : null,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1,
                                        color: Colors.grey.withValues(alpha: 0.5),
                                        spreadRadius: 1,
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.creditCard,
                                      size: 33,
                                    ),
                                    SizedBox(
                                        height: MediaQuery.of(context).size.height *
                                            0.015),
                                    Text(
                                      'Tarjeta',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(context).colorScheme.onSurface,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  debt.payMethod = 2;
                                });
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Ink(
                                height: MediaQuery.of(context).size.height * 0.12,
                                width: MediaQuery.of(context).size.width * 0.28,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    borderRadius: BorderRadius.circular(10),
                                    border: debt.payMethod == 2
                                        ? Border.all(
                                            width: 2,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary)
                                        : null,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1,
                                        color: Colors.grey.withValues(alpha: 0.5),
                                        spreadRadius: 1,
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/bank.png',
                                      scale: 30,
                                    ),
                                    SizedBox(
                                        height: MediaQuery.of(context).size.height *
                                            0.01),
                                    Text(
                                      'Transferencia',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(context).colorScheme.onSurface,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 4,
                          child: TextFormField(
                              controller: descriptionController,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                hintText: 'Dale un nombre a tu gasto',
                                hintStyle: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(CupertinoIcons.tag,
                                    size: 20, color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please fill in this field';
                                }
                                return null;
                              }),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      )
    );
  }
}
