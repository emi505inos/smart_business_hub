import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/acount.dart';

class PaySelector extends StatefulWidget {
  const PaySelector({super.key});

  @override
  State<PaySelector> createState() => _PaySelectorState();
}

class _PaySelectorState extends State<PaySelector> {
  late Acount acount;

  @override
  void initState() {
    super.initState();
    acount = Acount.empty;
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: MediaQuery.of(context).size.height*0.05,
      width: MediaQuery.of(context).size.width*0.45,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          blurRadius: 1,
          color: Colors.grey.withValues(alpha: 0.5),
          spreadRadius: 1,
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                setState(() {
                  acount.money= 0;
                });
                
              },
              child: Ink(
                width: MediaQuery.of(context).size.width*0.21,
                height: MediaQuery.of(context).size.height*0.044,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: acount.money == 0
                      ? Color.fromRGBO(17, 146, 93, 1)
                      : Theme.of(context).colorScheme.onPrimary,
                  
                ),
                child: Center(
                  child: Text(
                    'Pagada',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:acount.money == 0
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
                  acount.money= 1 ;
                });
                
              },
              child: Ink(
               width: MediaQuery.of(context).size.width*0.21,
                height: MediaQuery.of(context).size.height*0.045,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: acount.money == 1
                      ? Color.fromRGBO(202, 62, 54, 1)
                      : Theme.of(context).colorScheme.onPrimary,
                ),
                child: Center(
                  child: Text(
                    'A Crédito',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:acount.money == 1
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface
                    ), 
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}