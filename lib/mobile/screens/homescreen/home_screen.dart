import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Accesos rápidos',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Row(
            children: [
              InkWell(
                onTap: () {
                  
                },
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: MediaQuery.of(context).size.height*0.15,
                  width: MediaQuery.of(context).size.width*0.29,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 1,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/chartup.png',
                          color: Theme.of(context).colorScheme.primary,
                          height: MediaQuery.of(context).size.height*0.08,
                          width: MediaQuery.of(context).size.width*0.08,
                        ),
                        Text(
                          'Registrar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary
                          ),
                        ),
                        Text(
                          'Venta',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.02,),
              InkWell(
                onTap: () {
                  
                },
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: MediaQuery.of(context).size.height*0.15,
                  width: MediaQuery.of(context).size.width*0.29,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 1,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/chartdown.png',
                          color: Theme.of(context).colorScheme.primary,
                          height: MediaQuery.of(context).size.height*0.08,
                          width: MediaQuery.of(context).size.width*0.08,
                        ),
                        Text(
                          'Registrar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface
                          ),
                        ),
                        Text(
                          'Gasto',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.02,),
              InkWell(
                onTap: () {
                  
                },
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: MediaQuery.of(context).size.height*0.15,
                  width: MediaQuery.of(context).size.width*0.29,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 1,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.boxesStacked,
                          size: 30,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height*0.03,),
                        Text(
                          'Ver Inventario',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Text(
            'Sugeridos para ti',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Container(
            height: MediaQuery.of(context).size.height*0.35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                blurRadius: 1,
                color: Colors.grey.withValues(alpha: 0.7),
                spreadRadius: 1,
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            
                          },
                          child: Ink(
                            height: MediaQuery.of(context).size.height*0.23,
                            width: MediaQuery.of(context).size.width*0.23,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/debts.png',
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.009,),
                                Text(
                                  'Deudas',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onSurface
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            
                          },
                          child: Ink(
                            height: MediaQuery.of(context).size.height*0.23,
                            width: MediaQuery.of(context).size.width*0.23,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/pie-chart.png',
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                Text(
                                  'Estadísticas',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onSurface
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              
                            },
                            child: Ink(
                              width: MediaQuery.of(context).size.width*0.23,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/clients.png',
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                  Text(
                                    'Clientes',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.onSurface
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () {
                            
                          },
                          child: Ink(
                            height: MediaQuery.of(context).size.height*0.18,
                            width: MediaQuery.of(context).size.width*0.2,
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/inventory.png',
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                Text(
                                  'Proveedores',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onSurface
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}