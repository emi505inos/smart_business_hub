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
        title: Text(
          'Empresa',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
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
                        SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Empresa',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                    ),
                                  ),
                                  Text(
                                    '+12345678912 ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.onSurface
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.08,),
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
            ),
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
    );
  }
}