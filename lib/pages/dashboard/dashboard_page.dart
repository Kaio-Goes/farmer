import 'package:farmer/components/card_icon.dart';
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
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.28,
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
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Bem-vindo, Agricultor!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  AuthService().currentUser?.name ?? 'Sem Nome',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Propriedade',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            AuthService().currentUser?.property ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Matrícula',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            AuthService().currentUser?.register ?? '00000-00',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -80),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardIcon(
                      textIcon: 'Meus Registros',
                      iconItem: Icons.agriculture,
                      onTap: () {},
                    ),
                    const SizedBox(width: 16),
                    CardIcon(
                      textIcon: 'Card 2',
                      iconItem: Icons.local_florist,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardIcon(
                      textIcon: 'Card 3',
                      iconItem: Icons.folder_zip_outlined,
                      onTap: () {},
                    ),
                    const SizedBox(width: 16),
                    CardIcon(
                      textIcon: 'Card 4',
                      iconItem: Icons.folder_zip_outlined,
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
