import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:income_repository/income_repository.dart';
import 'package:smart_business_hub/bloc/auth%20bloc/authentication_bloc.dart';
import 'package:smart_business_hub/home_page.dart';
import 'package:smart_business_hub/mobile/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/bloc/get_income/get_income_bloc.dart';
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
                create: (context) => GetIncomeBloc(
                  FirebaseIncomeRepo()
                )..add(GetIncome()),
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