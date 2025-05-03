import 'package:business_repository/repositories.dart';
import 'package:flutter/material.dart';
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
    dateController.text = DateFormat.yMMMMd('es_AR').format(DateTime.now());
    income = Income.empty;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      height: MediaQuery.of(context).size.height*0.05,
      width: MediaQuery.of(context).size.width*0.47,
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
              dateController.text = DateFormat.yMMMMd('es_AR').format(newDate);
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
}