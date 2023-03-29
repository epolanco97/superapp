import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_heroes/infrastructure/datasources/gateaway_marvel_datasource_impl.dart';
import 'package:super_heroes/infrastructure/repositories/gateaway_marvel_repository_impl.dart';

final gateawayMarvelRepositoryProvider = Provider((ref) {
  return GateawayMarvelRepositoryImpl(GateawayMarvelDatasourceImpl());
});
