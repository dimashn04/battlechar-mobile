// To parse this JSON data, do
//
//     final operator = operatorFromJson(jsonString);

import 'dart:convert';

Operator operatorFromJson(String str) => Operator.fromJson(json.decode(str));

String operatorToJson(Operator data) => json.encode(data.toJson());

class Operator {
    String model;
    int pk;
    Fields fields;

    Operator({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Operator.fromJson(Map<String, dynamic> json) => Operator(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    String unit;
    String primaryWeapon;
    String secondaryWeapon;
    int primaryWeaponAmmoAmount;
    int secondaryWeaponAmmoAmount;
    int armor;
    int speed;
    String description;
    int price;

    Fields({
        required this.user,
        required this.name,
        required this.unit,
        required this.primaryWeapon,
        required this.secondaryWeapon,
        required this.primaryWeaponAmmoAmount,
        required this.secondaryWeaponAmmoAmount,
        required this.armor,
        required this.speed,
        required this.description,
        required this.price,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        unit: json["unit"],
        primaryWeapon: json["primary_weapon"],
        secondaryWeapon: json["secondary_weapon"],
        primaryWeaponAmmoAmount: json["primary_weapon_ammo_amount"],
        secondaryWeaponAmmoAmount: json["secondary_weapon_ammo_amount"],
        armor: json["armor"],
        speed: json["speed"],
        description: json["description"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "unit": unit,
        "primary_weapon": primaryWeapon,
        "secondary_weapon": secondaryWeapon,
        "primary_weapon_ammo_amount": primaryWeaponAmmoAmount,
        "secondary_weapon_ammo_amount": secondaryWeaponAmmoAmount,
        "armor": armor,
        "speed": speed,
        "description": description,
        "price": price,
    };
}
