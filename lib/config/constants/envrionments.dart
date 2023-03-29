
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments{

  static String publicKey = (dotenv.env['PUBLIC_KEY'] == '') ? 'no-key': dotenv.env['PUBLIC_KEY']!;
  static String privateKey = (dotenv.env['PRIVATE_KEY'] == '') ? 'no-key': dotenv.env['PRIVATE_KEY']!;

}