import 'package:battlechar_mobile/screens/operatorlist_items.dart';
import 'package:flutter/material.dart';
import 'package:battlechar_mobile/screens/operatorlist_form.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final Color color;

  MenuItem(this.name, this.icon, this.color);
}

class Operator {
  final String name;
  final int price;
  final String description;
  final String primaryWeapon;
  final String secondaryWeapon;
  final int primaryWeaponAmmo;
  final int secondaryWeaponAmmo;
  final int armor;
  final int speed;

  Operator({required this.name, required this.price, required this.description, required this.primaryWeapon, required this.secondaryWeapon, required this.primaryWeaponAmmo, required this.secondaryWeaponAmmo, required this.armor, required this.speed});
}

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You've pressed the ${item.name} button!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Add Operators") {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OperatorFormPage()));
          }

          if (item.name == "See Operators") {
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => const OperatorsPage()));
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}