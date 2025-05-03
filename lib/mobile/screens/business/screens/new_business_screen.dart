import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  TextEditingController barCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String selectedOption = 'Selecciona una opción';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'Crear Empresa',
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
        ),
        bottomNavigationBar: BottomAppBar(
          height: MediaQuery.of(context).size.height * 0.1,
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.015,
                        horizontal: MediaQuery.of(context).size.width * 0.2)),
                child: Text(
                  'Crear Empresa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () async {},
                  child: DottedBorder(
                    radius: Radius.circular(17),
                    borderType: BorderType.RRect,
                    dashPattern: [8, 4],
                    color: Colors.blue.shade600,
                    child: Ink(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade50,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.photo,
                            size: 100,
                            color: Colors.blue.shade200,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Cargar Imagen",
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  'Nombre del negocio',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 4,
                  child: TextFormField(
                      controller: nameController,
                      textAlignVertical: TextAlignVertical.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.5,
                            )),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        }
                        return null;
                      }),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  'Direccion',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 4,
                  child: TextFormField(
                      controller: quantityController,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.5,
                            )),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        }
                        return null;
                      }),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  'Ciudad',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 4,
                  child: TextFormField(
                      controller: descriptionController,
                      textAlignVertical: TextAlignVertical.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'Añade una descripción',
                        hintStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.5,
                            )),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        }
                        return null;
                      }
                    ),
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                  'Correo',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 4,
                  child: TextFormField(
                      controller: descriptionController,
                      textAlignVertical: TextAlignVertical.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'Añade una descripción',
                        hintStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.5,
                            )),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        }
                        return null;
                      }
                    ),
                  ), 
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  'Categoría',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                // InkWell(
                //   onTap: () {
                //     showModalBottomSheet(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return BlocProvider(
                //           create: (context) =>
                //               GetCategoriesBloc(FirebaseCategoryRepo())
                //                 ..add(GetCategories()),
                //           child: BlocBuilder<GetCategoriesBloc,
                //               GetCategoriesState>(builder: (context, state) {
                //             if (state is GetCategoriesSuccess) {
                //               final categories = state.category;
                //               if (categories.isEmpty) {
                //                 return const Center(
                //                   child: Text(
                //                     'No hay categorias registradas',
                //                     style: TextStyle(fontSize: 20),
                //                   ),
                //                 );
                //               }
                //               return Container(
                //                 padding: EdgeInsets.all(16),
                //                 child: Column(
                //                   children: [
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text(
                //                           'Escoge una categoría',
                //                           style: TextStyle(
                //                               fontSize: 18.0,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         IconButton(
                //                             onPressed: () {
                //                               Navigator.pop(context);
                //                             },
                //                             icon: Icon(
                //                                 FontAwesomeIcons
                //                                     .solidCircleXmark,
                //                                 color: Theme.of(context)
                //                                     .colorScheme
                //                                     .onSurface)),
                //                       ],
                //                     ),
                //                     SizedBox(
                //                       height:
                //                           MediaQuery.of(context).size.height *
                //                               0.3,
                //                       width: MediaQuery.of(context).size.width,
                //                       child: ListView.builder(
                //                         itemCount: categories.length,
                //                         itemBuilder: (context, int i) {
                //                           return ListTile(
                //                             leading: Icon(
                //                               selectedOption ==
                //                                       categories[i].name
                //                                   ? Icons.radio_button_checked
                //                                   : Icons
                //                                       .radio_button_unchecked,
                //                             ),
                //                             title: Text(
                //                               categories[i].name,
                //                               style: TextStyle(
                //                                 fontSize: 18,
                //                                 fontWeight: FontWeight.bold,
                //                                 color: Theme.of(context)
                //                                     .colorScheme
                //                                     .onSurface,
                //                               ),
                //                             ),
                //                             onTap: () {
                //                               setState(() {
                //                                 selectedOption =
                //                                     categories[i].name;
                //                               });
                //                               Navigator.pop(context);
                //                             },
                //                           );
                //                         },
                //                       ),
                //                     ),
                //                     Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Column(
                //                         children: [
                //                           ElevatedButton(
                //                             onPressed: () {
                //                               // Navigator.of(context).push(
                //                               //     MaterialPageRoute(
                //                               //         builder: (context) =>
                //                               //             BlocProvider(
                //                               //               create: (context) =>
                //                               //                   CreateCategoryBloc(FirebaseCategoryRepo()),
                //                               //               child:
                //                               //                   CreateCategoriesScreen(),
                //                               //             )));
                //                             },
                //                             style: ButtonStyle(
                //                               backgroundColor:
                //                                   WidgetStateProperty.all(
                //                                       Theme.of(context)
                //                                           .colorScheme
                //                                           .onSurface),
                //                               shape: WidgetStateProperty.all<
                //                                   RoundedRectangleBorder>(
                //                                 RoundedRectangleBorder(
                //                                   borderRadius:
                //                                       BorderRadius.circular(15),
                //                                 ),
                //                               ),
                //                               fixedSize: WidgetStatePropertyAll(
                //                                   Size(
                //                                       MediaQuery.of(context)
                //                                           .size
                //                                           .width,
                //                                       MediaQuery.of(context)
                //                                               .size
                //                                               .height *
                //                                           0.06)),
                //                             ),
                //                             child: Text(
                //                               'Crear nueva categoría',
                //                               style: TextStyle(
                //                                 fontSize: 20,
                //                                 fontWeight: FontWeight.bold,
                //                                 color: Theme.of(context)
                //                                     .colorScheme
                //                                     .onPrimary,
                //                               ),
                //                             ),
                //                           ),
                //                           SizedBox(
                //                             height: MediaQuery.of(context)
                //                                     .size
                //                                     .height *
                //                                 0.01,
                //                           ),
                //                           ElevatedButton(
                //                             onPressed: () {
                //                               Navigator.pop(context);
                //                             },
                //                             style: ButtonStyle(
                //                               backgroundColor:
                //                                   WidgetStateProperty.all(
                //                                       Theme.of(context)
                //                                           .colorScheme
                //                                           .onPrimary),
                //                               shape: WidgetStateProperty.all<
                //                                   RoundedRectangleBorder>(
                //                                 RoundedRectangleBorder(
                //                                   borderRadius:
                //                                       BorderRadius.circular(15),
                //                                 ),
                //                               ),
                //                               side: WidgetStateProperty.all<
                //                                   BorderSide>(
                //                                 BorderSide(
                //                                   color: Theme.of(context)
                //                                       .colorScheme
                //                                       .onSurface,
                //                                   width: 2,
                //                                 ),
                //                               ),
                //                               fixedSize: WidgetStatePropertyAll(
                //                                   Size(
                //                                       MediaQuery.of(context)
                //                                           .size
                //                                           .width,
                //                                       MediaQuery.of(context)
                //                                               .size
                //                                               .height *
                //                                           0.06)),
                //                             ),
                //                             child: Row(
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.center,
                //                               children: [
                //                                 Icon(
                //                                   Icons.category_outlined,
                //                                   color: Theme.of(context)
                //                                       .colorScheme
                //                                       .onSurface,
                //                                 ),
                //                                 SizedBox(
                //                                   width: MediaQuery.of(context)
                //                                           .size
                //                                           .width *
                //                                       0.03,
                //                                 ),
                //                                 Text(
                //                                   'Cancelar',
                //                                   style: TextStyle(
                //                                     fontSize: 20,
                //                                     fontWeight: FontWeight.bold,
                //                                     color: Theme.of(context)
                //                                         .colorScheme
                //                                         .onSurface,
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                           )
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               );
                //             } else if (state is GetCategoriesFailure) {
                //               return const Center(
                //                 child: Text(
                //                   'Error al cargar los clientes',
                //                   style: TextStyle(fontSize: 20),
                //                 ),
                //               );
                //             } else {
                //               return const Center(
                //                 child: CircularProgressIndicator(),
                //               );
                //             }
                //           }),
                //         );
                //       },
                //     );
                //   },
                //   child: Ink(
                //     height: MediaQuery.of(context).size.height * 0.055,
                //     width: MediaQuery.of(context).size.width * 4,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(12),
                //       border: Border.all(
                //         color: Colors.grey,
                //         width: 1,
                //       ),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             selectedOption,
                //             style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold,
                //               color: Theme.of(context).colorScheme.onSurface,
                //             ),
                //           ),
                //           Icon(
                //             Icons.keyboard_arrow_down,
                //             size: 30,
                //             color: Theme.of(context).colorScheme.onSurface,
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                ],
              ),
            
          ),
        ),
      
    );
  }
}