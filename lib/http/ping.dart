import 'dart:io';

/// Ping basique : Se connecte a la websocket du serveur et se deconnecte immediatement. Util pour voir si le serveur distant est accessible.
Future<bool> pingServer(String host, int port) async {
  Socket? socket;

  if (port < 1 || port > 65535) return false;

  try {
    socket =
        await Socket.connect(host, port, timeout: const Duration(seconds: 5));
    return true;
  } on SocketException {
    return false;
  } finally {
    await socket?.close();
  }
}
