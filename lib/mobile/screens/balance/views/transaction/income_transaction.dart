import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:smart_business_hub/mobile/screens/balance/bloc/get_income/get_income_bloc.dart';

class IncomeTransaction extends StatelessWidget {
  const IncomeTransaction({super.key});

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
    return BlocBuilder<GetIncomeBloc, GetIncomeState>(
      builder: (context, state) {
        if (state is GetIncomeSuccess) {
          final income = state.incomes;
    
          if (income.isEmpty) {
            return const Center(
              child: Text(
                'No hay ingresos registrados',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
          return ListView.builder(
            itemCount: income.length,
            itemBuilder: (context, int i) {
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
                                    '${income[i].quantity}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[700]
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width *0.02,),
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
                                    Text(
                                      _getPaymentMethod(income[i].payMethod),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                    Text(
                                      DateFormat('▪ d, MMMM -').add_jm().format(income[i].dateTime),
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
                              '\$ ${income[i].income}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            ),
                            SizedBox(width:MediaQuery.of(context).size.width * 0.02),
                            Text(
                              'Pagado',
                              style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSecondary
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
        } else if (state is GetIncomeFailure) {
          return const Center(
            child: Text(
              'Error al cargar los ingresos',
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );

  }
}
