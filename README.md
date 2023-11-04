# battlechar_mobile

Dimas Herjunodarpito Notoprayitno
2206081282
PBP C

## Tugas 7

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
   Stateless Widgets:
   Merupakan widget yang statusnya tidak dapat diubah setelah dibuat. Setelah dikembangkan, widget ini tidak dapat diubah, yang berarti setiap perubahan pada variabel, ikon, tombol, atau pengambilan data tidak akan memengaruhi status aplikasi.

   Stateful Widgets:
   Merupakan widget yang statusnya dapat diubah setelah dibuat. Status ini dapat diubah, artinya dapat berubah beberapa kali selama hidupnya. Hal ini pada dasarnya berarti bahwa status aplikasi dapat berubah beberapa kali tergantung pada berbagai variabel, input, dan data. Ini digunakan ketika antarmuka pengguna dapat berubah dengan cepat. CheckBox, RadioButton, Form, dan TextField adalah beberapa contohnya.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
   - MaterialApp: 
     Widget kenyamanan yang membungkus sejumlah widget yang umumnya diperlukan untuk Material Design applications
   - ThemeData:
     Widget untuk memanipulasi tema seluruh aplikasi yang dibuat.
   - ColorScheme:
     Widget yang berisi satu set 30 warna berdasarkan spesifikasi Material yang dapat digunakan untuk mengonfigurasi properti warna sebagian besar komponen.
   - Scaffold:
     Widget berupa kelas dalam flutter yang menyediakan banyak widget atau bisa dikatakan API seperti Drawer, Snack-Bar, Bottom-Navigation-Bar, Floating-Action-Button, App-Bar, dll. Scaffold akan memperluas atau menempati seluruh layar perangkat. Ini akan menempati ruang yang tersedia.
   - AppBar:
     Widget yang biasanya merupakan komponen paling atas dari aplikasi (atau terkadang paling bawah), berisi toolbar dan beberapa tombol aksi umum lainnya.
   - Text:
     Text widget menampilkan serangkaian teks dengan single-style. String dapat dipecah menjadi beberapa baris atau mungkin semuanya ditampilkan pada baris yang sama, tergantung pada batasan tata letak. Argumen gaya bersifat opsional.
   - Padding:
     Widget yang menambahkan lapisan atau ruang kosong di sekitar widget atau sekelompok widget.
   - Column:
     Widget yang digunakan untuk membuat tata letak vertikal.
   - GridView.count:
     Widget yang membuat tata letak dengan jumlah tile tetap pada sumbu silang
   - Material:
     Widget yang berfungsi untuk menyediakan desain visual Material Design pada widget lain.
   - InkWell:
     Widget berupa area persegi panjang widget Material yang merespons peristiwa sentuhan dengan menampilkan percikan yang terpotong.
   - Container:
     Kelas widget yang memungkinkan untuk menyesuaikan widget turunannya.
   - Icon:
     Widget yang berfungsi untuk menampilkan beragam ikon dengan aneka model dan ukuran.
   - SnackBar:
     Widget berupa pesan ringan dengan tindakan opsional yang ditampilkan secara singkat di bagian bawah layar.

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
   1. Membuat project Flutter, lalu masuk ke dalam direktori project Flutter, dan membukanya di dalam Visual Studio Code
         ```
         flutter create battlechar_mobile
         cd battlechar_mobile
         code .
         ```
   2. Menambahkan file dengan nama ```menu.dart``` di dalam direktori ```battlechar_mobile/lib/```
   3. Isi file ```menu.dart``` tersebut seperti berikut:
         ```dart
         import 'package:flutter/material.dart';

         class MenuItem {
            final String name;
            final IconData icon;
            final Color color;

            MenuItem(this.name, this.icon, this.color);
         }

         class MyHomePage extends StatelessWidget {
            MyHomePage({Key? key}) : super(key: key);
            final List<MenuItem> items = [
               MenuItem("See Operators", Icons.local_police, Colors.blue),
               MenuItem("Add Operators", Icons.person_add_alt_1_rounded , Colors.green),
               MenuItem("Logout", Icons.logout, Colors.red),
         ];
         @override
         Widget build(BuildContext context) {
            return Scaffold(
               appBar: AppBar(
               title: const Text(
                  'Battlechar',
                  style: TextStyle(color: Colors.white),
               ),
               backgroundColor: Colors.orange,
               ),
               body: SingleChildScrollView(
               // Widget wrapper yang dapat discroll
               child: Padding(
                  padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                  child: Column(
                     // Widget untuk menampilkan children secara vertikal
                     children: <Widget>[
                     const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                        child: Text(
                           'Welcome to Battlechar', // Text yang menandakan toko
                           textAlign: TextAlign.center,
                           style: TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold,
                           ),
                        ),
                     ),
                     // Grid layout
                     GridView.count(
                        // Container pada card kita.
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: items.map((MenuItem item) {
                           // Iterasi untuk setiap item
                           return ShopCard(item);
                        }).toList(),
                     ),
                     ],
                  ),
               ),
               ),
            );
         }
         }

         class ShopCard extends StatelessWidget {
            final MenuItem item;

            const ShopCard(this.item, {super.key}); // Constructor

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
         ```
   4. Memodifikasi file ```battlechar_mobile/lib/main.dart``` menjadi:
         ```dart
         import 'package:flutter/material.dart';
         import 'package:battlechar_mobile/menu.dart';

         void main() {
            runApp(const MyApp());
         }

         class MyApp extends StatelessWidget {
            const MyApp({super.key});

            // This widget is the root of your application.
            @override
            Widget build(BuildContext context) {
               return MaterialApp(
                  title: 'Battlechar',
                  theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
                  useMaterial3: true,
                  ),
                  home: MyHomePage(),
               );
            }
         }
         ```