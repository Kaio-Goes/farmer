import 'package:farmer/core/models/tracking_form.dart';
import 'package:flutter/material.dart';

class CreateExpeditionPage extends StatefulWidget {
  final TrackingForm trackingForm;
  const CreateExpeditionPage({super.key, required this.trackingForm});

  @override
  State<CreateExpeditionPage> createState() => _CreateExpeditionPageState();
}

class _CreateExpeditionPageState extends State<CreateExpeditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('sdsd'),
    );
  }
}
