import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/category.dart';

class NewProductSalesScreen extends StatefulWidget {
  const NewProductSalesScreen({super.key});

  @override
  State<NewProductSalesScreen> createState() => _NewProductSalesScreenState();
  
}

class _NewProductSalesScreenState extends State<NewProductSalesScreen> {
  late Category category;

   @override
  void initState() {
    super.initState();
    category = Category.empty;
  }


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
              
            },
            icon: Icon(
              CupertinoIcons.barcode_viewfinder,
              size: 35,
            ),
          )
        ],
      ),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width*1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          category.select = 0;
                        });
                        
                      },
                      borderRadius: BorderRadius.circular(17),
                      child: Ink(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: category.select == 0
                        ? BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Theme.of(context).colorScheme.primary,
                          )
                        : BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Theme.of(context).colorScheme.onPrimary,
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 2
                          )
                        ),
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Todas las categorias',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          category.select = 1;
                        });
                      },
                      borderRadius: BorderRadius.circular(17),
                      child: Ink(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.30,
                        decoration: category.select == 1
                        ? BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Theme.of(context).colorScheme.primary,
                          )
                        : BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Theme.of(context).colorScheme.onPrimary,
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 2
                          )
                        ),
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Accesorios',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          category.select = 2;
                        });
                      },
                      borderRadius: BorderRadius.circular(17),
                      child: Ink(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: category.select == 2
                        ? BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Theme.of(context).colorScheme.primary,
                          )
                        : BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Theme.of(context).colorScheme.onPrimary,
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 2
                          )
                        ),
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Camisas',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}