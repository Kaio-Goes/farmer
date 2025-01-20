import 'package:farmer/components/card_header.dart';
import 'package:farmer/components/on_selected_popup.dart';
import 'package:farmer/core/services/auth_service.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agricultor Rural'),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        actions: const [OnSelectedPopup(isDashboardPage: true)],
      ),
      body: Column(
        children: [CardHeader()],
      ),
    );
  }
}
