import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Stream<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Stream<bool> get isConnected {
    return connectivity.onConnectivityChanged
        .map(isConnectedFromConnectivityResult);
  }

  bool isConnectedFromConnectivityResult(ConnectivityResult result) {
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }
}
