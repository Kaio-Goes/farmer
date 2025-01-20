import 'package:farmer/components/logout_card.dart';
import 'package:farmer/pages/dashboard/dashboard_page.dart';
import 'package:farmer/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class OnSelectedPopup extends StatefulWidget {
  final bool isDashboardPage;

  const OnSelectedPopup({super.key, this.isDashboardPage = false});

  @override
  State<OnSelectedPopup> createState() => _OnSelectedPopupState();
}

class _OnSelectedPopupState extends State<OnSelectedPopup> {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        if (!widget.isDashboardPage) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const DashboardPage()),
          );
        }
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
      case 2:
        logoutCard(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      icon: const Icon(Icons.menu),
      onSelected: (item) => onSelected(context, item),
      itemBuilder: (context) {
        List<PopupMenuEntry<int>> menuItems = [];

        // Adicionar o item "Voltar ao Início" apenas se não estiver na DashboadPage
        if (!widget.isDashboardPage) {
          menuItems.add(
            const PopupMenuItem(
              value: 0,
              child: ListTile(
                leading: Icon(Icons.house),
                title: Text('Voltar ao Início'),
              ),
            ),
          );
        }

        menuItems.addAll([
          const PopupMenuItem(
            value: 1,
            child: ListTile(
              leading: Icon(Icons.person_2_outlined),
              title: Text('Perfil'),
            ),
          ),
          const PopupMenuItem<int>(
            value: 2,
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title: Text('Sair'),
            ),
          ),
        ]);
        return menuItems;
      },
    );
  }
}
