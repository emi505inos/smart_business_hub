import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/expence/models/categories_list.dart';
import 'package:smart_business_hub/mobile/screens/balance/views/sales/models/barcode_scaner.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
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
          'Crear Producto',
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
        height: MediaQuery.of(context).size.height*0.1,
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
          onPressed: () {
            setState(() {
              
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height*0.015,
              horizontal: MediaQuery.of(context).size.width*0.2
            )
          ),
          child: Text(
            'Crear Producto',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () async {
                },
                child:DottedBorder(
                  radius: Radius.circular(17),
                  borderType: BorderType.RRect,
                  dashPattern: [8, 4],
                  color: Colors.blue.shade600,
                  child: Ink(
                    width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.height*0.15,
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
                          style: TextStyle(
                            color: Colors.blue
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Text(
                'Código de barras',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.77,
                    child: TextFormField(
                      controller: barCodeController,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      decoration: InputDecoration(
                        hintText: 'Escribe el código de barras o esncanéalo',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15), 
                          borderSide: BorderSide(
                            color: Colors.grey, 
                            width: 2.5,
                          )
                        ),
                      ),
                      validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please fill in this field';
                      }
                      return null;
                      }
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BarcodeScaner(),));
                    },
                    child: Ink(
                      width: MediaQuery.of(context).size.width*0.13,
                      height: MediaQuery.of(context).size.height*0.062,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 2.5,
                        ),
                      ),
                      child: Icon(
                        CupertinoIcons.barcode_viewfinder,
                        color: Colors.black,
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text(
                'Nombre del producto',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
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
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15), 
                      borderSide: BorderSide(
                        color: Colors.grey, 
                        width: 2.5,
                      )
                    ),
                  ),
                  validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please fill in this field';
                  }
                  return null;
                  }
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text(
                'Cantidad disponible',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01),
              SizedBox(
                width: MediaQuery.of(context).size.width * 4,
                child: TextFormField(
                  controller: quantityController,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15), 
                      borderSide: BorderSide(
                        color: Colors.grey, 
                        width: 2.5,
                      )
                    ),
                  ),
                  validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please fill in this field';
                  }
                  return null;
                  }
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text(
                'Precio de venta',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01),
              SizedBox(
                width: MediaQuery.of(context).size.width * 4,
                child: TextFormField(
                  controller: priceController,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                  decoration: InputDecoration(
                    hintText: '\$ 0',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15), 
                      borderSide: BorderSide(
                        color: Colors.grey, 
                        width: 2.5,
                      )
                    ),
                  ),
                  validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please fill in this field';
                  }
                  return null;
                  }
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text(
                'Costo de compra',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01),
              SizedBox(
                width: MediaQuery.of(context).size.width * 4,
                child: TextFormField(
                  controller: costController,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                  decoration: InputDecoration(
                    hintText: '\$ 0',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15), 
                      borderSide: BorderSide(
                        color: Colors.grey, 
                        width: 2.5,
                      )
                    ),
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
              Text(
                'Categoría',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                  'Escoge una categoría',
                                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                              ...categories2.map(
                                (category) => ListTile(
                                  leading: Icon( selectedOption == category['name'] 
                                  ? Icons.radio_button_checked 
                                  : Icons.radio_button_unchecked, 
                                  ),
                                  title: Text(
                                    category['name'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.onSurface,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedOption = category['name'];
                                    });
                                    Navigator.pop(context);
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
                                      backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onSurface),
                                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      fixedSize: WidgetStatePropertyAll(Size(
                                        MediaQuery.of(context).size.width,
                                        MediaQuery.of(context).size.height*0.06
                                      )),
                                    ),
                                    child: Text('Crear nueva categoría',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }, 
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onPrimary),
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
                                        MediaQuery.of(context).size.width,
                                        MediaQuery.of(context).size.height*0.06
                                      )
                                      ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.category_outlined,
                                            color: Theme.of(context).colorScheme.onSurface,
                                          ),
                                          SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                                          Text(
                                            'Cancelar',
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
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Ink(
                  height: MediaQuery.of(context).size.height*0.055,
                  width: MediaQuery.of(context).size.width*4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedOption,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: Theme.of(context).colorScheme.onSurface,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03),
              Text(
                'Descripción',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01),
              SizedBox(
                width: MediaQuery.of(context).size.width * 4,
                child: TextFormField(
                  controller: descriptionController,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}