import 'package:farmer/core/models/tracking_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTrackingForm extends StatelessWidget {
  final TrackingForm form;
  const CardTrackingForm({super.key, required this.form});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade50, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha((0.3 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text(
          form.nameProduct,
        ),
        titleTextStyle: const TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Cultura: ${form.productCulture}'),
            Text('Quantidade: ${form.quantity}'),
            Text('Lote: ${form.numlot}'),
            Text(
                'Date de Fabricação: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(form.manufacturingDate))}'),
            Text('Nota Fiscal: ${form.invoice}'),
            Text(
                'Data emissão da NF: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(form.manufacturingDate))}'),
            Text('Peso (kg): ${form.weight}'),
            Text(
                'Valor Unidade: ${formatCurrency.format(double.parse(form.unitValue))}'),
            Text(
                'Valor Total: ${formatCurrency.format(double.parse(form.totalValue))}'),
            SizedBox(height: 5),
            Text(
              'Formulário criado no dia ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(form.createdAt))}',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
