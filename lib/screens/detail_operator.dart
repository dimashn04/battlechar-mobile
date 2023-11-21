import 'package:flutter/material.dart';
import 'package:battlechar_mobile/models/operator.dart';

class DetailOperatorPage extends StatelessWidget {
  final Operator item;

  DetailOperatorPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${item.fields.name}',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigo[900],
          foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.fields.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text("Unit: ${item.fields.unit}"),
            const SizedBox(height: 10),
            Text("Primary Weapon : ${item.fields.primaryWeapon}    Ammo : ${item.fields.primaryWeaponAmmoAmount}"),
            const SizedBox(height: 10),
            Text("Secondary Weapon : ${item.fields.secondaryWeapon}    Ammo : ${item.fields.secondaryWeaponAmmoAmount}"),
            const SizedBox(height: 10),
            Text("Armor : ${item.fields.armor}    Speed : ${item.fields.speed}"),
            const SizedBox(height: 10),
            Text("Price : ${item.fields.price}"),
            const SizedBox(height: 10),
            Text("Description : ${item.fields.description}"),
          ],
        ),
      ),
    );
  }
}