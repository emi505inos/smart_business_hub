import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/date%20balance/date_balance.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/date%20balance/date_selector_list.dart';

class DateBalanceView extends StatefulWidget {
  const DateBalanceView({super.key});

  @override
  State<DateBalanceView> createState() => _DateBalanceViewState();
}

class _DateBalanceViewState extends State<DateBalanceView> {
  late DateBalance  dateBlance;
  String selectedDate = '';

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
                      ...dateSelectorList.map((e) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedDate = e['mont'] ?? '';
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Ink(
                          height: MediaQuery.of(context).size.height*0.025,
                          width: MediaQuery.of(context).size.width*0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: selectedDate.isNotEmpty && selectedDate == (e['mont'] ?? '') 
                            ? Colors.white
                            : Color.fromRGBO(92, 226, 170, 1)
                          ),
                          child: Center(
                            child: Text(
                              e['mont'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        )
                      ), 
                      )
                      
                    ],
                  )
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