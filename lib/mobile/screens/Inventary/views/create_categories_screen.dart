import 'package:business_repository/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_business_hub/mobile/screens/Inventary/bloc/create_category/create_category_bloc.dart';
import 'package:uuid/uuid.dart';

class CreateCategoriesScreen extends StatefulWidget {
  const CreateCategoriesScreen({super.key});

  @override
  State<CreateCategoriesScreen> createState() => _CreateCategoriesScreenState();
}

class _CreateCategoriesScreenState extends State<CreateCategoriesScreen> {
  TextEditingController nameController = TextEditingController();
  late Category category;

  @override
  void initState() {
    category = Category.empty;
    category.categoryId = const Uuid().v1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateCategoryBloc, CreateCategoryState>(
      listener: (context, state) {
        if(state is CreateCategorySuccess) {

        }else if (state is CreateCategoryLoading) {
          setState(() {
            category = Category.empty;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'Crear categoría',
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
                    category.name = nameController.text;
                    context
                        .read<CreateCategoryBloc>()
                        .add(CreateCategory(category));
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
                  'Crear categoría',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'Nombre del producto',
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      hintText: 'Bebidas, Camisetas o Accesorios...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
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
                    }),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
