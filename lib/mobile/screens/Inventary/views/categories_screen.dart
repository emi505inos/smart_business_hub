import 'package:business_repository/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_business_hub/mobile/screens/Inventary/bloc/create_category/create_category_bloc.dart';
import 'package:smart_business_hub/mobile/screens/Inventary/bloc/inventory_blocs.dart';
import 'package:smart_business_hub/mobile/screens/Inventary/views/create_categories_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateCategoryBloc, CreateCategoryState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'Crear Categorias',
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
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) =>
                            CreateCategoryBloc(FirebaseCategoryRepo()),
                        child: CreateCategoriesScreen(),
                      ),
                    ));
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Ink(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 2.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 30,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Text(
                          'Crear nueva categoría',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                  child: BlocProvider(
                    create: (context) =>
                        GetCategoriesBloc(FirebaseCategoryRepo())
                          ..add(GetCategories()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
                            builder: (context, state) {
                              if (state is GetCategoriesSuccess) {
                                final categories = state.category;
                                if (categories.isEmpty) {
                                  return Center(
                                    child: Text(
                                      'No hay Categorias',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.onSurface
                                      ),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                itemCount: categories.length,
                                itemBuilder: (context, int i) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        borderRadius: BorderRadius.circular(20),
                                        child: Ink(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                              border: Border.all(
                                                  color: Colors.grey.shade400,
                                                  width: 2)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(FontAwesomeIcons.pen),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.02,
                                                    ),
                                                    Text(
                                                      categories[i].name,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ],
                                  );
                                },
                              );
                              }else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
