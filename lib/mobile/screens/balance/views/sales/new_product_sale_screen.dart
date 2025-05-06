
import 'package:business_repository/repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_business_hub/mobile/screens/Inventary/bloc/inventory_blocs.dart';
import 'package:smart_business_hub/mobile/screens/Inventary/views/create_product_screen.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/barcode_scaner.dart';

class NewProductSalesScreen extends StatefulWidget {
  const NewProductSalesScreen({super.key});

  @override
  State<NewProductSalesScreen> createState() => _NewProductSalesScreenState();
  
}

class _NewProductSalesScreenState extends State<NewProductSalesScreen> {
  String? categorySelector;
  Map<String, int> contador = {};

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.surface,
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        'Nueva Venta',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back, 
          color: Theme.of(context).colorScheme.onSurface,
          size: 26,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BarcodeScaner()));
          },
          icon: Icon(
            CupertinoIcons.barcode_viewfinder,
            size: 35,
          ),
        )
      ],
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed:() {
        
      },
      elevation: 0,
      backgroundColor: Colors.black,
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.035,
                width: MediaQuery.of(context).size.width*0.075,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Color.fromRGBO(27, 45, 52, 0.548),
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  )
                )
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.02,),
              Text(
                'Canasta',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width*0.4,),
          Row(
            children: [
              Text(
                '\$ 10',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              )
            ],
          )
        ],
      )
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          SearchBar(
            elevation: WidgetStateProperty.all(0),
            backgroundColor: WidgetStateProperty.all(Colors.white),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            leading: Icon(
              Icons.search, 
              color: Colors.grey,
              size: 26,
            ),
            hintText: 'Busca por nombre o código',
            hintStyle: WidgetStatePropertyAll(
              TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
            )
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
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) =>
                        CreateProductBloc(FirebaseProductRepo()),
                    child: CreateProductScreen(),
                  )));
            },
            borderRadius: BorderRadius.circular(17),
            child: Ink(
              height: MediaQuery.of(context).size.height*0.07,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Theme.of(context).colorScheme.onPrimary,
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: 1
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 40,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    Text(
                      'Nuevo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'Producto',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
            width: MediaQuery.of(context).size.width*5,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: categorySelector == null
              ?FirebaseFirestore.instance.collection('products').snapshots()
              :FirebaseFirestore.instance
              .collection('products')
              .where('category', isEqualTo: categorySelector)
              .snapshots(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(height:1,width: 1,child:CircularProgressIndicator());
                } if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Text(
                    'No hay productos disponibles',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onSurface
                    ),
                  );
                }
                final products = snapshot.data!.docs;
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 9 / 16 
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, i) {
                      final product = products[i];
                      final productId = product.id;
                      final counter = (contador[productId] ?? 0);
                      return InkWell(
                          onTap: () {
                            setState(() {
                              contador[productId] = counter + 1;
                            });
                          },
                          borderRadius: BorderRadius.circular(17),
                          child: Ink(
                            height: MediaQuery.of(context).size.height*0.25,
                            width: MediaQuery.of(context).size.width*0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 2
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.13,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17),
                                      image: DecorationImage(
                                        image: AssetImage('assets/shirt.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        counter == 0
                                        ?Container(
                                          height: MediaQuery.of(context).size.height*0.035,
                                          width: MediaQuery.of(context).size.width*0.08,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          child: Icon(Icons.add_circle_outline,
                                            size: 30,
                                            color: Theme.of(context).colorScheme.onSurface,
                                          ),
                                        )
                                        :Container(
                                          height: MediaQuery.of(context).size.height*0.035,
                                          width: MediaQuery.of(context).size.width*0.11,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.amber,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Icon(Icons.shopping_basket_outlined,
                                                  size: 30,
                                                  color: Theme.of(context).colorScheme.onSurface,
                                                ),
                                                Text(
                                                  '$counter',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.01,
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
                                    '${product['quantity']} disponibles',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight:
                                            FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}