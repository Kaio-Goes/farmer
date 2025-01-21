import 'package:farmer/components/on_selected_popup.dart';
import 'package:farmer/core/models/institution.dart';
import 'package:flutter/material.dart';

class CreateRegisterPage extends StatefulWidget {
  final Institution institution;
  const CreateRegisterPage({super.key, required this.institution});

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
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
