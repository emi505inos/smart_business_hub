import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:smart_business_hub/mobile/screens/balance/bloc/get_expense/get_expense_bloc.dart';

class ExpenseTransaction extends StatelessWidget {
  const ExpenseTransaction({super.key});
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
    return BlocBuilder<GetExpenseBloc, GetExpenseState>(
      builder: (context, state) {
        if (state is GetExpenseSuccess) {
          final expense = state.expenses;

          if (expense.isEmpty) {
            return const Center(
              child: Text(
                'No hay egresos registrados',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
          return ListView.builder(
              itemCount: expense.length,
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
                                height:MediaQuery.of(context).size.height * 0.085,
                                width:MediaQuery.of(context).size.width * 0.085,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 222, 222),
                                  shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.moneyBill1,
                                    size: 23,
                                    color: Color.fromARGB(255, 193, 77, 69),
                                  )
                                )
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        expense[i].description,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700]
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        _getPaymentMethod(expense[i].payMethod),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                                      Text(
                                        DateFormat('▪ d, MMMM -').add_jm().format(expense[i].dateTime),
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
                                '- \$ ${expense[i].totalExpence}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),
                              ),
                              SizedBox( width: MediaQuery.of(context).size.width * 0.02,
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
          else if (state is GetExpenseFailure) {
          return const Center(
            child: Text(
              'Error al cargar los egresos',
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}
