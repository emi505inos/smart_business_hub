import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_business_hub/mobile/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:smart_business_hub/mobile/screens/homescreen/home_screen.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';
import 'package:smart_business_hub/mobile/screens/usermenu/user_menu.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserMenuScreen(),));
              }, 
              icon: Icon(
                Icons.person_outline_outlined,
                color: Theme.of(context).colorScheme.onSurface,
              )
            )
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap:() {
                context.read<SignInBloc>().add(SignOutRequired());
              } ,
              child: Row(
                children: [
                  Text(
                    'Empresa',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.onSurface
                  )
                ],
              ),
            ),
            Text(
              'Propietario',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                
              }, 
              child: Icon(
                CupertinoIcons.question_circle,
                size: 35,
                color: Theme.of(context).colorScheme.onSurface,
              )),
          )
        ],
      ),
      bottomNavigationBar: CustomeNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeScreen()
          ],
        ),
      ),
    );
  }
}