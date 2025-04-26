import 'package:business_repository/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_business_hub/mobile/screens/balance/bloc/create_income/create_income_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/free_sales_screen.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/new_product_sale_screen.dart';

class AddSaleView extends StatefulWidget {
  const AddSaleView({super.key});

  @override
  State<AddSaleView> createState() => _AddSaleViewState();
}

class _AddSaleViewState extends State<AddSaleView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nueva venta',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
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
            Text(
              'Selecciona el tipo de venta que quieras hacer.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600]
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => NewProductSalesScreen()));
              },
              child: Ink(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).colorScheme.onPrimary,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 1,
                      )
                    ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/shopping-cart.png',
                            scale: 7,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Venta de Productos',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                              ),
                              Text(
                                'Registra una venta seleccionada',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600]),
                              ),
                              Text(
                                'de los productos de tu inventario.',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600]),
                              )
                            ],
                          )
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 35,
                        color: Theme.of(context).colorScheme.onSurface,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider(
                      create: (context) => CreateIncomeBloc(
                        FirebaseIncomeRepo()
                      ),
                      child: FreeSalesScreen(),
                    )
                  )
                );
              },
              child: Ink(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/dollar.png',
                            scale: 7,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Venta Libre',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Registra un ingreso',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 14),
                                  children: [
                                    TextSpan(
                                      text: ' sin seleccionar',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'productos',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: ' de tu inventario',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 35,
                        color: Theme.of(context).colorScheme.onSurface,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
