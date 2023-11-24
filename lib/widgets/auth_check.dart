import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/routes.dart';
import '../services/local_auth_service.dart';
import 'custom_button.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  final ValueNotifier<bool> isLocalAuthFailed = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    checkLocalAuth();
  }

  //* Função para sabe se o usuário tá logado através da biometria
  //* se não tiver logado, será encaminhado para uma segunda tela
  checkLocalAuth() async {
    final auth = context.read<LocalAuthService>();
    final isLocalAuthAvailable = await auth.isBiometricAvailable();
    isLocalAuthFailed.value = false;

    if (isLocalAuthAvailable) {
      final authenticated = await auth.authenticate();

      if (!authenticated) {
        isLocalAuthFailed.value = true;
      } else {
        if (!mounted) return;
        Navigator.of(context).pushReplacementNamed(
          Routes.initial,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      //* ValueListenableBuilder => escutando as mudanças no isLocalAuthFailed
      body: ValueListenableBuilder<bool>(
        valueListenable: isLocalAuthFailed,
        builder: (context, failed, _) {
          //* se a autenticação falhar, exibirá um botão para tentar autenticar novamente
          if (failed) {
            return Center(
              child: CustomButton(
                onPressed: checkLocalAuth,
                text: 'Tentar autenticar novamente',
              ),
            );
          }
          return Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.deepPurple.shade400,
              ),
            ),
          );
        },
      ),
    );
  }
}
