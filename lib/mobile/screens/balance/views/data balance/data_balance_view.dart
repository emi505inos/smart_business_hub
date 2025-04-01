import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/data%20balance/date_balance.dart';

class DataBalanceView extends StatefulWidget {
  const DataBalanceView({super.key});

  @override
  State<DataBalanceView> createState() => _DataBalanceViewState();
}

class _DataBalanceViewState extends State<DataBalanceView> {
  late DateBalance  dateBlance;

   @override
  void initState() {
    super.initState();
    dateBlance = DateBalance.empty;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.055,
      width: MediaQuery.of(context).size.width, 
      child: Column(
        children: [
        Divider(
            height: 5,
            indent: 1,
            endIndent: 1,
            thickness: 1.7,
            color: Theme.of(context).colorScheme.onSurface
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
                width: MediaQuery.of(context).size.width*0.87,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            dateBlance.date = 6;
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Ink(
                          height: MediaQuery.of(context).size.height*0.025,
                          width: MediaQuery.of(context).size.width*0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: dateBlance.date == 6
                            ? Colors.white
                            : Color.fromRGBO(92, 226, 170, 1)
                          ),
                          child: Center(
                            child: Text(
                              'Septiembre',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        )
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            dateBlance.date = 5;
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Ink(
                          height: MediaQuery.of(context).size.height*0.025,
                          width: MediaQuery.of(context).size.width*0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: dateBlance.date == 5
                            ? Colors.white
                            : Color.fromRGBO(92, 226, 170, 1)
                          ),
                          child: Center(
                            child: Text(
                              'Octubre',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        )
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            dateBlance.date = 4;
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Ink(
                          height: MediaQuery.of(context).size.height*0.025,
                          width: MediaQuery.of(context).size.width*0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: dateBlance.date == 4
                            ? Colors.white
                            : Color.fromRGBO(92, 226, 170, 1)
                          ),
                          child: Center(
                            child: Text(
                              'Noviembre',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        )
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            dateBlance.date = 3;
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Ink(
                          height: MediaQuery.of(context).size.height*0.025,
                          width: MediaQuery.of(context).size.width*0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: dateBlance.date == 3
                            ? Colors.white
                            : Color.fromRGBO(92, 226, 170, 1)
                          ),
                          child: Center(
                            child: Text(
                              'Diciembre',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        )
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            dateBlance.date = 2;
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Ink(
                          height: MediaQuery.of(context).size.height*0.025,
                          width: MediaQuery.of(context).size.width*0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: dateBlance.date == 2
                            ? Colors.white
                            : Color.fromRGBO(92, 226, 170, 1)
                          ),
                          child: Center(
                            child: Text(
                              'Enero',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        )
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            dateBlance.date = 1;
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Ink(
                          height: MediaQuery.of(context).size.height*0.025,
                          width: MediaQuery.of(context).size.width*0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: dateBlance.date == 1
                            ? Colors.white
                            : Color.fromRGBO(92, 226, 170, 1)
                          ),
                          child: Center(
                            child: Text(
                              'Febrero',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        )
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            dateBlance.date = 0;
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Ink(
                          height: MediaQuery.of(context).size.height*0.025,
                          width: MediaQuery.of(context).size.width*0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: dateBlance.date == 0
                            ? Colors.white
                            : Color.fromRGBO(92, 226, 170, 1)
                          ),
                          child: Center(
                            child: Text(
                              'Marzo',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        )
                      ),
                      
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.02,
                width: MediaQuery.of(context).size.width*0.004,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              
              Container(
                width: MediaQuery.of(context).size.width*0.126,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary
                ),
                child: IconButton(
                onPressed: (){
                  // DateTime? pickedDate = await 
                  showDatePicker (
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101)
                  );
                  // if (pickedDate != null) {
                  //   print(pickedDate);
                  // }
                }, 
                icon: Icon(Icons.calendar_month)),
              )
            ],
          ),
        ],
      ),
    );
  }
}