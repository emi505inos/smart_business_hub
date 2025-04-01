import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/date_selector.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/pay_selector.dart';

class FreeSalesForm extends StatefulWidget {
  const FreeSalesForm({super.key});

  @override
  State<FreeSalesForm> createState() => _FreeSalesFormState();
  
}

class _FreeSalesFormState extends State<FreeSalesForm> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 30,
              ),
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        title: Text(
          'Nueva Venta',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateSelector(),
                PaySelector(),
              ],
            )
          ],
        ),
      ),
    );
  }
}