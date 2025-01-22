import 'package:barcode/barcode.dart';
import 'package:farmer/core/models/institution.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:farmer/core/models/tracking_form.dart';

void generatePdf(
    BuildContext context, TrackingForm form, Institution institution) async {
  final pdf = pw.Document();

  // Formatação de moeda
  // final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt_BR');

  // Adicionar página ao PDF
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // Título
          pw.Text(
            'Produto rastreado desde a produção',
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 10),
          // Tabela de dados
          pw.Table(
            border: pw.TableBorder.all(),
            columnWidths: {
              0: pw.FractionColumnWidth(0.5),
              1: pw.FractionColumnWidth(0.5),
            },
            children: [
              pw.TableRow(children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child: pw.Text(
                      'Produzido:\nNome: ${form.nameProduct}\nCNPJ: ${institution.cnpj}\nEndereço: ${institution.logradouro}\nCoordenadas: [${institution.lat}, ${institution.long}]\nTEL: ${institution.phone}'),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child: pw.Text(
                      'Varejista:\nNome: ${form.ratailerCorporateName ?? 'N/A'}\nCNPJ: ${form.cnpjCorparateName}\nEndereço: ${form.adresssCorporate}\nCoordenadas: [${form.lat},${form.long}]\nTEL: ${form.phone}'),
                ),
              ]),
              pw.TableRow(children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child:
                      pw.Text('Data de entrega: ${form.dateInvoice ?? 'N/A'}'),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child: pw.Container(
                    height: 50, // Altura do código de barras
                    child: pw.BarcodeWidget(
                      barcode: Barcode.code128(), // Tipo de código de barras
                      data: form.cnpjCorparateName ?? '1234567890123',
                      width: double.infinity,
                      height: 50,
                    ),
                  ),
                ),
              ]),
              pw.TableRow(children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child: pw.Text('Autenticador: ${'N/A'}'),
                ),
                pw.Container(), // Deixe vazio se não houver dados adicionais.
              ]),
            ],
          ),
        ],
      ),
    ),
  );

  // Exibir o PDF
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
