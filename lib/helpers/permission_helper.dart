import 'package:permission_handler/permission_handler.dart';

/// Verifie l'etat de la permission d'acceder au microphone et a la camera.
///
/// S'ils au moins un des deux est refusé return `false`. Sinon `true`.
///
/// Prompt automatiquement si necessaire.
Future<bool> canUseCameraAndMicrophone() async {
  final statuses = await <Permission>[
    Permission.camera,
    Permission.microphone,
  ].request();

  return statuses.values.every((s) => s == PermissionStatus.granted);
}
