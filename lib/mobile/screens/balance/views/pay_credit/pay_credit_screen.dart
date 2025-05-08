import 'package:business_repository/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:smart_business_hub/mobile/screens/balance/balance_screen.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/pay_credit/bloc/create_credit_debt/create_credit_debt_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/pay_selector.dart';
import 'package:smart_business_hub/mobile/screens/explorer/explorer_blocs.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/clients/screens/create_clients_screen.dart';
import 'package:uuid/uuid.dart';


class PayCreditScreen extends StatefulWidget {
  const PayCreditScreen({super.key});

  @override
  State<PayCreditScreen> createState() => _PayCreditScreenState();
}

class _PayCreditScreenState extends State<PayCreditScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController payMethodController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String selectedClient = 'Selecciona un cliente';
  DateTime selectedDate = DateTime.now();
  late CreditDebt creditDebt;
  bool isLoading = false;
  
  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat.yMMMMd('es_AR').format(DateTime.now());
    creditDebt = CreditDebt.empty;
    creditDebt.creditDebtId = const Uuid().v1();
  }
  @override
  Widget build(BuildContext context) {
    return
      BlocListener<CreateCreditDebtBloc, CreateCreditDebtState>(
        listener: (context, state) {
          if(state is CreateCreditDebtSuccess) {
            // setState(() {
            //   creditDebt = CreditDebt.empty;
            // });

          }else if (state is CreateCreditDebtLoading) {
            setState(() {
              isLoading = true;
              creditDebt = CreditDebt.empty;
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
                final parsedDate =DateFormat.yMMMMd('es_AR').parse(dateController.text);
                setState(() {
                  creditDebt.dateTime = parsedDate;
                  creditDebt.amount = int.parse(amountController.text);
                  creditDebt.description = descriptionController.text;
                  creditDebt.client = selectedClient;
                  context.read<CreateCreditDebtBloc>().add(CreateCreditDebt(creditDebt));                  
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
                  // DateSelector(),
                   SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.47,
                    child: TextFormField(
                      controller: dateController,
                      readOnly: true,
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context, 
                          initialDate: creditDebt.dateTime, 
                          firstDate: DateTime(2000), 
                          lastDate: DateTime.now()
                        );

                        if (newDate != null) {
                          setState(() {
                            selectedDate = newDate.toLocal();
                            dateController.text = DateFormat.yMMMMd('es_AR').format(selectedDate);
                            creditDebt.dateTime = selectedDate;
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
                          borderSide: BorderSide.none
                        ),
                      ),
                    ),
                  ),
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
                    controller: amountController,
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
                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return BlocProvider(
                            create: (context) =>
                                GetClientsBloc(FirebaseClientsRepo())
                                  ..add(GetClients()),
                            child: BlocBuilder<GetClientsBloc, GetClientsState>(
                              builder: (context, state) {
                                if (state is GetClientsSuccess) {
                                  final clients = state.clients;
                                  if (clients.isEmpty) {
                                    return const Center(
                                      child: Text(
                                        'No hay clientes registrados',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    );
                                  }
                                  return Container(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Escoge un cliente',
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
                                              color: Theme.of(context).colorScheme.onSurface
                                            )
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:MediaQuery.of(context).size.height *0.3,
                                        width:MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                          itemCount: clients.length,
                                          itemBuilder: (context, int i) {
                                            return ListTile(
                                              leading: Icon(
                                              selectedClient ==
                                                      clients[i].name
                                                  ? Icons.radio_button_checked
                                                  : Icons
                                                      .radio_button_unchecked,
                                            ),
                                            title: Text(
                                              clients[i].name,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                selectedClient =
                                                    clients[i].name;
                                              });
                                              Navigator.pop(context);
                                            },
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BlocProvider(
                                                            create: (context) =>
                                                                CreateClientsBloc(FirebaseClientsRepo()),
                                                            child:
                                                                CreateClientsScreen(),
                                                          )));
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .onSurface),
                                              shape: WidgetStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              fixedSize: WidgetStatePropertyAll(
                                                  Size(
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.06)),
                                            ),
                                            child: Text(
                                              'Crear nuevo cliente',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .onPrimary),
                                              shape: WidgetStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              side: WidgetStateProperty.all<
                                                  BorderSide>(
                                                BorderSide(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                  width: 2,
                                                ),
                                              ),
                                              fixedSize: WidgetStatePropertyAll(
                                                  Size(
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.06)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.category_outlined,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                ),
                                                Text(
                                                  'Cancelar',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurface,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    ],
                                  ),
                                );
                                } else if (state is GetClientsFailure) {
                              return const Center(
                                child: Text(
                                  'Error al cargar los clientes',
                                  style: TextStyle(fontSize: 20),
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                                
                              },
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
                              selectedClient,
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
            ],
          ),
        ),
      )
    );
  }
}