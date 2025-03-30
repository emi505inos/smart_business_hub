import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/add_sale.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: false,
                backgroundColor: Theme.of(context).colorScheme.surface,
                builder: (context) {
                  return AddSaleView();
                },
              );
            },
            borderRadius: BorderRadius.circular(35),
            child: Ink(
              height: MediaQuery.of(context).size.height*0.05,
              width: MediaQuery.of(context).size.width*0.45,
              decoration: BoxDecoration(
                color: Color.fromRGBO(16, 147, 93, 1),
                borderRadius: BorderRadius.circular(35),
                boxShadow: [BoxShadow(
                  blurRadius: 1,
                  color: Colors.grey.withValues(alpha: 0.5),
                  spreadRadius: 1,
                  )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline_outlined,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                    Text(
                      'Nueva Venta',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              
            },
            borderRadius: BorderRadius.circular(35),
            child: Ink(
              height: MediaQuery.of(context).size.height*0.05,
              width: MediaQuery.of(context).size.width*0.45,
              decoration: BoxDecoration(
                color: Color.fromRGBO(136, 24, 17, 1),
                borderRadius: BorderRadius.circular(35),
                boxShadow: [BoxShadow(
                  blurRadius: 1,
                  color: Colors.grey.withValues(alpha: 0.5),
                  spreadRadius: 1,
                  )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Icon(
                      Icons.remove_circle_outline_outlined,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                    Text(
                      'Nuevo Gasto',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}