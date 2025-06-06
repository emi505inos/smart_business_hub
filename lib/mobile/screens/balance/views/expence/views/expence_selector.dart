
import 'package:business_repository/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/bloc/create_expense/create_expense_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/expence/bloc/create_debt/create_debt_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/expence/models/expense_selector.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/expence/new_expence.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/expence/views/new_debt_form.dart';

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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => BlocProvider(
                              create: (context) => CreateExpenseBloc(
                              FirebaseExpenseRepo()
                              ),
                              child: NewExpence(),
                              ),
                            ));
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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => 
                              BlocProvider(
                              create: (context) => CreateDebtBloc(
                              FirebaseDebtRepo()
                              ),
                              child: NewDebtForm()
                              ,
                              ),
                            ));
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