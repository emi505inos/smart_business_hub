import 'package:flutter/material.dart';

class NavigationBarProvider extends ChangeNotifier{
  int currentPageIndex = 0;
    updataCurrentPage (int value) {
      currentPageIndex = value;
      notifyListeners();
   }
}