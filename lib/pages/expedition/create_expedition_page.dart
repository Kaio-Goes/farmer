import 'package:farmer/components/on_selected_popup.dart';
import 'package:farmer/core/models/institution.dart';
import 'package:farmer/core/models/tracking_form.dart';
import 'package:farmer/core/utilities/styles_constants.dart';
import 'package:farmer/core/utilities/text_fields.dart';
import 'package:farmer/core/utilities/validations.dart';
import 'package:farmer/pages/register/my_register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateExpeditionPage extends StatefulWidget {
  final TrackingForm trackingForm;
  const CreateExpeditionPage({super.key, required this.trackingForm});

  @override
  State<CreateExpeditionPage> createState() => _CreateExpeditionPageState();
}

class _CreateExpeditionPageState extends State<CreateExpeditionPage> {
  List<Institution> institution = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController ratailerCorporateNameController =
      TextEditingController();
  TextEditingController cnpjCorporateNameController = TextEditingController();
  TextEditingController adresssCorporateController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lotController = TextEditingController();
  TextEditingController unitValueController = TextEditingController();
  TextEditingController totalValueController = TextEditingController();
  TextEditingController invoiceController = TextEditingController();
  TextEditingController dateInvoiceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    institution = listIstitution
        .where((form) => form.id == widget.trackingForm.institutionId)
        .toList();

    if (widget.trackingForm.ratailerCorporateName != null) {
      editRequest();
    }
  }

  void editRequest() {
    final numberFormat = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
      decimalDigits: 2,
    );

    ratailerCorporateNameController.text =
        widget.trackingForm.ratailerCorporateName!;
    cnpjCorporateNameController.text = widget.trackingForm.cnpjCorparateName!;
    adresssCorporateController.text = widget.trackingForm.adresssCorporate!;
    latController.text = widget.trackingForm.lat!;
    longController.text = widget.trackingForm.long!;
    phoneController.text = widget.trackingForm.phone!;
    lotController.text = widget.trackingForm.numlot!;
    unitValueController.text = numberFormat
        .format(
          double.parse(widget.trackingForm.unitValue!),
        )
        .trim();
    totalValueController.text = numberFormat
        .format(
          double.parse(widget.trackingForm.totalValue!),
        )
        .trim();
    invoiceController.text = widget.trackingForm.invoice!;
    dateInvoiceController.text = widget.trackingForm.dateInvoice!;
  }

  void _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    widget.trackingForm.ratailerCorporateName =
        ratailerCorporateNameController.text;
    widget.trackingForm.cnpjCorparateName = cnpjCorporateNameController.text;
    widget.trackingForm.adresssCorporate = adresssCorporateController.text;
    widget.trackingForm.lat = latController.text;
    widget.trackingForm.long = longController.text;
    widget.trackingForm.phone = phoneController.text;
    widget.trackingForm.numlot = lotController.text;
    widget.trackingForm.unitValue = double.parse(
            unitValueController.text.replaceAll('.', '').replaceAll(',', '.'))
        .toString();
    widget.trackingForm.totalValue = double.parse(
            totalValueController.text.replaceAll('.', '').replaceAll(',', '.'))
        .toString();
    widget.trackingForm.invoice = invoiceController.text;
    widget.trackingForm.dateInvoice = dateInvoiceController.text;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Expedição criado com sucesso!'),
              content:
                  Text('Foi criado a expedição para o formulário vinculado'),
              actions: [
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
                        builder: (context) => MyRegisterPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Ir a Meus Registros",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 223, 122),
      appBar: AppBar(
        title: Text(
          widget.trackingForm.ratailerCorporateName != null
              ? 'Editar Expedição'
              : 'Adicionar Expedição',
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
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Formulário de ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.trackingForm.nameProduct,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Cultura',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.trackingForm.productCulture,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Quantidade',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.trackingForm.quantity.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Data de Fabricação',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.trackingForm.manufacturingDate,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Propriedede',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                institution.first.responsibleName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'CNPJ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                institution.first.cnpj,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
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
                            modernTextFormField(
                              controller: ratailerCorporateNameController,
                              validator: (value) => validatorName(value),
                              hint: 'Digite o nome da  empresa',
                              label: 'Razão Social do Varejista',
                            ),
                            SizedBox(height: 15),
                            modernTextFormField(
                              controller: cnpjCorporateNameController,
                              validator: (value) => validatorCnpj(value),
                              hint: 'Digite o CNPJ da  empresa',
                              label: 'CNPJ do Varejista',
                              inputFormatters: [
                                MaskTextInputFormatter(
                                  mask: '##.###.###/####-##',
                                  filter: {"#": RegExp(r'^[0-9]*$')},
                                  type: MaskAutoCompletionType.lazy,
                                )
                              ],
                              textInputType: TextInputType.numberWithOptions(),
                            ),
                            SizedBox(height: 15),
                            modernTextFormField(
                              controller: adresssCorporateController,
                              validator: (value) => validatorName(value),
                              hint: 'Digite o Endereço da  empresa',
                              label: 'Endereço',
                            ),
                            SizedBox(height: 15),
                            modernTextFormField(
                              controller: latController,
                              validator: (value) => validatorName(value),
                              hint: 'Digite a latitude da  empresa',
                              label: 'Latitude',
                              textInputType: TextInputType.numberWithOptions(),
                            ),
                            SizedBox(height: 15),
                            modernTextFormField(
                              controller: longController,
                              validator: (value) => validatorName(value),
                              hint: 'Digite a longitude da  empresa',
                              label: 'Longitude',
                              textInputType: TextInputType.numberWithOptions(),
                            ),
                            SizedBox(height: 15),
                            modernTextFormField(
                                controller: phoneController,
                                validator: (value) => validatorPhone(value),
                                hint: 'Digite o telefone para contato ',
                                label: 'Telefone',
                                textInputType:
                                    TextInputType.numberWithOptions(),
                                inputFormatters: [
                                  MaskTextInputFormatter(
                                    mask: '(##) #####-####',
                                    filter: {"#": RegExp(r'^[0-9]*$')},
                                    type: MaskAutoCompletionType.lazy,
                                  )
                                ]),
                            SizedBox(height: 15),
                            modernTextFormField(
                              controller: lotController,
                              validator: (value) => validatorName(value),
                              hint: 'Digite o lote',
                              label: 'Lote',
                            ),
                            SizedBox(height: 15),
                            modernTextFormField(
                              controller: unitValueController,
                              validator: (value) => validatorMoney(value),
                              textInputType: TextInputType.numberWithOptions(),
                              hint: 'Exemplo: R\$ 1000,00',
                              label: 'Valor Unidade',
                              inputFormatters: [
                                CurrencyInputFormatter(
                                  thousandSeparator: ThousandSeparator.Period,
                                  mantissaLength: 2,
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            modernTextFormField(
                              controller: totalValueController,
                              validator: (value) => validatorMoney(value),
                              textInputType: TextInputType.numberWithOptions(),
                              hint: 'Exemplo: R\$ 1000,00',
                              label: 'Valor Total',
                              inputFormatters: [
                                CurrencyInputFormatter(
                                  thousandSeparator: ThousandSeparator.Period,
                                  mantissaLength: 2,
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            modernTextFormField(
                              controller: invoiceController,
                              validator: (value) => validatorName(value),
                              hint: 'Digite o Nº da Nota Fiscal',
                              label: 'Nota Fiscal',
                            ),
                            SizedBox(height: 15),
                            modernTextFormField(
                              controller: dateInvoiceController,
                              validator: (value) => validatorDate(value),
                              hint: 'Digite a data 01/01/2025',
                              label: 'Data de Emissão da NF',
                              textInputType: TextInputType.numberWithOptions(),
                              inputFormatters: [
                                MaskTextInputFormatter(
                                  mask: '##/##/####',
                                  filter: {"#": RegExp(r'^[0-9]*$')},
                                  type: MaskAutoCompletionType.lazy,
                                )
                              ],
                            ),
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
                                child: Text(
                                  widget.trackingForm.ratailerCorporateName !=
                                          null
                                      ? 'Editar'
                                      : 'Cadastrar',
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
