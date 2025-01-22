import 'package:farmer/core/models/institution.dart';
import 'package:farmer/core/models/tracking_form.dart';
import 'package:farmer/core/utilities/styles_constants.dart';
import 'package:farmer/pages/expedition/create_expedition_page.dart';
import 'package:farmer/pages/register/create_register_page.dart';
import 'package:farmer/pages/register/my_register_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTrackingForm extends StatelessWidget {
  final TrackingForm form;
  final Institution institution;
  const CardTrackingForm(
      {super.key, required this.form, required this.institution});

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
            Text('Date de Fabricação: ${form.manufacturingDate}'),
            Text('Peso (kg): ${form.weight}'),
            Text(
              'Formulário criado no dia ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(form.createdAt))}',
              style: TextStyle(color: Colors.grey),
            ),
            if (form.ratailerCorporateName != null) ...[
              SizedBox(height: 10),
              Text(
                'Dados de expedição',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text('Empresa: ${form.ratailerCorporateName}'),
              if (form.numlot != null) Text('Lote: ${form.numlot}'),
              if (form.invoice != null) Text('Nota Fiscal: ${form.invoice}'),
              if (form.dateInvoice != null)
                Text('Data emissão da NF: ${form.dateInvoice}'),
              if (form.unitValue != null)
                Text(
                    'Valor Unidade: ${formatCurrency.format(double.parse(form.unitValue!))}'),
              if (form.totalValue != null)
                Text(
                    'Valor Total: ${formatCurrency.format(double.parse(form.totalValue!))}'),
            ],
            SizedBox(height: 5),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // Adicione aqui a funcionalidade desejada para o botão
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.library_add_check,
                          color: form.ratailerCorporateName == null
                              ? Colors.grey
                              : Colors.black),
                      title: Text(
                        'Gerar Etiqueta',
                        style: TextStyle(
                            color: form.ratailerCorporateName == null
                                ? Colors.grey
                                : Colors.black),
                      ),
                      subtitle: form.ratailerCorporateName == null
                          ? Text(
                              'Para gerar Etiqueta é necessário ter uma expedição',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            )
                          : null,
                      onTap: () {
                        if (form.ratailerCorporateName == null) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text('Editar Rastreamento'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => CreateRegisterPage(
                                    institution: institution,
                                    trackingForm: form,
                                  )),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(form.ratailerCorporateName == null
                          ? Icons.post_add_outlined
                          : Icons.edit_document),
                      title: Text(form.ratailerCorporateName == null
                          ? 'Adicionar Expedição'
                          : 'Editar Expedição'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CreateExpeditionPage(
                              trackingForm: form,
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      title: const Text('Excluir'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Tem certeza?'),
                              content:
                                  const Text('Você realmente deseja excluir?'),
                              actions: [
                                TextButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 3,
                                    backgroundColor: colorPrimaty,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Cancelar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                TextButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 3,
                                    backgroundColor: colorTertiary,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                  ),
                                  onPressed: () async {
                                    listForm.removeWhere(
                                        (item) => item.id == form.id);
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyRegisterPage()),
                                    );
                                  },
                                  child: const Text(
                                    'Confirmar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
