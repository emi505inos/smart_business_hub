import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
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
        return Row( 
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
                // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())); 
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
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityScreen())); 
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
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => QrScreen())); 
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
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CreditCardsScreen())); 
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
              // Navigator.push(context, MaterialPageRoute(builder: (context) => MoreScreen())); 
            }, 
            ), 
          ], 
        );
      }
    ), 
    ); 
  } 
}