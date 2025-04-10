import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/expence/models/expense_selector.dart';

class ExpenceSelector extends StatefulWidget {
  const ExpenceSelector({super.key});

  @override
  State<ExpenceSelector> createState() => _ExpenceSelectorState();
}

class _ExpenceSelectorState extends State<ExpenceSelector> {
  late ExpenseSelector acount = ExpenseSelector.empty;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Ink(
                  height: MediaQuery.of(context).size.height*0.05,
                  width: MediaQuery.of(context).size.width*4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              acount.selector= 0;
                            });
                            
                          },
                          child: Ink(
                            width: MediaQuery.of(context).size.width*0.45,
                            height: MediaQuery.of(context).size.height*0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: acount.selector == 0
                                  ? Theme.of(context).colorScheme.onSecondary
                                  : Theme.of(context).colorScheme.onPrimary,
                            ),
                            child: Center(
                              child: Text(
                                'Pagado',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color:acount.selector == 0
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onSurface
                                ),
                                
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              acount.selector= 1 ;
                            });
                            
                          },
                          child: Ink(
                            width: MediaQuery.of(context).size.width*0.45,
                            height: MediaQuery.of(context).size.height*0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: acount.selector == 1
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context).colorScheme.onPrimary,
                            ),
                            child: Center(
                              child: Text(
                                'Deuda',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color:acount.selector == 1
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onSurface
                                ), 
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            )
          )
        ],
      ),
    );
  }
}