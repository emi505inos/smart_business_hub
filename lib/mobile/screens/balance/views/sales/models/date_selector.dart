import 'package:flutter/material.dart';
import 'package:income_repository/income_repository.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime selectedDate = DateTime.now();
  late Income income;

  TextEditingController dateController = TextEditingController();
   @override
  void initState() {
    dateController.text = DateFormat('dd, MMMM').format(DateTime.now());
    income = Income.empty;
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      height: MediaQuery.of(context).size.height*0.05,
      width: MediaQuery.of(context).size.width*0.45,
      child: TextFormField(
        controller: dateController,
        readOnly: true,
        onTap: () async {
          DateTime? newDate = await showDatePicker(
            context: context, 
            initialDate: income.dateTime, 
            firstDate: DateTime(2000), 
            lastDate: DateTime.now()
          );

          if (newDate != null) {
            setState(() {
              dateController.text = DateFormat().format(newDate);
              income.dateTime = newDate;
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
    );
  }
  //   InkWell(
  //     onTap: () async{
  //       final DateTime? dateTime = await showDatePicker(
  //         context: context, 
  //         firstDate: DateTime(2000), 
  //         lastDate: DateTime.now()
  //       );
  //       if (dateTime != null) {
  //         setState(() {
  //           selectedDate = dateTime;
  //         });
  //       }
  //     },
  //     borderRadius: BorderRadius.circular(15),
  //     child: Ink(
  //       height: MediaQuery.of(context).size.height*0.05,
  //       width: MediaQuery.of(context).size.width*0.45,
  //       decoration: BoxDecoration(
  //         color: Theme.of(context).colorScheme.onPrimary,
  //         borderRadius: BorderRadius.circular(15),
  //         boxShadow: [BoxShadow(
  //           blurRadius: 1,
  //           color: Colors.grey.withValues(alpha: 0.5),
  //           spreadRadius: 1,
  //           )
  //         ]
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 15),
  //         child: Row(
  //           children: [
  //             Icon(
  //               Icons.calendar_month,
  //               color: Theme.of(context).colorScheme.onSurface,
  //             ),
  //             SizedBox(width: MediaQuery.of(context).size.width*0.02,),
  //             Text(
  //               DateFormat('dd, MMMM, yyyy').format(selectedDate),
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.bold,
  //                 color: Theme.of(context).colorScheme.onSurface,
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}