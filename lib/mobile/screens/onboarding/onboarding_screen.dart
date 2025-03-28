import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_business_hub/mobile/screens/auth/screens/welcome_screen.dart';

import 'widget/item_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final data = [
  ItemData(
    title: 'Camino al éxito.', 
    subtitle: 'SmartBusiness Hub te guía en cada paso para transformar la gestión de tu negocio.', 
    image: const AssetImage('assets/business.png'), 
    backgroundColor: const Color.fromARGB(115, 92, 226, 163), 
    titleColor: Color.fromRGBO(27, 45, 52, 1), 
    subtitleColor: Color.fromRGBO(27, 45, 52, 1),
    background: Lottie.network('https://assets2.lottiefiles.com/packages/lf20_bq485nmñ.json'),
    ),
    ItemData(
      title: 'Conecta con tus Clientes', 
      subtitle: 'Haz que cada interacción sea más eficiente y memorable con SmartBusiness Hub', 
      image: const AssetImage('assets/admin-business.png'), 
      backgroundColor: Colors.grey.shade200, 
      titleColor: Color.fromRGBO(27, 45, 52, 1), 
      subtitleColor: Color.fromRGBO(27, 45, 52, 1),
      background: Lottie.network('https://assets2.lottiefiles.com/packages/lf20_bq485nmñ.json'),
      ),
      ItemData(
      title: 'Construyendo confianza', 
      subtitle: 'Descubre cómo la calidad, el soporte y la mejora continua pueden impulsar tu éxito empresarial', 
      image: const AssetImage('assets/customer.png'), 
      backgroundColor: const Color.fromARGB(115, 92, 226, 163), 
      titleColor: Color.fromRGBO(27, 45, 52, 1), 
      subtitleColor: Color.fromRGBO(27, 45, 52, 1),
      background: Lottie.network('https://assets2.lottiefiles.com/packages/lf20_bq485nmñ.json'),
      ),
      ItemData(
      title: 'Gestiona tu equipo', 
      subtitle: 'Optimiza el manejo de empleados, desde la organización hasta la evaluación, con herramientas inteligentes', 
      image: const AssetImage('assets/human-resourses.png'), 
      backgroundColor: Colors.grey.shade200, 
      titleColor: Color.fromRGBO(27, 45, 52, 1),
      subtitleColor: Color.fromRGBO(27, 45, 52, 1),
      background: Lottie.network('https://assets2.lottiefiles.com/packages/lf20_bq485nmñ.json'),
      ),
      ItemData(
      title: 'Controla tu Inventario', 
      subtitle: 'Organiza, escanea y optimiza cada movimiento para una gestión más inteligente', 
      image: const AssetImage('assets/inventory.png'), 
      backgroundColor: const Color.fromARGB(115, 92, 226, 163), 
      titleColor: Color.fromRGBO(27, 45, 52, 1), 
      subtitleColor: Color.fromRGBO(27, 45, 52, 1),
      background: Lottie.network('https://assets2.lottiefiles.com/packages/lf20_bq485nmñ.json'),
      ),
];

  int _currentIndex = 0;

 @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          ConcentricPageView(
            colors: data.map((e) => e.backgroundColor).toList(),
            itemCount: data.length,
            onChange: (index) {
              setState(() {
                _currentIndex = index;  
              }); 
            },
            itemBuilder: (index) => ItemWidget(data: data[index]),
            nextButtonBuilder: (context) {
              if (_currentIndex == data.length - 1) {
                return IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                  }, 
                  icon: Icon(
                    Icons.navigate_next,
                    color: Colors.grey.shade200,
                    size: screenWidth * 0.08,
                  )
                );
              } else {
                return Container();   
              }
            },
          ),
        ]
      ),
    );
  }
}
