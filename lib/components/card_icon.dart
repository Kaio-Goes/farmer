import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {
  final String textIcon;
  final IconData iconItem;
  final Function()? onTap;
  const CardIcon(
      {super.key,
      required this.textIcon,
      required this.iconItem,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: Colors.white,
      elevation: 2,
      child: SizedBox(
        height: 200,
        width: 150,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconItem, size: 48, color: Colors.green),
              SizedBox(height: 20),
              Text(
                textIcon,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
