import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:income_repository/income_repository.dart';
import 'package:smart_business_hub/mobile/screens/balance/bloc/create_income/create_income_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/bloc/get_income/get_income_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/date_selector.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/pay_selector.dart';

class FreeSalesForm extends StatefulWidget {
  const FreeSalesForm({super.key});

  @override
  State<FreeSalesForm> createState() => _FreeSalesFormState();
}

class _FreeSalesFormState extends State<FreeSalesForm> {
  late Income income;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return
    BlocListener<CreateIncomeBloc, CreateIncomeState>(
      listener: (context, state) {
        if(state is CreateIncomeSuccess) {

        }else if (state is CreateIncomeLoading) {
          setState(() {
            isLoading = true;
          });
        }
      },
      child:GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child:  Scaffold(
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
            // child: BlocBuilder<GetIncomeBloc, GetIncomeState>(
            //   builder: (context, state) {
                
            //     if(state is GetIncomeSuccess) {
            //       return 
           child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DateSelector(),
                          PaySelector(),
                        ],
                      ),
                      
                    ],
                  )
                // } else {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
              // },
            ),
          ),
        )
      );
  }
}
