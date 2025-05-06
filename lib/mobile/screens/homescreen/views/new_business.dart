import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_business_hub/mobile/screens/business/screens/new_business_screen.dart';

class NewBusiness extends StatelessWidget {
  const NewBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height*0.3,
        child:Column(
          children: [
             Padding(
               padding: const EdgeInsets.all(15),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cuentas',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    icon: Icon(
                      FontAwesomeIcons.solidCircleXmark,
                      size: 30,
                      color: Theme.of(context).colorScheme.onSurface
                      )
                    ),
                ],
                           ),
             ),
            Container(
              height: MediaQuery.of(context).size.height*0.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(92, 226, 170, 0.678),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.shirt,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 30,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Empresa',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'Ropa, zapatos y accesorios',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.penToSquare,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 20,
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                          Text(
                            'Editar',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewBusinessScreen(),));
              },
              child: Ink(
              height: MediaQuery.of(context).size.height*0.05,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline_rounded,
                      color:Theme.of(context).colorScheme.onSurface,
                      size: 30,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                    Text(
                    'Añadir otro negocio',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              ),
            )
          ],
        )
    );
  }
}