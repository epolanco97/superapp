import 'dart:convert';

import 'package:crypto/crypto.dart';

class Convert {

  static String toMD5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  } 

}