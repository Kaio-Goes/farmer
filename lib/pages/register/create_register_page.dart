import 'dart:math';

import 'package:farmer/components/on_selected_popup.dart';
import 'package:farmer/core/models/institution.dart';
import 'package:farmer/core/models/tracking_form.dart';
import 'package:farmer/core/services/auth_service.dart';
import 'package:farmer/core/utilities/styles_constants.dart';
import 'package:farmer/core/utilities/text_fields.dart';
import 'package:farmer/core/utilities/validations.dart';
import 'package:farmer/pages/expedition/create_expedition_page.dart';
import 'package:farmer/pages/register/my_register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateRegisterPage extends StatefulWidget {
  final Institution institution;
  const CreateRegisterPage({super.key, required this.institution});

  @override
  State<CreateRegisterPage> createState() => _CreateRegisterPageState();
}

class _CreateRegisterPageState extends State<CreateRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? productCulture;
  TextEditingController productNameController = TextEditingController();
  TextEditingController unitValueController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController totalValueController = TextEditingController();
  TextEditingController weightValueController = TextEditingController();
  TextEditingController lotController = TextEditingController();
  TextEditingController manufacturingDateController = TextEditingController();
  TextEditingController invoiceController = TextEditingController();
  TextEditingController dateInvoiceController = TextEditingController();

  void _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    TrackingForm trancking = TrackingForm(
      id: Random().nextInt(200).toString(),
      institutionId: widget.institution.id,
      userId: AuthService().currentUser!.id,
      nameProduct: productNameController.text,
      quantity: int.parse(quantityController.text),
      productCulture: productCulture!,
      manufacturingDate: manufacturingDateController.text,
      weight: weightValueController.text,
      createdAt: DateTime.now().toString(),
    );

    listForm.add(trancking);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Rastreio criado com sucesso!'),
          content: Text(
              'Foi criado um formulário de rastreio, para emitir um etiqueta é necessário vincular'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const MyRegisterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 3,
                backgroundColor: colorPrimaty,
              ),
              child: const Text(
                "Meus rastreios",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                backgroundColor: colorTertiary,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => CreateExpeditionPage(
                      trackingForm: trancking,
                    ),
                  ),
                );
              },
              child: const Text(
                "Adicionar Expedição",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 223, 122),
      appBar: AppBar(
        title: const Text(
          'Formulário de Rastreio',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        actions: const [OnSelectedPopup()],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.29,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    const Color.fromARGB(255, 142, 223, 122),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Propriedade',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.institution.responsibleName,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'CNPJ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.institution.cnpj,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'CEP',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Text(
                                'Latitude',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Longitude',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.institution.cep,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                widget.institution.lat,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10),
                              Text(
                                widget.institution.long,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Logradouro',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            widget.institution.logradouro,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Text(
                              'Cultura do Produto',
                              style: TextStyle(
                                  color: labelColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            DropdownButtonFormField<String>(
                              value: productCulture,
                              items: [
                                const DropdownMenuItem(
                                    value: 'Abobora', child: Text('Abobora')),
                                const DropdownMenuItem(
                                    value: 'Arroz', child: Text('Arroz')),
                                const DropdownMenuItem(
                                    value: 'Batata', child: Text('Batata')),
                                const DropdownMenuItem(
                                    value: 'Banana', child: Text('Banana')),
                                const DropdownMenuItem(
                                    value: 'Chuchu', child: Text('Chuchu')),
                                const DropdownMenuItem(
                                    value: 'Tomate', child: Text('Tomate')),
                                const DropdownMenuItem(
                                    value: 'Soja', child: Text('Soja')),
                              ],
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onChanged: (value) {
                                setState(() {
                                  productCulture = value;
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Selecione a cultura do produto',
                                hintStyle: const TextStyle(color: Colors.grey),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 12.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                              ),
                              validator: (value) => validatorDropdown(value),
                            ),
                            SizedBox(height: 15),
                            modernTextFormField(
                              controller: productNameController,
                              validator: (value) => validatorName(value),
                              hint: 'Digite o nome do produto',
                              label: 'Nome do Produto',
                            ),
                            // SizedBox(height: 15),
                            // modernTextFormField(
                            //     controller: unitValueController,
                            //     validator: (value) => validatorMoney(value),
                            //     textInputType:
                            //         TextInputType.numberWithOptions(),
                            //     hint: 'Exemplo: R\$ 1000,00',
                            //     label: 'Valor Unidade',
                            //     inputFormatters: [
                            //       CurrencyInputFormatter(
                            //         thousandSeparator: ThousandSeparator.Period,
                            //         mantissaLength: 2,
                            //       )
                            //     ]),
                            SizedBox(height: 15),
                            modernTextFormField(
                              controller: quantityController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira uma quantidade.';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'A quantidade deve ser um número válido.';
                                }
                                return null;
                              },
                              hint: 'Digite a quantidade',
                              label: 'Quantidade',
                              textInputType:
                                  const TextInputType.numberWithOptions(),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                            SizedBox(height: 15),
                            modernTextFormField(
                                controller: weightValueController,
                                validator: (value) => validatorMoney(value),
                                textInputType:
                                    TextInputType.numberWithOptions(),
                                hint: 'Exemplo: 250.00',
                                label: 'Peso (KG)',
                                inputFormatters: [
                                  CurrencyInputFormatter(
                                    thousandSeparator: ThousandSeparator.Period,
                                    mantissaLength: 2,
                                  )
                                ]),
                            // SizedBox(height: 15),
                            // modernTextFormField(
                            //     controller: totalValueController,
                            //     validator: (value) => validatorMoney(value),
                            //     textInputType:
                            //         TextInputType.numberWithOptions(),
                            //     hint: 'Exemplo: R\$ 1000,00',
                            //     label: 'Valor Total',
                            //     inputFormatters: [
                            //       CurrencyInputFormatter(
                            //         thousandSeparator: ThousandSeparator.Period,
                            //         mantissaLength: 2,
                            //       )
                            //     ]),
                            // SizedBox(height: 15),
                            // modernTextFormField(
                            //   controller: lotController,
                            //   validator: (value) => validatorName(value),
                            //   hint: 'Digite o lote',
                            //   label: 'Lote',
                            // ),
                            SizedBox(height: 15),
                            modernTextFormField(
                              controller: manufacturingDateController,
                              validator: (value) => validatorDate(value),
                              hint: 'Digite a data 01/01/2025',
                              label: 'Data de Fabricação',
                              textInputType: TextInputType.numberWithOptions(),
                              inputFormatters: [
                                MaskTextInputFormatter(
                                  mask: '##/##/####',
                                  filter: {"#": RegExp(r'^[0-9]*$')},
                                  type: MaskAutoCompletionType.lazy,
                                )
                              ],
                            ),
                            // SizedBox(height: 15),
                            // modernTextFormField(
                            //   controller: invoiceController,
                            //   validator: (value) => validatorName(value),
                            //   hint: 'Digite o Nº da Nota Fiscal',
                            //   label: 'Nota Fiscal',
                            // ),
                            // SizedBox(height: 15),
                            // modernTextFormField(
                            //   controller: dateInvoiceController,
                            //   validator: (value) => validatorDate(value),
                            //   hint: 'Digite a data 01/01/2025',
                            //   label: 'Data de Emissão da NF',
                            //   textInputType: TextInputType.numberWithOptions(),
                            //   inputFormatters: [
                            //     MaskTextInputFormatter(
                            //       mask: '##/##/####',
                            //       filter: {"#": RegExp(r'^[0-9]*$')},
                            //       type: MaskAutoCompletionType.lazy,
                            //     )
                            //   ],
                            // ),
                            SizedBox(height: 15),
                            Center(
                              child: ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  backgroundColor: colorTertiary,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 45),
                                ),
                                child: const Text(
                                  'Cadastrar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 40)
                          ],
                        ),
                      ),
                    )),
              ),
            )
          ],
        );
      }),
    );
  }
}
