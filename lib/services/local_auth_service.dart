//* classe para ajudar a encapsular as funções do package local_auth

import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  //* variável que será injetada no construtor utilizando Provider
  final LocalAuthentication auth;

  LocalAuthService({required this.auth});

  //* Verificar se o dispositivo suporta a biometria
  Future<bool> isBiometricAvailable() async {
    //final LocalAuthentication auth = LocalAuthentication();
    // ···
    //* saber se pode checar a biometria
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    //* retorna se pode autenticar com biometria, ou se o dispositivo suporta biometria
    //? ou seja, verificar se a biometria está disponível no aparelho
    return canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    // final bool canAuthenticate =
    //     canAuthenticateWithBiometrics || await auth.isDeviceSupported();
  }

  //* Metodo para auxiliar na autenticação
  Future<bool> authenticate() async {
    return await auth.authenticate(
      localizedReason: 'Por favor, authentique-se para acessar o app',
    );
  }
}
