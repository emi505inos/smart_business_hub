import 'package:business_repository/repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_business_hub/mobile/screens/Inventary/bloc/inventory_blocs.dart';
import 'package:smart_business_hub/mobile/screens/Inventary/views/categories_screen.dart';
import 'package:smart_business_hub/mobile/screens/Inventary/views/create_product_screen.dart';
import 'package:smart_business_hub/mobile/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:smart_business_hub/mobile/screens/homescreen/views/new_business.dart';
import 'package:smart_business_hub/mobile/screens/navigatorbar/custom_navigator_bar.dart';
import 'package:smart_business_hub/mobile/screens/usermenu/user_menu.dart';
import 'package:user_repository/user_repository.dart';

class InventaryScreen extends StatefulWidget {
  const InventaryScreen({super.key});

  @override
  State<InventaryScreen> createState() => _InventaryScreenState();
}

class _InventaryScreenState extends State<InventaryScreen> {

  String? categorySelector;

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
                        create: (context) =>
                            SignInBloc(FirebaseUserRepo(UserRepository)),
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
              child: Row(
                children: [
                  Text(
                    'Empresa',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Icon(Icons.arrow_drop_down,
                      color: Theme.of(context).colorScheme.onSurface)
                ],
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
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
                onTap: () {},
                child: Icon(
                  CupertinoIcons.search,
                  size: 30,
                  color: Theme.of(context).colorScheme.onSurface,
                )),
          )
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.height * 0.17,
        width: MediaQuery.of(context).size.width * 4,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) =>
                                CreateProductBloc(FirebaseProductRepo()),
                            child: CreateProductScreen(),
                          )));
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.onSurface),
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
                  'Crear nuevo producto',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) =>
                                CreateCategoryBloc(FirebaseCategoryRepo()),
                            child: CategoriesScreen(),
                          )));
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.onPrimary),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  side: WidgetStateProperty.all<BorderSide>(
                    BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 2,
                    ),
                  ),
                  fixedSize: WidgetStatePropertyAll(Size(
                      MediaQuery.of(context).size.width * 0.8,
                      MediaQuery.of(context).size.height * 0.07)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.category_outlined,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Text(
                      'Categorías',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomeNavigationBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Ink(

                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 3,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.doc_plaintext,
                        color: Theme.of(context).colorScheme.onSurface
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                      Text(
                        'Reportes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface
                          )
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total de referencias',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('products').snapshots(), 
                                  builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  }
                                  int totalProducts = snapshot.data!.docs.length;
                                  return Text(
                                    '$totalProducts',
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.onSurface,
                                    ),
                                  );
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Costo total',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('products').snapshots(), 
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  }
                                  final totalProducts = snapshot.data!.docs.fold<int>(
                                    0, 
                                    (previousValue, document) => previousValue + (document['cost'] as int? ?? 0)
                                  );
                                  return Text(
                                    '\$ $totalProducts',
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.onSurface,
                                    ),
                                  );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('categories').snapshots(), 
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    
                  }
                  final categories = snapshot.data!.docs;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height*0.085,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length + 1,
                      itemBuilder: (context, i) {
                        if (i == 0) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    categorySelector = null;
                                  });
                                },
                                borderRadius:BorderRadius.circular(17),
                                child: Ink(
                                  height: MediaQuery.of(context).size.height*0.05,
                                  width: MediaQuery.of(context).size.width*0.45,
                                  decoration: categorySelector == null
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17),
                                          color: Theme.of(context).colorScheme.primary,)
                                      : BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(
                                                  17),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          border: Border.all(
                                              color: Colors
                                                  .grey.shade400,
                                              width: 2)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Todas las categorias',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                            ],
                          );
                        }
                        final category = categories[i - 1];
                        return Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  categorySelector = category['name'];
                                });
                              },
                              borderRadius:
                                  BorderRadius.circular(17),
                              child: Ink(
                                height: MediaQuery.of(context)
                                        .size
                                        .height *
                                    0.05,
                                width: MediaQuery.of(context)
                                        .size
                                        .width *
                                    0.30,
                                decoration: categorySelector == category['name']
                                    ? BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(
                                                17),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(
                                                17),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        border: Border.all(
                                            color: Colors
                                                .grey.shade400,
                                            width: 2)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      category['name'],
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context)
                                      .size
                                      .width *
                                  0.02,
                            ),
                          ],
                        );
                                        
                      },
                    ),
                  );
                }
              ),
              StreamBuilder(
                stream: categorySelector == null
                ?FirebaseFirestore.instance.collection('products').snapshots()
                :FirebaseFirestore.instance
                .collection('products')
                .where('category', isEqualTo: categorySelector)
                .snapshots(), 
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    Text(
                      'No hay productos disponibles',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onSurface
                      ),
                    );
                  }
                  final products = snapshot.data!.docs;
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, i) {
                            final product = products[i];
                            return Column(
                              children: [
                                InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(20),
                                child: Ink(
                                  height:MediaQuery.of(context).size.height*0.15,
                                  width:MediaQuery.of(context).size.width *1,
                                  decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(20),
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: 2
                                    )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height,
                                          width: MediaQuery.of(context).size.width*0.3,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/shirt.jpg'
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*0.02,),
                                        Column(
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              product['name'],
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight:
                                                    FontWeight.w500,
                                                color:
                                                    Colors.grey.shade600,
                                              ),
                                            ),
                                            Text(
                                              '\$ ${product['price']}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight:
                                                    FontWeight.w500,
                                                color:
                                                    Colors.grey.shade600,
                                              ),
                                            ),
                                            SizedBox(height:MediaQuery.of(context).size.height *0.01,),
                                            Text(
                                              '${product['quantity']} disponibles',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface),
                                            ),
                                            
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),SizedBox( height:MediaQuery.of(context).size.height*0.02,),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
