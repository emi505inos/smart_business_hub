import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/clients/clients_screen.dart';

class CreateClientsScreen extends StatefulWidget {
  const CreateClientsScreen({super.key});

  @override
  State<CreateClientsScreen> createState() => _CreateClientsScreenState();
}

class _CreateClientsScreenState extends State<CreateClientsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClientsScreen()));
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        title: Text(
          'Nuevo Cliente',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateClientsScreen()));   
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
          'Crear cliente',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Nombre del cliente',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01),
            SizedBox(
              width: MediaQuery.of(context).size.width * 4,
              child: TextFormField(
                controller: nameController,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
                decoration: InputDecoration(
                  hintText: 'Nombre',
                  hintStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), 
                    borderSide: BorderSide.none),
                ),
                validator: (val) {
                if (val!.isEmpty) {
                  return 'Please fill in this field';
                }
                return null;
                }
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Row(
              children: [
                Text(
                  'Telefono',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01),
            SizedBox(
              width: MediaQuery.of(context).size.width * 4,
              child: TextFormField(
                controller: phoneController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
                decoration: InputDecoration(
                  hintText: 'Telefono',
                  hintStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), 
                    borderSide: BorderSide.none),
                ),
                validator: (val) {
                if (val!.isEmpty) {
                  return 'Please fill in this field';
                }
                return null;
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}