import 'package:flutter/material.dart';

class SelectedPageProvider extends ChangeNotifier {
  int selectedPage = 0;
  SelectedPageProvider({
    this.selectedPage = 0,
  });

  void changePage(int page) {
    selectedPage = page;
    notifyListeners();
  }
}
