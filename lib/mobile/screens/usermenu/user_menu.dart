import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_business_hub/mobile/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

class UserMenuScreen extends StatelessWidget {
  const UserMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: BackButton(
          style: ButtonStyle(
            iconSize: WidgetStatePropertyAll(35)
          ),
          color: Theme.of(context).colorScheme.onSurface,
        ),
        title: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('business').snapshots(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final business = snapshot.data!.docs.first['name'];
                return 
                  Text(
                    '$business',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface
                    ),
                  );
                },
              ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  
                },
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 1,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[350],
                          radius: MediaQuery.of(context).size.width *0.08,
                          child: Icon(
                            FontAwesomeIcons.circleUser,
                            size: MediaQuery.of(context).size.width *0.1,
                            ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance.collection('business').snapshots(), 
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  final business = snapshot.data!.docs.first;
                                  return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          business['name'],
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '+${business['phoneNumber']}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context).colorScheme.onSurface
                                              ),
                                            ),
                                            Icon(
                                              Icons.verified_sharp,
                                              size: 18,
                                              color: Colors.blue,
                                            )
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Editar perfil',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600]
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_right)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              InkWell(
                onTap: () {
                  
                },
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 1,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.add_circled,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: MediaQuery.of(context).size.width *0.06,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                        Text(
                          'Agregar otro negocio',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.015,),
              InkWell(
                onTap: () {
                  
                },
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 1,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.bag,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: MediaQuery.of(context).size.width *0.06,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                        Text(
                          'Configura tu catálogo virtual',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.015,),
              InkWell(
                onTap: () {
                  
                },
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 1,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.printer,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: MediaQuery.of(context).size.width *0.06,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                        Text(
                          'Impresora',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.22,),
              InkWell(
                onTap: () {
                  
                },
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 1,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/soporte.png',
                          height: MediaQuery.of(context).size.height*0.15,
                          width: MediaQuery.of(context).size.width*0.15,
                          // color: Theme.of(context).colorScheme.onSurface,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.06,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ayuda',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'Encuentra nuestros tutoriales y ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]
                              ),
                            ),
                            Text(
                              'preguntas frecuentes.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              GestureDetector(
                onTap: () {
                  context.read<SignInBloc>().add(SignOutRequired());
                },
                child: Text(
                  'CERRAR SESIÓN',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}