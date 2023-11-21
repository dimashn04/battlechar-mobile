import 'package:battlechar_mobile/screens/detail_operator.dart';
import 'package:flutter/material.dart';
import 'package:battlechar_mobile/widgets/left_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:battlechar_mobile/models/operator.dart';

class OperatorsPage extends StatefulWidget {
  const OperatorsPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _OperatorsPageState();
}

class _OperatorsPageState extends State<OperatorsPage> {
  Future<List<Operator>> fetchOperator() async {
    var url = Uri.parse('http://127.0.0.1:8080/json-by-user/');
    // var url = Uri.parse('http://dimas-herjunodarpito-tugas.pbp.cs.ui.ac.id/json-by-user/');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Operator
    List<Operator> listOperator = [];
    for (var d in data) {
      if (d != null) {
        // print(d.fields);
        listOperator.add(Operator.fromJson(d));
      }
    }
    return listOperator;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Operators',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigo[900],
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchOperator(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "No operators.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailOperatorPage(item: snapshot.data![index]),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data![index].fields.name}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                  "Unit : ${snapshot.data![index].fields.unit}"),
                              const SizedBox(height: 10),
                              Text(
                                  "Description : ${snapshot.data![index].fields.description}")
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }
            }));
  }
}