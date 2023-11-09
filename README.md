# battlechar_mobile

Dimas Herjunodarpito Notoprayitno <br>
2206081282 <br>
PBP C <br>

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

## Tugas 8

1. Jelaskan perbedaan antara ```Navigator.push()``` dan ```Navigator.pushReplacement()```, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
   **```Navigator.push()```:**
   Method ```push()``` menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna.

   Contoh:
      ```dart
      ...
      if (item.name == "Add Operators") {
         Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OperatorFormPage()));
      }
      ...
      ```

   **```Navigator.pushReplacement()```:**
   Method ```pushReplacement()``` menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Pada stack route yang dikelola ```Navigator```, route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya.

   Walaupun ```push()``` dan ```pushReplacement()``` sekilas terlihat mirip, namun perbedaan kedua method tersebut terletak pada apa yang dilakukan kepada route yang berada pada atas stack. ```push()``` akan menambahkan route baru diatas route yang sudah ada pada atas stack, sedangkan ```pushReplacement()``` menggantikan route yang sudah ada pada atas stack dengan route baru tersebut. Penting juga untuk memperhatikan kemungkinan urutan dan isi dari stack, karena jika kondisi stack kosong serta kita menekan tombol **Back** pada gawai, maka sistem akan keluar dari aplikasi tersebut.

   Contoh:
   ```dart
   ...
   onTap: () {
      Navigator.pushReplacement(
         context,
         MaterialPageRoute(
            builder: (context) => MyHomePage(),
      ));
   },
   ...
   ```

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
   **Single-child layout widgets:**
   1. Align: Widget yang menyelaraskan child-nya di dalam dirinya sendiri dan secara opsional menyesuaikan ukurannya berdasarkan ukuran child.
   2. AspectRatio: Widget yang mencoba mengukur ukuran child ke rasio aspek tertentu.
   3. Baseline: Container yang memposisikan child-nya sesuai dengan garis dasar child.
   4. Center: Alignment block yang memusatkan child-nya di dalam dirinya sendiri.
   5. ConstrainedBox: Widget yang memberikan batasan tambahan pada child-nya.
   6. Container: Widget kenyamanan yang memadukan widget pengecatan, pemosisian, dan ukuran yang umum.
   7. Padding: Widget yang menyisipkan child dengan padding yang diberikan.
   8. SizedBox: Box dengan ukuran tertentu. Jika diberi child, widget ini memaksanya untuk memiliki lebar dan/atau tinggi tertentu
   9. Transform: Widget yang menerapkan transformasi sebelum melukis child-nya.

   **Multi-child layout widgets:**
   1. Column: Tata letak daftar widget child dalam arah vertikal.
   2. GridView: Grid list terdiri dari pola berulang sel yang disusun dalam tata letak vertikal dan horizontal. Widget GridView mengimplementasikan komponen ini.
   3. ListView: Daftar widget yang dapat digulir yang disusun secara linear. ListView adalah widget gulir yang paling sering digunakan. Widget ini menampilkan child-childnya satu demi satu dalam arah gulir. Pada sumbu silang, child-child harus mengisi ListView.
   4. Row: Tata letak daftar widget child dalam arah horizontal.
   5. Stack: Widget yang memposisikan child-childnya relatif terhadap tepi kotak. Kelas ini berguna jika Anda ingin menimpa beberapa child dengan cara yang sederhana, misalnya memiliki beberapa teks dan gambar, yang ditimpa dengan gradien dan tombol yang dilampirkan di bagian bawah.

   **Sliver widgets:**
   1. CupertinoSliverNavigationBar: Bilah navigasi bergaya iOS dengan judul besar bergaya iOS-11 menggunakan sliver.

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
   1. Form: Widget ini saya gunakan agar menjadi wadah untuk berbagai input field widget yang saya buat.
   2. TextFormField: Widget ini saya gunakan untuk menerima input user dalam bentuk string.

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
   Penerapan Clean Architecture pada aplikasi Flutter biasanya melibatkan pembagian proyek menjadi beberapa lapisan utama:
      1. **Data & Platform layer**: Lapisan data berada di lapisan paling luar. Lapisan ini terdiri dari kode sumber data seperti konsumsi Rest API, akses ke database lokal, Firebase, atau sumber lain.
      2. **Domain layer**: Lapisan ini berisi entitas bisnis dan kasus penggunaan. Entitas adalah objek sederhana yang mewakili detail bisnis paling mendasar dalam aplikasi yang kita buat.
      3. **Presentation layer**: Lapisan ini berisi kode UI dan logika presentasi. Ini biasanya melibatkan kerangka kerja seperti Flutter untuk membangun antarmuka pengguna.

   Dengan menerapkan Clean Architecture, kita sebagai developer dapat membuat kode yang lebih mudah dikelola dan dikembangkan. Selain itu, hal ini juga memudahkan kerja sama antar tim dalam pengembangan2.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
   1. Melakukan modifikasi terhadap ```main.dart```:
         ```dart
         import 'package:flutter/material.dart';
         import 'package:battlechar_mobile/screens/menu.dart';

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
                     colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                     useMaterial3: true,
                  ),
                  home: MyHomePage(),
               );
            }
         }
         ```
   2. Membuat direktori ```lib/screens/``` dan ```lib/widgets```.
   3. Memindahkan file ```menu.dart``` ke dalam direktori ```lib/screens/```.
   4. Melakukan modifikasi terhadap file ```menu.dart```:
         ```dart
         import 'package:flutter/material.dart';
         import 'package:battlechar_mobile/widgets/left_drawer.dart';
         import 'package:battlechar_mobile/widgets/menu_card.dart';

         class MyHomePage extends StatelessWidget {
            MyHomePage({Key? key}) : super(key: key);
            final List<MenuItem> items = [
               MenuItem("See Operators", Icons.local_police, Colors.blueGrey.shade900),
               MenuItem("Add Operators", Icons.person_add_alt_1_rounded , Colors.blue.shade900),
               MenuItem("Logout", Icons.logout, Colors.red.shade900),
            ];
            @override
            Widget build(BuildContext context) {
               return Scaffold(
                  appBar: AppBar(
                  title: const Text(
                     'Battlechar',
                     style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.indigo.shade900,
                  foregroundColor: Colors.white,
                  ),
                  drawer: const LeftDrawer(),
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
                              return MenuCard(item);
                           }).toList(),
                        ),
                        ],
                     ),
                  ),
                  ),
               );
            }
         }
         ```
   5. Menambahkan file ```left_drawer.dart``` di dalam direktori ```lib/widgets/```:
         ```dart
         import 'package:battlechar_mobile/screens/operatorlist_items.dart';
         import 'package:flutter/material.dart';
         import 'package:battlechar_mobile/screens/menu.dart';
         import 'package:battlechar_mobile/screens/operatorlist_form.dart';

         class LeftDrawer extends StatelessWidget {
            const LeftDrawer({super.key});

            @override
            Widget build(BuildContext context) {
               return Drawer(
                  child: ListView(
                  children: [
                     const DrawerHeader(
                        decoration: BoxDecoration(
                        color: Colors.indigo,
                        ),
                        child: Column(
                        children: [
                           Text(
                              'Battlechar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              ),
                           ),
                           Padding(padding: EdgeInsets.all(10)),
                           Text(
                              "Create and manage your operators from here!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              ),
                           ),
                        ],
                        ),
                     ),
                     // Bagian routing
                     ListTile(
                        leading: const Icon(Icons.home_outlined),
                        title: const Text('Home'),
                        // Bagian redirection ke MyHomePage
                        onTap: () {
                        Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                              ));
                        },
                     ),
                     ListTile(
                        leading: const Icon(Icons.person_add_alt_1_rounded),
                        title: const Text('Add Operators'),
                        // Bagian redirection ke ShopFormPage
                        onTap: () {
                        Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                              builder: (context) => const OperatorFormPage(),
                              ));
                        },
                     ),
                     ListTile(
                        leading: const Icon(Icons.local_police),
                        title: const Text('See Operators'),
                        // Bagian redirection ke ShopFormPage
                        onTap: () {
                        Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                              builder: (context) => const OperatorsPage(),
                              ));
                        },
                     ),
                  ],
                  ),
               );
            }
         }
         ```
   6. Menambahkan file ```menu_card.dart``` di dalam direktori ```lib/widgets/```:
         ```dart
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
         ```
   7. Menambahkan file ```operatorlist_form.dart``` di dalam direktori ```lib/screens/```:
         ```dart
         import 'package:battlechar_mobile/widgets/menu_card.dart';
         import 'package:flutter/material.dart';
         import 'package:battlechar_mobile/widgets/left_drawer.dart';

         class OperatorFormPage extends StatefulWidget {
            const OperatorFormPage({super.key});

            @override
            State<OperatorFormPage> createState() => _OperatorFormPageState();
         }

         List<Operator> operators = [];

         class _OperatorFormPageState extends State<OperatorFormPage> {
            final _formKey = GlobalKey<FormState>();

            String _name = "";
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
               return Scaffold(
                  appBar: AppBar(
                     title: const Center(
                     child: Text(
                        'Add Operator Form',
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
                                       onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                             operators.add(Operator(
                                             name: _name,
                                             price: _price,
                                             description: _description,
                                             primaryWeapon: _primaryWeapon,
                                             secondaryWeapon: _secondaryWeapon,
                                             primaryWeaponAmmo: _primaryWeaponAmmo,
                                             secondaryWeaponAmmo: _secondaryWeaponAmmo,
                                             armor: _armor,
                                             speed: _speed,
                                             ));
                                             showDialog(
                                             context: context,
                                             builder: (context) {
                                                return AlertDialog(
                                                   title: const Text('Operator saved successfully'),
                                                   content: SingleChildScrollView(
                                                   child: Column(
                                                      crossAxisAlignment:
                                                         CrossAxisAlignment.start,
                                                      children: [
                                                         Text('Operator name: $_name'),
                                                         Text('Primary weapon: $_primaryWeapon    Ammo: $_primaryWeaponAmmo'),
                                                         Text('Secondary weapon: $_secondaryWeapon    Ammo: $_secondaryWeaponAmmo'),
                                                         Text('Armor: $_armor    Speed: $_speed'),
                                                         Text('Price: $_price'),
                                                         Text('Description: $_description'),
                                                      ],
                                                   ),
                                                   ),
                                                   actions: [
                                                   TextButton(
                                                      child: const Text('OK'),
                                                      onPressed: () {
                                                         Navigator.pop(context);
                                                      },
                                                   ),
                                                   ],
                                                );
                                             },
                                             );
                                             _formKey.currentState!.reset();
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
         ```
   8. Menambahkan file ```operatorlist_items.dart``` di dalam direktori ```lib/screens/```:
         ```dart
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
         ```