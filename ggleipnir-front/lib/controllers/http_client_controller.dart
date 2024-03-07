
import 'package:ggleipnir_front/models/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameListProvider = Provider<HttpClient>((ref) {
  return HttpClient();
});

final lobbyListProvider = Provider<HttpClient>((ref) {
  return HttpClient();
});