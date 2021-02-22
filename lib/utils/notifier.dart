import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';

class ReceiveMoneyNotifier with ChangeNotifier {
  String _image = 'assets/images/btc_ic.png';
  String _value = 'BTC';
  List<String> _others;
  int _index = 0;
  String _randomString =
      'V2aSkYkq8fzRkuuX939ZZAmz1SEzy6xvpdhtqjxi1gxtrjYmeGkd2Q==';

  String get image => _image;
  String get value => _value;
  List<String> get others => _others;
  int get index => _index;
  String get randomString => _randomString;

  void setNotifier(String img, String val, List<String> other) {
    _image = img;
    _value = val;
    _others = other;
    notifyListeners();
  }

  void setRandomString() {
    var random = Random.secure();
    var values = List<int>.generate(40, (i) => random.nextInt(255));
    _randomString = base64UrlEncode(values);
    print(_randomString);
    notifyListeners();
  }

  void setIndex(int indx) {
    _index = indx;
    notifyListeners();
  }
}
