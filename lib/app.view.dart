import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_business_hub/bloc/authentication_bloc.dart';
import 'package:smart_business_hub/home_page.dart';
import 'package:smart_business_hub/mobile/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
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
              secondary: Colors.deepOrange,
               
              )),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: ((context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignInBloc(
                    context.read<AuthenticationBloc>().userRepository),
              ),
            ],
            child: HomePage(),
          );
        } else {
            return OnboardingScreen();
          }
      })),
    );
  }
}