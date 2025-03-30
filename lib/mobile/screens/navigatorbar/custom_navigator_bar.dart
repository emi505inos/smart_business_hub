import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smart_business_hub/mobile/screens/Inventary/inventary_screen.dart';
import 'package:smart_business_hub/mobile/screens/balance/balance_screen.dart';
import 'package:smart_business_hub/mobile/screens/debts/debts_screen.dart';
import 'package:smart_business_hub/mobile/screens/explorer/explorer_screen.dart';
import 'package:smart_business_hub/mobile/screens/homescreen/home_screen.dart';
import 'package:smart_business_hub/providers/navigator_bar_provider.dart';

class CustomeNavigationBar extends StatefulWidget { 
  const CustomeNavigationBar({super.key});
  
  
@override State<CustomeNavigationBar> createState() => _CustomeNavigationBarState(); } 

class _CustomeNavigationBarState extends State<CustomeNavigationBar> { 
 
  
@override Widget build(BuildContext context) { 
  return BottomAppBar(
    color: Theme.of(context).colorScheme.onSurface, 
    child: Consumer <NavigationBarProvider>(
      builder: (context, provider ,child) {
        final controller = Provider.of<NavigationBarProvider>(context, listen: false);
        return SafeArea(
          child: Row( 
          mainAxisAlignment: MainAxisAlignment.spaceAround, 
          children: [ 
            GestureDetector( 
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.house, 
                    color: provider.currentPageIndex == 0 
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Inicio',
                    style: TextStyle(
                      color: provider.currentPageIndex == 0 
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                    ),
                  )
                ],
              ), 
                onTap: () { 
                  controller.updataCurrentPage(0); 
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));  
              }, 
            ), 
            GestureDetector( 
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.fileLines, 
                    color: provider.currentPageIndex == 1
                    ? Theme.of(context).colorScheme.primary 
                    : Colors.grey,
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Balance',
                    style: TextStyle(
                      color: provider.currentPageIndex == 1 
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                    ),
                  )
                ],
              ), 
              onTap: () { 
                controller.updataCurrentPage( 1 );
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => BalanceScreen())); 
              }, 
            ), 
            GestureDetector( 
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.scaleBalanced, 
                    color: provider.currentPageIndex == 2 
                    ? Theme.of(context).colorScheme.primary 
                    : Colors.grey,
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Deudas',
                    style: TextStyle(
                      color: provider.currentPageIndex == 2 
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                    ),
                  )
                ],
              ), 
              onTap: () { 
               controller.updataCurrentPage( 2 );
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DebtsScreen())); 
              }, 
            ), 
            GestureDetector( 
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.boxesStacked, 
                    color: provider.currentPageIndex == 3 
                    ? Theme.of(context).colorScheme.primary 
                    : Colors.grey,
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Inventario',
                    style: TextStyle(
                      color: provider.currentPageIndex == 3 
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                    ),
                  )
                ],
              ), 
              onTap: () { 
                controller.updataCurrentPage( 3 ); 
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => InventaryScreen())); 
              }, 
            ), 
            GestureDetector( 
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.bars, 
                    color: provider.currentPageIndex == 4 
                    ? Theme.of(context).colorScheme.primary 
                    : Colors.grey,
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Explorar',
                    style: TextStyle(
                      color: provider.currentPageIndex == 4 
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                    ),
                  )
                ],
              ), 
              onTap: () { 
                controller.updataCurrentPage( 4 ); 
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExplorerScreen())); 
              }, 
              ), 
            ], 
          ),
        );
      }
    ), 
    ); 
  } 
}