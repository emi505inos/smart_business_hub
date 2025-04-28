import 'package:business_repository/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_business_hub/bloc/auth%20bloc/authentication_bloc.dart';
import 'package:smart_business_hub/mobile/screens/Inventary/bloc/inventory_blocs.dart';
import 'package:smart_business_hub/mobile/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/bloc/balance_blocs.dart';
import 'package:smart_business_hub/mobile/screens/explorer/explorer_blocs.dart';
import 'package:smart_business_hub/mobile/screens/homescreen/home_screen.dart';
import 'package:smart_business_hub/mobile/screens/onboarding/onboarding_screen.dart';


class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartBusiness Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade200,
          onSurface: Color.fromRGBO(27, 45, 52, 1),
          primary: Color.fromRGBO(92, 226, 170, 1),
          onPrimary: Colors.white,
          secondary: Color.fromRGBO(136, 24, 17, 1),
          onSecondary: Color.fromRGBO(16, 147, 93, 1),
        )
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: ((context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignInBloc(
                    context.read<AuthenticationBloc>().userRepository),
              ),
              BlocProvider(
                create: (context) => CreateIncomeBloc(
                  FirebaseIncomeRepo()
                )..add(CreateIncome(Income.empty)),
              ),
              BlocProvider(
                create: (context) => GetIncomeBloc(
                  FirebaseIncomeRepo()
                )..add(GetIncome()),
              ),
              BlocProvider(
                create: (context) => CreateExpenseBloc(
                  FirebaseExpenseRepo()
                )..add(CreateExpense(Expense.empty)),
              ),
              BlocProvider(
                create: (context) => GetExpenseBloc(
                  FirebaseExpenseRepo()
                )..add(GetExpense()),
              ),
              BlocProvider(
                create: (context) => CreateCategoryBloc(
                  FirebaseCategoryRepo()
                )..add(CreateCategory(Category.empty)),
              ),
              BlocProvider(
                create: (context) => GetCategoriesBloc(
                  FirebaseCategoryRepo()
                )..add(GetCategories()),
              ),
              BlocProvider(
                create: (context) => CreateProductBloc(
                  FirebaseProductRepo()
                )..add(CreateProduct(Product.empty)),
              ),
              BlocProvider(
                create: (context) => GetProductBloc(
                  FirebaseProductRepo()
                )..add(GetProduct()),
              ),
              BlocProvider(
                create: (context) => CreateClientsBloc(
                  FirebaseClientsRepo()
                  )..add(CreateClient(Clients.empty)),
              ),
              BlocProvider(create: (context) => GetClientsBloc(
                FirebaseClientsRepo()
                )..add(GetClients()),
              ),
              BlocProvider(create: (context) => CreateEmployeeBloc(
                FirebaseEmployeeRepo()
                )..add(CreateEmployee(Employee.empty)),
              ),
              BlocProvider(create: (context) => GetEmployeeBloc(
                FirebaseEmployeeRepo()
                )..add(GetEmployee()),
              ),
              BlocProvider(create: (context) => CreateSuplierBloc(
                FirebaseSupliersRepo()
                )..add(CreateSuplier(Suplier.empty)),
              ),
              BlocProvider(create: (context) => GetSuplierBloc(
                FirebaseSupliersRepo()
                )..add(GetSuplier()),
              )
            ],
            child:  HomeScreen()
            
          );
        } else {
            return OnboardingScreen();
          }
      })),
    );
  }
}