abstract class ConnectionService {
  Stream<bool> get status;

  void destroy();
}
