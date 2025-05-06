import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_business_hub/mobile/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/bottom_buttons.dart';
import 'package:smart_business_hub/mobile/screens/debts/views/debts_selector.dart';
import 'package:smart_business_hub/mobile/screens/homescreen/views/new_business.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';
import 'package:smart_business_hub/mobile/screens/usermenu/user_menu.dart';
import 'package:user_repository/user_repository.dart';

class DebtsScreen extends StatelessWidget {
  const DebtsScreen({super.key});

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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => BlocProvider(
                        create: (context) => SignInBloc(
                          FirebaseUserRepo(UserRepository)
                        ),
                        child: UserMenuScreen(),
                      ),
                    ));
                  },
                  icon: Icon(
                    Icons.person_outline_outlined,
                    color: Theme.of(context).colorScheme.onSurface,
                  ))),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: false,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  builder: (context) {
                    return NewBusiness();
                  },
                );
              },
              child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('business').snapshots(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final business = snapshot.data!.docs.first['name'];
                return Row(
                  children: [
                    Text(
                      '$business',
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
                );
                },
              ),
            ),
            Text(
              'Propietario',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    CupertinoIcons.search,
                    size: 35,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    CupertinoIcons.question_circle,
                    size: 35,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomeNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DebtsSelector(),
            BottomButtons(),
          ],
        ),
      ),
    );
  }
}