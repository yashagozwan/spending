import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:spending/core/services/connection_service.dart';

@LazySingleton(as: ConnectionService)
class ConnectionServiceImpl implements ConnectionService {
  final Connectivity _connectivity;
  final Logger _logger;

  ConnectionServiceImpl(
    this._connectivity,
    this._logger,
  );

  @override
  Stream<bool> get status {
    final stream = StreamController<bool>();

    _connectivity.checkConnectivity().then((value) {
      if (value == ConnectivityResult.mobile ||
          value == ConnectivityResult.wifi) {
        stream.sink.add(true);
      } else {
        stream.sink.add(false);
      }
    });

    _connectivity.onConnectivityChanged.listen((event) async {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        stream.sink.add(true);
      } else {
        stream.sink.add(false);
      }
    });
    return stream.stream;
  }

  @override
  void destroy() async {}
}
