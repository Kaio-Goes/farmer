import 'package:farmer/components/card_tracking_form.dart';
import 'package:farmer/components/on_selected_popup.dart';
import 'package:farmer/core/models/institution.dart';
import 'package:farmer/core/models/tracking_form.dart';
import 'package:farmer/core/utilities/styles_constants.dart';
import 'package:farmer/pages/register/create_register_page.dart';
import 'package:flutter/material.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key});

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  List<Institution> listInstitution = [];
  Institution? selectedInstitution;
  List<TrackingForm> formInstitution = [];
  int selectedInstitutionCount = 0;

  @override
  void initState() {
    super.initState();
    listInstitution = [
      Institution(
        id: '1',
        responsibleName: 'Fazenda Goes',
        cnpj: '24.653.218/0001-03',
        responsibleCpf: '123.456.789-10',
        email: 'agricultor@teste.com.br',
        phone: '(61) 99376-3638',
        cep: '73081-605',
        logradouro: 'Qms 33A Lote 08 Setor de Mansoes Sobradinho-DF',
        lat: '-15.798598',
        long: '-47.921226',
      ),
      Institution(
        id: '2',
        responsibleName: 'Fazenda Feliz',
        cnpj: '05.346.557/0001-00',
        responsibleCpf: '123.456.789-10',
        email: 'agricultor@teste.com.br',
        phone: '61 99376-3638',
        cep: '72041-45',
        logradouro: '202 Asa Sul Brasília DF',
        lat: '-15.798488',
        long: '-47.924826',
      )
    ];

    formInstitution = listForm;

    // Definir a propriedade inicial como a de ID 1
    selectedInstitution = listInstitution.firstWhere(
      (institution) => institution.id == '1',
    );

    // Atualizar a contagem inicial
    _updateSelectedInstitutionCount();
  }

  void _onPropertySelected(Institution institution) {
    setState(() {
      selectedInstitution = institution;
      _updateSelectedInstitutionCount();
    });
  }

  void _updateSelectedInstitutionCount() {
    selectedInstitutionCount = formInstitution
        .where((form) => form.institutionId == selectedInstitution?.id)
        .length;
  }

  void _showSelectInstitutionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Selecionar Empresa"),
          content: SizedBox(
            width: double.maxFinite,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                        'Para criar um formulário de rastreio é necessário selecionar uma empresa'),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: listInstitution.length,
                      itemBuilder: (context, index) {
                        final institution = listInstitution[index];
                        return Card(
                          margin: EdgeInsets.all(6),
                          color: Colors.green.shade50,
                          child: ListTile(
                            title: Text(institution.responsibleName),
                            subtitle: Text(institution.cnpj),
                            onTap: () {
                              Navigator.of(context).pop(); // Fechar o diálogo
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CreateRegisterPage(
                                      institution: institution),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                elevation: 3,
                backgroundColor: colorPrimaty,
              ),
              child: const Text(
                "Cancelar",
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
    final filteredForms = formInstitution
        .where((form) => form.institutionId == selectedInstitution?.id)
        .toList();

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Container(
                height: constraints.maxHeight * 0.25,
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
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    selectedInstitution?.responsibleName ?? '',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                PopupMenuButton<Institution>(
                                  icon: const Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  ),
                                  onSelected: _onPropertySelected,
                                  itemBuilder: (BuildContext context) {
                                    return listInstitution.map((institution) {
                                      return PopupMenuItem<Institution>(
                                        value: institution,
                                        child:
                                            Text(institution.responsibleName),
                                      );
                                    }).toList();
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'CNPJ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              selectedInstitution?.cnpj ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Quantidades $selectedInstitutionCount',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add,
                                      color: Colors.white),
                                  onPressed: _showSelectInstitutionDialog,
                                ),
                              ],
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
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                    itemCount: filteredForms.length,
                    itemBuilder: (context, index) {
                      final form = filteredForms[index];
                      return CardTrackingForm(
                        form: form,
                        institution: selectedInstitution!,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
