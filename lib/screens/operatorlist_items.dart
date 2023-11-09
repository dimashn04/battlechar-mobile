import 'package:flutter/material.dart';
import 'package:battlechar_mobile/widgets/left_drawer.dart';
import 'package:battlechar_mobile/widgets/menu_card.dart';
import 'package:battlechar_mobile/screens/operatorlist_form.dart';

class OperatorsPage extends StatefulWidget {
  const OperatorsPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _OperatorsPageState();
}

class _OperatorsPageState extends State<OperatorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operators'),
        backgroundColor: Colors.indigo.shade900,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: ListView.builder(
        itemCount: operators.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(operators[index].name),
            subtitle: Text("Primary Weapon: ${operators[index].primaryWeapon}     Ammo: ${operators[index].primaryWeaponAmmo} \nSecondary Weapon: ${operators[index].secondaryWeapon}     Ammo: ${operators[index].secondaryWeaponAmmo} \nArmor: ${operators[index].armor}    Speed: ${operators[index].speed} \nPrice: ${operators[index].price} \nDescription: ${operators[index].description}"),
            onTap: () {},
          );
        }
      ),
    );
  }
}