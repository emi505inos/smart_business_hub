import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_business_hub/mobile/screens/Inventary/bloc/inventory_blocs.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  String selectedOption = 'Selecciona una opción';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesSuccess) {
          final categories = state.category;
          if (categories.isEmpty) {
            return const Center(
              child: Text(
                'No hay clientes registrados',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
          return Container(
            padding: EdgeInsets.all(16),            
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Escoge una categoría',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Theme.of(context).colorScheme.onSurface
                      )
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, int i) {
                      return ListTile(
                        leading: Icon(
                          selectedOption == categories[i].name
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                        ),
                        title: Text(
                          categories[i].name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedOption = categories[i].name;
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateProductScreen()));
                        },
                        style: ButtonStyle(
                          backgroundColor:WidgetStateProperty.all(Theme.of(context).colorScheme.onSurface),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(15),
                            ),
                          ),
                          fixedSize: WidgetStatePropertyAll(
                            Size(
                              MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height * 0.06
                            )
                          ),
                        ),
                        child: Text(
                          'Crear nueva categoría',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary,
                          ),
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height *0.01,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:WidgetStateProperty.all(Theme.of(context).colorScheme.onPrimary),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(15),
                            ),
                          ),
                          side: WidgetStateProperty.all<
                              BorderSide>(
                            BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface,
                              width: 2,
                            ),
                          ),
                          fixedSize: WidgetStatePropertyAll(
                              Size(
                                  MediaQuery.of(context)
                                      .size
                                      .width,
                                  MediaQuery.of(context)
                                          .size
                                          .height *
                                      0.06)),
                        ),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.category_outlined,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context)
                                      .size
                                      .width *
                                  0.03,
                            ),
                            Text(
                              'Cancelar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }else if (state is GetCategoriesFailure) {
          return const Center(
            child: Text(
              'Error al cargar los clientes',
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
            );
          }
        
      }
    );
  }
}