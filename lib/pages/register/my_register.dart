import 'package:farmer/components/on_selected_popup.dart';
import 'package:farmer/core/models/institution.dart';
import 'package:farmer/core/models/tracking_form.dart';
import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
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
      ),
      Institution(
        id: '2',
        responsibleName: 'Fazenda Feliz',
        cnpj: '05.346.557/0001-00',
        responsibleCpf: '123.456.789-10',
        email: 'agricultor@teste.com.br',
        phone: '61 99376-3638',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meus Registros',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        actions: const [OnSelectedPopup()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.21,
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
                                    child: Text(institution.responsibleName),
                                  );
                                }).toList();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          'CNPJ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          selectedInstitution?.cnpj ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Quantidades',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '$selectedInstitutionCount',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
