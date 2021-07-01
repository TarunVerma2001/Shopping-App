import 'package:flutter/foundation.dart';

class CardItemdata extends ChangeNotifier {
  List<int> _data = [];

  List<int> get data => _data;

  bool contains(int id){
    if(_data.contains(id)){
      return true;
    } else{
      return false;
    }
    notifyListeners();
  }
  void addId(int id){
    _data.add(id);
    notifyListeners();
  }
  void removeId(int id){
    _data.remove(id);
    notifyListeners();
  }
}