import 'package:flutter/material.dart';
import 'package:battlechar_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:battlechar_mobile/screens/menu.dart';

class OperatorFormPage extends StatefulWidget {
    const OperatorFormPage({super.key});

    @override
    State<OperatorFormPage> createState() => _OperatorFormPageState();
}


class _OperatorFormPageState extends State<OperatorFormPage> {
    final _formKey = GlobalKey<FormState>();

    String _name = "";
    String _unit = "";
    int _price = 0;
    String _primaryWeapon = "";
    int _primaryWeaponAmmo = 0;
    String _secondaryWeapon = "";
    int _secondaryWeaponAmmo = 0;
    int _armor = 0;
    int _speed = 0;
    String _description = "";

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: const Text(
                'Add Operator',
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Operator Name",
                        labelText: "Operator Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Name cannot be empty!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Operator Unit",
                        labelText: "Operator Unit",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _unit = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Unit cannot be empty!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Price",
                        labelText: "Price",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _price = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Price cannot be empty!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Price must be a valid integer!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Primary Weapon",
                        labelText: "Primary Weapon",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _primaryWeapon = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Primary weapon cannot be empty!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Primary Weapon Ammo Amount",
                        labelText: "Primary Weapon Ammo Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _primaryWeaponAmmo = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Primary weapon ammo amount cannot be empty!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Primary weapon ammo amount must be a valid integer!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Secondary Weapon",
                        labelText: "Secondary Weapon",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _secondaryWeapon = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Secondary weapon cannot be empty!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Secondary Weapon Ammo Amount",
                        labelText: "Secondary Weapon Ammo Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _secondaryWeaponAmmo = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Secondary weapon ammo amount cannot be empty!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Secondary weapon ammo amount must be a valid integer!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Armor",
                        labelText: "Armor",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _armor = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Armor value cannot be empty!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Armor value must be a valid integer!";
                        }
                        if (int.tryParse(value)! > 3 || int.tryParse(value)! < 1) {
                            return "Armor value must be in interval 1-to-3!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Speed",
                        labelText: "Speed",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _speed = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Speed value cannot be empty!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Speed value must be a valid integer!";
                        }
                        if (int.tryParse(value)! > 3 || int.tryParse(value)! < 1) {
                            return "Speed value must be in interval 1-to-3!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Description cannot be empty!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.indigo),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // Kirim ke Django dan tunggu respons
                                    // DONE: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                    final response = await request.postJson(
                                      "http://127.0.0.1:8080/create-flutter/",
                                      // "http://dimas-herjunodarpito-tugas.pbp.cs.ui.ac.id/create-flutter/",
                                    jsonEncode(<String, String>{
                                        'name': _name,
                                        'price': _price.toString(),
                                        'primary_weapon': _primaryWeapon,
                                        'secondary_weapon': _secondaryWeapon,
                                        'primary_weapon_ammo_amount': _primaryWeaponAmmo.toString(),
                                        'secondary_weapon_ammo_amount': _secondaryWeaponAmmo.toString(),
                                        'armor': _armor.toString(),
                                        'speed': _speed.toString(),
                                        'description': _description,
                                        'unit': _unit,
                                    }));
                                    if (response['status'] == 'success') {
                                        print(response['status']);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                        content: Text("New operator has been saved!"),
                                        ));
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => MyHomePage()),
                                        );
                                    } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                            content:
                                                Text("ERROR, please try again!"),
                                        ));
                                    }
                                  }
                                },
                                child: const Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                    ),
                  ),
                ]
              ),
            ),
          ),
        );
    }
}