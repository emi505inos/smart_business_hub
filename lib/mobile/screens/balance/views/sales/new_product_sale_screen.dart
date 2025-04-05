import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/barcode_scaner.dart';
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
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width*5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      
                    },
                    borderRadius: BorderRadius.circular(17),
                    child: DottedBorder(
                      radius: Radius.circular(17),
                      borderType: BorderType.RRect,
                      color: Colors.grey.shade600,
                      child: Ink(
                        height: MediaQuery.of(context).size.height*0.25,
                        width: MediaQuery.of(context).size.width*0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Theme.of(context).colorScheme.onPrimary,
                           
                        ),
                        
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
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
                  ),
                  InkWell(
                    onTap: () {
                      
                    },
                    borderRadius: BorderRadius.circular(17),
                    child: Ink(
                      height: MediaQuery.of(context).size.height*0.25,
                      width: MediaQuery.of(context).size.width*0.3,
                      color: Theme.of(context).colorScheme.surface,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Container(
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.01,
                            ),
                            Text(
                              '\$ 10',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Text(
                              'Camisa',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              '10 disponibles',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      
                    },
                    borderRadius: BorderRadius.circular(17),
                    child: Ink(
                      height: MediaQuery.of(context).size.height*0.25,
                      width: MediaQuery.of(context).size.width*0.3,
                      color: Theme.of(context).colorScheme.surface,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.13,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                image: DecorationImage(
                                  image: AssetImage('assets/acesorios.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.01,
                            ),
                            Text(
                              '\$ 25',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Text(
                              'Acesorios',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              '100 disponibles',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}