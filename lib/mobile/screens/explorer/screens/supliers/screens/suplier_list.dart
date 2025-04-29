import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SuplierList extends StatefulWidget {
  const SuplierList({super.key});

  @override
  State<SuplierList> createState() => _SuplierListState();
}

class _SuplierListState extends State<SuplierList> {
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
        titleSpacing: 100,
        title: Text(
          'Proveedores',
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('supliers').snapshots(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No hay proveedores',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
            );
          } 
          final suplier = snapshot.data!.docs.reversed.toList();
          List<Widget> supliersWidget = suplier.map((suplier){
            return Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: MediaQuery.of(context).size.height * 0.085,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width *
                                        0.05,
                                backgroundColor: Colors.grey[300],
                                child: Text(
                                  suplier['name'].substring(0,1),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                  ),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.02,
                            ),
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  suplier['name'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface,
                                  ),
                                ),
                                Text(
                                  '${suplier['phoneNumber']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                          color:
                              Theme.of(context).colorScheme.onSurface,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList();
          return Expanded(
            child: ListView(
              children: supliersWidget,
            ),
          );
        },
      ) 
    );
  }
}

                  