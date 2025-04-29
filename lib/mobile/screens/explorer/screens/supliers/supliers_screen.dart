import 'package:business_repository/repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_business_hub/mobile/screens/explorer/explorer_blocs.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/supliers/screens/create_suplier.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/supliers/screens/suplier_list.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';

class SupliersScreen extends StatefulWidget {
  const SupliersScreen({super.key});

  @override
  State<SupliersScreen> createState() => _SupliersScreenState();
}

class _SupliersScreenState extends State<SupliersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        title: Text(
          'Proveedores',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) =>
                        CreateSuplierBloc(FirebaseSupliersRepo()),
                    child: CreateSuplierScreen(),
                  )));
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.onSecondary),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          fixedSize: WidgetStatePropertyAll(Size(
              MediaQuery.of(context).size.width * 0.8,
              MediaQuery.of(context).size.height * 0.06)),
        ),
        child: Text(
          'Agregar Proveedor',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      bottomNavigationBar: CustomeNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SuplierList()));
              },
              child: Ink(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 1,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/inventory.png',
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            'Total de Proveedores',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('supliers').snapshots(), 
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          }
                          int totalSuplier = snapshot.data!.docs.length;
                          return Text(
                            '$totalSuplier',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
