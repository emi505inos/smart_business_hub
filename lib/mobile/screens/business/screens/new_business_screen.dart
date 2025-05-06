import 'package:business_repository/repositories.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_business_hub/mobile/screens/business/bloc/create_business/create_business_bloc.dart';
import 'package:smart_business_hub/mobile/screens/business/model/type_of_business_list.dart';
import 'package:smart_business_hub/mobile/screens/homescreen/home_screen.dart';
import 'package:uuid/uuid.dart';

class NewBusinessScreen extends StatefulWidget {
  const NewBusinessScreen({super.key});

  @override
  State<NewBusinessScreen> createState() => _NewBusinessScreenState();
}

class _NewBusinessScreenState extends State<NewBusinessScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? selectedOption;
  late Business business;
  @override
  void setState(VoidCallback fn) {
    business = Business.empty;
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateBusinessBloc(FirebaseBusinessRepo()),
      child: BlocListener<CreateBusinessBloc, CreateBusinessState>(
        listener: (context, state) {
          if (state is CreateBusinessSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Empresa creada con éxito'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        } else if (state is CreateBusinessFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al crear la empresa'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is CreateBusinessLoading) {
          setState(() {
            business = Business.empty;
          });
        }
        },
        child: Scaffold(
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
          ),
          bottomNavigationBar: BottomAppBar(
            height: MediaQuery.of(context).size.height * 0.1,
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      business.businessID = const Uuid().v1();
                      business.owner = ownerController.text;
                      business.name = nameController.text;
                      business.typeOf = selectedOption;
                      business.address = addressController.text;
                      business.city = cityController.text;
                      business.email = emailController.text;
                      business.phoneNumber = phoneNumberController.text;
                      context
                          .read<CreateBusinessBloc>()
                          .add(CreateBusiness(business));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary,
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Tu nombre',
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
                        controller: ownerController,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (context, setModalState) {
                                return Container(
                                  padding: EdgeInsets.all(16),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Escoge una categoría',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                    FontAwesomeIcons
                                                        .solidCircleXmark,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurface)),
                                          ],
                                        ),
                                        SizedBox(height: 16.0),
                                        ...typeOfBusiness.map(
                                          (typeOfBusiness) => ListTile(
                                            leading: Icon(
                                              typeOfBusiness['icon'],
                                              size: 30,
                                            ),
                                            title: Text(
                                              typeOfBusiness['name'],
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                              ),
                                            ),
                                            trailing: Icon(
                                              selectedOption ==
                                                      typeOfBusiness['name']
                                                  ? Icons.radio_button_checked
                                                  : Icons
                                                      .radio_button_unchecked,
                                            ),
                                            onTap: () {
                                              setModalState(() {
                                                selectedOption =
                                                    typeOfBusiness['name'];
                                              });
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStateProperty.all(
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .onSurface),
                                                  shape: WidgetStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                  fixedSize:
                                                      WidgetStatePropertyAll(Size(
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.06)),
                                                ),
                                                child: Text(
                                                  'Continuar',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                    },
                    child: Ink(
                      height: MediaQuery.of(context).size.height * 0.055,
                      width: MediaQuery.of(context).size.width * 4,
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
                            Text(
                              selectedOption ?? 'Selecciona una opción',
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Numero de celular',
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
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    'Dirección',
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
                        controller: addressController,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    'Ciudad',
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
                        controller: cityController,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    'Correo',
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
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
