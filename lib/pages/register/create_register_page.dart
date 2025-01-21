import 'package:farmer/components/on_selected_popup.dart';
import 'package:flutter/material.dart';

class CreateRegisterPage extends StatefulWidget {
  const CreateRegisterPage({super.key});

  @override
  State<CreateRegisterPage> createState() => _CreateRegisterPageState();
}

class _CreateRegisterPageState extends State<CreateRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulário de Rastreio',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        actions: const [OnSelectedPopup()],
      ),
      body: Text('fdf'),
    );
  }
}
