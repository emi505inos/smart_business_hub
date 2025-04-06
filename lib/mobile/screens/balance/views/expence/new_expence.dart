import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/expence/views/expence_form.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/expence/views/expence_selector.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({super.key});

  @override
  State<NewExpence> createState() => _NewExpenceState();
}

class _NewExpenceState extends State<NewExpence> {
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
          'Nuevo Gasto',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height*0.1,
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
          onPressed: () {
            setState(() {
              
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height*0.015,
              horizontal: MediaQuery.of(context).size.width*0.2
            )
          ),
          child: Text(
            'Crear Gasto',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpenceSelector(),
            ExpenceForm()
          ],
        ),
      ),
    );
  }
}