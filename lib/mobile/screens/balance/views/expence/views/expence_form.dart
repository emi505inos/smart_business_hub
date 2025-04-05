import 'package:flutter/material.dart';
import 'package:income_repository/income_repository.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ExpenceForm extends StatefulWidget {
  const ExpenceForm({super.key});

  @override
  State<ExpenceForm> createState() => _ExpenceFormState();
}

class _ExpenceFormState extends State<ExpenceForm> {
  TextEditingController incomeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController payMethodController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController clientsController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late Income income;
  bool isLoading = false;
  

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat.yMMMMd('es_AR').format(DateTime.now());
    income = Income.empty;
    income.saleId = const Uuid().v1();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Fecha del gasto',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            width: MediaQuery.of(context).size.width*4,
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
          ),
        ],
      ),
    );
  }
}