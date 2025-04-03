import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/transaction/income_transaccion_list.dart';

class IncomeTransaction extends StatelessWidget {
  const IncomeTransaction({super.key});
  

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: incomeTransactionData.length,
      itemBuilder: (context, int i) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: InkWell(
            onTap: () {
              
            },
            child: Ink(
              height: MediaQuery.of(context).size.height*0.06,
              width: MediaQuery.of(context).size.width*41,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.085,
                        width: MediaQuery.of(context).size.width*0.085,
                        decoration: BoxDecoration(
                          color:Color.fromRGBO(92, 226, 170, 0.5),
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
                      SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${incomeTransactionData[i]['number']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700]
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                              Text(
                                '${incomeTransactionData[i]['name']}',
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
                                '${incomeTransactionData[i]['payMethod']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.02,),
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
                        '${incomeTransactionData[i]['totalAmount']}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.02,),
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
  }
}