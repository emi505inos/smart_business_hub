import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:income_repository/income_repository.dart';
import 'package:intl/intl.dart';

class ExpenseTransaction extends StatelessWidget {
  const ExpenseTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Income> income = [
      Income(
        saleId: '1',
        description: 'Venta de productos',
        income: 1000,
        payMethod: 0,
        quantity: 1,
        dateTime: DateTime.now(),
        clients: 'Cliente 1',
      ),
      Income(
        saleId: '2',
        description: 'Servicio de limpieza',
        income: 500,
        payMethod: 1,
        quantity: 1,
        dateTime: DateTime.now(),
        clients: 'Cliente 2',
      ),
      Income(
        saleId: '3',
        description: 'Alquiler de oficina',
        income: 1500,
        payMethod: 2,
        quantity: 1,
        dateTime: DateTime.now(),
        clients: 'Cliente 3',
      ),
      Income(
        saleId: '4',
        description: 'Venta de productos',
        income: 2000,
        payMethod: 3,
        quantity: 1,
        dateTime: DateTime.now(),
        clients: 'Cliente 4',
      ),
    ];

    return ListView.builder(
      itemCount: income.length,
      itemBuilder: (context, int i) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
                        height: MediaQuery.of(context).size.height * 0.085,
                        width:MediaQuery.of(context).size.width * 0.085,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 222, 222),
                          shape: BoxShape.circle),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.moneyBill1,
                            size: 23,
                            color: Color.fromARGB(255, 193, 77, 69),
                          )
                        )
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                              '${income[i].quantity}',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700]
                                ),
                              ),
                              SizedBox( width: MediaQuery.of(context).size.width *0.02,),
                              Text(
                                income[i].description,
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
                              if (income[i].payMethod == 0)
                              Text(
                              'Efectivo',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]
                                )
                              )else if (income[i].payMethod == 1)
                              Text(
                                'Tarjeta',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]
                                )
                              )
                              else if (income[i].payMethod == 2)
                              Text(
                                'Transferencia',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]
                                )
                              )
                              else if (income[i].payMethod == 3)
                              Text(
                                'Otro',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]
                                )
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                              Text(
                                DateFormat('▪ d, MMMM -').add_jm().format(DateTime.now()),
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
                        '- \$ ${income[i].income}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        'Pagado',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 193, 77, 69),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
