import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/clients/screens/clients_list_screen.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/clients/screens/create_clients_screen.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
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
        ),
        title: Text(
          'Clientes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              size: 30,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateClientsScreen()));   
        }, 
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onSecondary),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          fixedSize: WidgetStatePropertyAll(Size(
            MediaQuery.of(context).size.width*0.8,
            MediaQuery.of(context).size.height*0.06
          )),
        ),
        child: Text(
          'Agregar cliente',
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClientsListScreen()));   
                
              },
              child: Ink(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [ BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey.withValues(alpha: 0.5),
                    spreadRadius: 1,
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/clients.png',
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                          Text(
                          'Total de clientes',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Text(
                      '2',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
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