import 'package:dio/dio.dart';
import 'package:super_heroes/config/constants/envrionments.dart';
import 'package:super_heroes/config/helpers/convert.dart';

class CallApi {
  
  static final _timeStamp = DateTime.now().millisecondsSinceEpoch;
  static final dio = Dio(
    BaseOptions(
      baseUrl: 'https://gateway.marvel.com:443/v1/public',
      queryParameters: {
        'apikey': Environments.publicKey,
        'hash': Convert.toMD5('$_timeStamp${Environments.privateKey}${Environments.publicKey}'),
        'ts': _timeStamp,
      },
    ),
  );
}
