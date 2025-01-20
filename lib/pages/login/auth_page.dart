import 'dart:io';

import 'package:farmer/core/models/auth_form_data.dart';
import 'package:farmer/core/utilities/styles_constants.dart';
import 'package:farmer/core/utilities/validations.dart';
import 'package:farmer/pages/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _authFormData = AuthFormData();
  TextEditingController textDate = TextEditingController();

  bool isLoading = false;
  bool loginValid = true;
  bool obscurePassword = true;

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Theme.of(context).colorScheme.error,
    ));
  }

  void _submit({required BuildContext context}) async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    try {
      if (!mounted) return;
      setState(() => isLoading = true);

      if (_authFormData.email.text == "agricultor@teste.com.br" &&
          _authFormData.password.text == "123456") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const DashboardPage(),
          ),
        );
      } else {
        setState(() {
          loginValid = false;
        });
      }
    } on SocketException {
      _showError(
          'Sem conexão com a internet. Verifique sua rede e tente novamente.');
    } catch (error) {
      _showError('Credencias inválidas, por favor verifique e tente novamente');
    } finally {
      // ignore: control_flow_in_finally
      if (!mounted) return;
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipOval(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/icon_agricultor-removebg.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    margin: const EdgeInsets.all(25),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    key: const ValueKey('email'),
                                    controller: _authFormData.email,
                                    decoration: const InputDecoration(
                                        label: Text('Email'),
                                        hintText: 'Digite seu email'),
                                    validator: (value) => validatorEmail(value),
                                  ),
                                  TextFormField(
                                    key: const ValueKey('password'),
                                    controller: _authFormData.password,
                                    onChanged: (password) {
                                      setState(() {
                                        _authFormData.password.text = password;
                                        loginValid = true;
                                      });
                                    },
                                    obscureText: obscurePassword,
                                    decoration: InputDecoration(
                                      label: const Text('Senha'),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          obscurePassword
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            obscurePassword = !obscurePassword;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: (value) => validatorPassword(
                                        value,
                                        loginValid: loginValid),
                                  ),
                                  const SizedBox(height: 25),
                                  // const ResetPasswordCard(),
                                  ElevatedButton(
                                    onPressed: () {
                                      _submit(context: context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      backgroundColor: colorTertiary,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 45),
                                    ),
                                    child: const Text(
                                      'Entrar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  // TextButton(
                                  //   onPressed: () {
                                  //     Navigator.of(context).push(
                                  //       MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const CreateUserPage(),
                                  //       ),
                                  //     );
                                  //   },
                                  //   child: const Text(
                                  //       'Criar uma nova conta usuário?'),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
