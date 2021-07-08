import 'package:flutter/foundation.dart';

class CardItemdata extends ChangeNotifier {
  List<int> _data = [];
  List<bool> _added = [];

  List<int> get data => _data;
  List<bool> get added => _added;

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
    _added.add(false);
    notifyListeners();
  }
  void removeId(int id){
    _added.removeAt(_data.indexOf(id));
    _data.remove(id);
    notifyListeners();
  }
  
  void toggleAdded(int id){
    _added[_data.indexOf(id)] = !_added[_data.indexOf(id)];
    notifyListeners();
  }
}