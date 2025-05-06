import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_business_hub/mobile/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/clients/clients_screen.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/employee/employee_screen.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/statistics/statistics_screen.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/supliers/supliers_screen.dart';
import 'package:smart_business_hub/mobile/screens/homescreen/views/new_business.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';
import 'package:smart_business_hub/mobile/screens/usermenu/user_menu.dart';
import 'package:user_repository/user_repository.dart';

class ExplorerScreen extends StatelessWidget {
  const ExplorerScreen({super.key});

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
            child: GestureDetector(
                onTap: () {},
                child: Icon(
                  CupertinoIcons.question_circle,
                  size: 35,
                  color: Theme.of(context).colorScheme.onSurface,
                )),
          )
        ],
      ),
      bottomNavigationBar: CustomeNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tu Negocio',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatisticsScreen(),));
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.23,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/pie-chart.png',
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                            Text(
                              'Estadísticas',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClientsScreen(),));
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.23,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/clients.png',
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height:MediaQuery.of(context).size.height*0.01,),
                            Text(
                              'Clientes',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeScreen(),));
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.23,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/empleados.png',
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height:MediaQuery.of(context).size.height*0.01,),
                            Text(
                              'Empleados',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SupliersScreen(),));
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/inventory.png',
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.01,
                            ),
                            Text(
                              'Proveedores',
                              style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}