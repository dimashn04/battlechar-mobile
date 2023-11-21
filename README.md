# battlechar_mobile

Dimas Herjunodarpito Notoprayitno <br>
2206081282 <br>
PBP C <br>

## Tugas 7

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter? <br>
   Stateless Widgets:
   Merupakan widget yang statusnya tidak dapat diubah setelah dibuat. Setelah dikembangkan, widget ini tidak dapat diubah, yang berarti setiap perubahan pada variabel, ikon, tombol, atau pengambilan data tidak akan memengaruhi status aplikasi.

   Stateful Widgets:
   Merupakan widget yang statusnya dapat diubah setelah dibuat. Status ini dapat diubah, artinya dapat berubah beberapa kali selama hidupnya. Hal ini pada dasarnya berarti bahwa status aplikasi dapat berubah beberapa kali tergantung pada berbagai variabel, input, dan data. Ini digunakan ketika antarmuka pengguna dapat berubah dengan cepat. CheckBox, RadioButton, Form, dan TextField adalah beberapa contohnya.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing. <br>
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

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial) <br>
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

1. Jelaskan perbedaan antara ```Navigator.push()``` dan ```Navigator.pushReplacement()```, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat! <br>
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

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing! <br>
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
   5. Stack: Widget yang memposisikan child-childnya relatif terhadap tepi kotak. Kelas ini berguna jika kita ingin menimpa beberapa child dengan cara yang sederhana, misalnya memiliki beberapa teks dan gambar, yang ditimpa dengan gradien dan tombol yang dilampirkan di bagian bawah.

   **Sliver widgets:**
   1. CupertinoSliverNavigationBar: Bilah navigasi bergaya iOS dengan judul besar bergaya iOS-11 menggunakan sliver.

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut! <br>
   1. Form: Widget ini saya gunakan agar menjadi wadah untuk berbagai input field widget yang saya buat.
   2. TextFormField: Widget ini saya gunakan untuk menerima input user dalam bentuk string.

4. Bagaimana penerapan clean architecture pada aplikasi Flutter? <br>
   Penerapan Clean Architecture pada aplikasi Flutter biasanya melibatkan pembagian proyek menjadi beberapa lapisan utama:
      1. **Data & Platform layer**: Lapisan data berada di lapisan paling luar. Lapisan ini terdiri dari kode sumber data seperti konsumsi Rest API, akses ke database lokal, Firebase, atau sumber lain.
      2. **Domain layer**: Lapisan ini berisi entitas bisnis dan kasus penggunaan. Entitas adalah objek sederhana yang mewakili detail bisnis paling mendasar dalam aplikasi yang kita buat.
      3. **Presentation layer**: Lapisan ini berisi kode UI dan logika presentasi. Ini biasanya melibatkan kerangka kerja seperti Flutter untuk membangun antarmuka pengguna.

   Dengan menerapkan Clean Architecture, kita sebagai developer dapat membuat kode yang lebih mudah dikelola dan dikembangkan. Selain itu, hal ini juga memudahkan kerja sama antar tim dalam pengembangan2.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial) <br>
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

## Tugas 9

1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON? <br>
   Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Ini bisa dilakukan dengan langsung mem-parsing data JSON ke dalam struktur data seperti dictionary atau array, tergantung pada struktur data JSON itu sendiri.

   Namun, apakah ini lebih baik daripada membuat model terlebih dahulu? Jawabannya tergantung pada konteks dan kebutuhan aplikasi kta. Berikut adalah beberapa pertimbangan:
      - **Keuntungan menggunakan model:**
         - **Validasi data:** Model dapat membantu dalam validasi data. Misalnya, jika kita tahu bahwa suatu nilai harus berupa integer dan model kita mencerminkan hal ini, maka jika data JSON berisi nilai non-integer untuk bidang ini, kesalahan akan terjadi saat parsing.
         - **Ease of Use:** Dengan model, kita dapat mengakses data menggunakan properti objek, yang bisa lebih intuitif dan mudah dibaca daripada mengakses nilai melalui kunci dictionary.
         - **Dokumentasi dan struktur:** Model memberikan struktur yang jelas untuk data kita, yang bisa sangat membantu dalam dokumentasi dan pemahaman data.
      - **Keuntungan tidak menggunakan model:**
         - **Fleksibilitas:** Jika struktur data JSON sangat dinamis dan berubah-ubah, mungkin lebih mudah untuk bekerja dengan dictionary atau array daripada mencoba menyesuaikan model kita setiap kali struktur berubah.
         - **Kecepatan pengembangan:** Dalam beberapa kasus, mungkin lebih cepat dan lebih mudah untuk mulai bekerja dengan data tanpa menghabiskan waktu untuk mendefinisikan model terlebih dahulu.
   
   Secara umum, jika kita bekerja dengan API atau data JSON yang memiliki struktur yang konsisten dan kita ingin memanfaatkan keuntungan dari model, maka pendekatan berbasis model mungkin lebih baik. Jika kita memerlukan fleksibilitas atau kecepatan, mungkin lebih baik bekerja langsung dengan data JSON. kita harus mempertimbangkan trade-off ini dalam konteks proyek kita sendiri.

2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter. <br>
   Kelas CookieRequest merupakan bagian dari implementasi manajemen otentikasi (authentication) di aplikasi Flutter dengan menggunakan cookies. Fungsionalitas utama dari kelas ini:
      - **Inisialisasi dan Pemeliharaan Cookies:**
         - Kelas ini memiliki fungsi ```init()``` yang digunakan untuk menginisialisasi dan memelihara status cookies. Ini mencakup membaca cookies yang sudah tersimpan, memeriksa apakah sesi pengguna sudah login, dan mengelola headers yang berisi informasi cookie.
      - **Request HTTP dengan Otentikasi:**
         - Kelas ini memiliki beberapa metode untuk melakukan permintaan HTTP seperti ```get```, ```post```, dan ```postJson```. Semua metode ini menyertakan informasi otentikasi dalam header HTTP jika pengguna sudah login.
      - **Manajemen Sesi Pengguna:**
         - Kelas ini menyediakan fungsionalitas untuk login dan logout. Metode ```login``` digunakan untuk mengirimkan permintaan login ke server, dan jika berhasil, menyimpan cookies dan status login. Metode ```logout``` digunakan untuk melakukan logout, menghapus cookies, dan mengubah status login.
      - **Penanganan Cookies:**
         - Kelas ini memiliki fungsi-fungsi untuk mengelola cookies, termasuk pembacaan dari penyimpanan lokal (shared preferences), pembaruan berdasarkan respons HTTP, dan pembuatan header cookie.
      - **Keamanan dan Pengaturan Cookies:**
         - Fungsi ```_setCookie``` digunakan untuk menguraikan dan menyimpan properti cookies, termasuk waktu kedaluwarsa (max-age). Fungsi ```_generateCookieHeader``` digunakan untuk membuat header cookie yang akan disertakan dalam setiap permintaan HTTP.

   Mengapa perlu dibagikan ke semua komponen di aplikasi Flutter?
      - **Pemeliharaan Status Login:** Dengan membagikan instance ```CookieRequest``` ke semua komponen, kita dapat memastikan bahwa status login pengguna dapat diakses dan diperbarui secara konsisten di seluruh aplikasi. Hal ini penting agar komponen-komponen yang berbeda dapat merespons perubahan status login dengan benar.
      - **Pengelolaan Otentikasi:** Instance ```CookieRequest``` menyimpan informasi otentikasi dan cookies. Dengan membagikannya ke berbagai komponen, kita dapat mengakses informasi otentikasi ini dari mana saja dalam aplikasi, memungkinkan komunikasi yang efektif dengan server dan pemeliharaan otentikasi.
      - **Pemrosesan Permintaan HTTP:** Dengan menyediakan instance ```CookieRequest``` ke berbagai komponen, setiap komponen dapat melakukan permintaan HTTP dengan otentikasi tanpa perlu mengulang kembali proses autentikasi. Ini meningkatkan efisiensi dan mengurangi redundansi kode.
      - **Manajemen Cookies yang Konsisten:** Melalui instance ```CookieRequest```, komponen-komponen dapat mengakses dan memanipulasi cookies secara konsisten. Ini membantu dalam penanganan cookies dan menjaga konsistensi antara komponen-komponen yang berbeda.

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter. <br>
   Data diambil melalui respons URL yang telah ditentukan dalam proyek Django. Respons tersebut kemudian diuraikan (decoded) menjadi format JSON. Selanjutnya, dibuatlah sebuah daftar (list) item yang berisi elemen-elemen Item, di mana setiap elemen ini berasal dari hasil dekoding JSON yang tadi. Proses ini dilakukan dengan menggunakan iterasi, di mana setiap item dimasukkan ke dalam list item.

   Untuk mengambil hasil dari pengambilan item, ```FutureBuilder``` digunakan. ```FutureBuilder``` memberikan kemampuan untuk memanggil hasil dari fungsi asinkron (async) yang mengambil item. Hasil dari proses ini kemudian ditampilkan menggunakan ```ListView.builder```, yang memungkinkan pembuatan tampilan dinamis berdasarkan data yang diterima.

4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter. <br>
   Pengguna menginputkan username dan password melalui TextField dalam framework Flutter, dan data ini disimpan dalam variabel username dan password. Ketika tombol login ditekan, aplikasi mengirimkan HTTP POST request ke endpoint ```/auth/login/``` di server Django. Data username dan password dikirimkan sebagai bagian dari body request dalam format JSON.

   Server Django menerima request dan melakukan proses autentikasi terhadap pengguna. Jika autentikasi berhasil, Django mengirimkan respon berisi pesan sukses dan data pengguna. Namun, jika autentikasi gagal, Django mengirimkan respon dengan pesan kesalahan. Aplikasi Flutter menerima respon dari Django dan memeriksa apakah autentikasi berhasil. Jika berhasil, aplikasi akan mengarahkan pengguna ke halaman utama (```MyHomePage```); sebaliknya, jika gagal, aplikasi akan menampilkan pesan kesalahan.

   Setelah pengguna berhasil login, mereka akan diarahkan ke halaman utama aplikasi di mana menu aplikasi ditampilkan.

5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
      - **AppBar:** The AppBar displays the toolbar widgets, leading, title, and actions, above the bottom (if any).
      - **Column:** A widget that displays its children in a vertical array.
      - **Scaffold:** Scaffold is a class in flutter which provides many widgets or we can say APIs like Drawer, Snack-Bar, Bottom-Navigation-Bar, Floating-Action-Button, App-Bar, etc. Scaffold will expand or occupy the whole device screen. It will occupy the available space. Scaffold will provide a framework to implement the basic material design layout of the application. 
      - **Container:** A convenience widget that combines common painting, positioning, and sizing widgets.
      - **TextField:** A text field lets the user enter text, either with hardware keyboard or with an onscreen keyboard.
      - **ElevatedButton:** An elevated button is a label child displayed on a Material widget whose Material.elevation increases when the button is pressed. 
      - **FutureBuilder:** A widget that builds itself based on the latest snapshot of interaction with a Future.
      - **SnackBar:** SnackBar is a Flutter widget that enables you to temporarily display a pop-up message in your app.
      - **Navigator:** A widget that manages a set of child widgets with a stack discipline.
      - **ListView.builder:** The ListView.builder constructor takes an IndexedWidgetBuilder, which builds the children on demand.

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial). <br>
   1. Membuat file ```login.dart``` di dalam ```lib/screens/```:
         ```dart
         import 'package:battlechar_mobile/screens/menu.dart';
         import 'package:battlechar_mobile/screens/register.dart';
         import 'package:flutter/material.dart';
         import 'package:pbp_django_auth/pbp_django_auth.dart';
         import 'package:provider/provider.dart';

         void main() {
            runApp(const LoginApp());
         }

         class LoginApp extends StatelessWidget {
            const LoginApp({super.key});

            @override
            Widget build(BuildContext context) {
               return MaterialApp(
                  title: 'Login',
                  theme: ThemeData(
                  primarySwatch: Colors.indigo,
                  ),
                  home: const LoginPage(),
               );
            }
         }

         class LoginPage extends StatefulWidget {
            const LoginPage({super.key});

            @override
            _LoginPageState createState() => _LoginPageState();
            }

            class _LoginPageState extends State<LoginPage> {
            final TextEditingController _usernameController = TextEditingController();
            final TextEditingController _passwordController = TextEditingController();

            @override
            Widget build(BuildContext context) {
               final request = context.watch<CookieRequest>();
               return Scaffold(
                  appBar: AppBar(
                  title: const Text(
                     'Login',
                     style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.indigo[900],
                  foregroundColor: Colors.white,
                  ),
                  body: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                        TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                           labelText: 'Username',
                           labelStyle: TextStyle(color: Colors.indigo),
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                           ),
                        ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                           labelText: 'Password',
                           labelStyle: TextStyle(color: Colors.indigo),
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                           ),
                        ),
                        obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                        onPressed: () async {
                           String username = _usernameController.text;
                           String password = _passwordController.text;
                           final response = await request.login(
                              "http://127.0.0.1:8080/auth/login/",
                              // "http://dimas-herjunodarpito-tugas.pbp.cs.ui.ac.id/auth/login/", 
                           {
                              'username': username,
                              'password': password,
                           });

                           if (request.loggedIn) {
                              String message = response['message'];
                              String uname = response['username'];
                              
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage()),
                              );
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                    content: Text("$message Welcome, $uname.")));
                           } else {
                              // ignore: use_build_context_synchronously
                              showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                 title: const Text('Login failed'),
                                 content: Text(response['message']),
                                 actions: [
                                    TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                       Navigator.pop(context);
                                    },
                                    ),
                                 ],
                              ),
                              );
                           }
                        },
                        child: const Text('Login'),
                        ),
                        const SizedBox(height: 12.0),
                        ElevatedButton(
                        onPressed: () {
                           // Navigate to Register Page
                           Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterPage()),
                           );
                        },
                        child: const Text('Register'),
                        )
                     ],
                  ),
                  ),
               );
            }
         }
         ```
   2. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
         1. Membuat app authentication: ```python manage.py startapp authentication```
         2. Memodifikasi ```requirements.txt```
               ```txt
               django
               gunicorn
               whitenoise
               psycopg2-binary
               requests
               urllib3
               django-environ
               django-tailwind
               django-cors-headers
               ```
         3. Melakukan ```pip install -r requirements.txt```
         4. Memodifikasi ```settings.py``` project Django
               ```python
               """
               Django settings for battlechar project.

               Generated by 'django-admin startproject' using Django 4.2.5.

               For more information on this file, see
               https://docs.djangoproject.com/en/4.2/topics/settings/

               For the full list of settings and their values, see
               https://docs.djangoproject.com/en/4.2/ref/settings/
               """

               from pathlib import Path
               import environ 
               import os 
               from django.core.management.commands.runserver import Command as rs
               rs.default_port='8080'

               # Build paths inside the project like this: BASE_DIR / 'subdir'.
               BASE_DIR = Path(__file__).resolve().parent.parent

               env = environ.Env()

               CSRF_TRUSTED_ORIGINS = ['http://dimas-herjunodarpito-tugas.pbp.cs.ui.ac.id', 
                                       'https://dimas-herjunodarpito-tugas.pbp.cs.ui.ac.id']

               # Quick-start development settings - unsuitable for production
               # See https://docs.djangoproject.com/en/4.2/howto/deployment/checklist/

               # SECURITY WARNING: keep the secret key used in production secret!
               SECRET_KEY = 'django-insecure-t2ch*-d^38ic(-k86i8uz)c8cv+%x8ti=u6o^1b-(_psf^v(@*'

               PRODUCTION = env.bool('PRODUCTION', False)

               # SECURITY WARNING: don't run with debug turned on in production!
               DEBUG = True

               ALLOWED_HOSTS = ["*"]

               # Application definition

               INSTALLED_APPS = [
                  'django.contrib.admin',
                  'django.contrib.auth',
                  'django.contrib.contenttypes',
                  'django.contrib.sessions',
                  'django.contrib.messages',
                  'django.contrib.staticfiles',
                  'main',
                  'tailwind',
                  'theme',
                  'authentication',
                  'corsheaders'
               ]

               MIDDLEWARE = [
                  'django.middleware.security.SecurityMiddleware',
                  'django.contrib.sessions.middleware.SessionMiddleware',
                  'django.middleware.common.CommonMiddleware',
                  'django.middleware.csrf.CsrfViewMiddleware',
                  'django.contrib.auth.middleware.AuthenticationMiddleware',
                  'django.contrib.messages.middleware.MessageMiddleware',
                  'django.middleware.clickjacking.XFrameOptionsMiddleware',
                  'corsheaders.middleware.CorsMiddleware'
               ]

               CORS_ALLOW_ALL_ORIGINS = True
               CORS_ALLOW_CREDENTIALS = True
               CSRF_COOKIE_SECURE = True
               SESSION_COOKIE_SECURE = True
               CSRF_COOKIE_SAMESITE = 'None'
               SESSION_COOKIE_SAMESITE = 'None'

               ROOT_URLCONF = 'battlechar.urls'

               TEMPLATES = [
                  {
                     'BACKEND': 'django.template.backends.django.DjangoTemplates',
                     'DIRS': [BASE_DIR / 'templates'],
                     'APP_DIRS': True,
                     'OPTIONS': {
                           'context_processors': [
                              'django.template.context_processors.debug',
                              'django.template.context_processors.request',
                              'django.contrib.auth.context_processors.auth',
                              'django.contrib.messages.context_processors.messages',
                           ],
                     },
                  },
               ]

               WSGI_APPLICATION = 'battlechar.wsgi.application'


               # Database
               # https://docs.djangoproject.com/en/4.2/ref/settings/#databases

               DATABASES = {
                  'default': {
                     'ENGINE': 'django.db.backends.sqlite3',
                     'NAME': BASE_DIR / 'db.sqlite3',
                  }
               }

               if PRODUCTION:
                  DATABASES = {
                     'default': env.db('DATABASE_URL')
                  }
                  DATABASES["default"]["ATOMIC_REQUESTS"] = True


               # Password validation
               # https://docs.djangoproject.com/en/4.2/ref/settings/#auth-password-validators

               AUTH_PASSWORD_VALIDATORS = [
                  {
                     'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
                  },
                  {
                     'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
                  },
                  {
                     'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
                  },
                  {
                     'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
                  },
               ]


               # Internationalization
               # https://docs.djangoproject.com/en/4.2/topics/i18n/

               LANGUAGE_CODE = 'en-us'

               TIME_ZONE = 'Asia/Jakarta'

               USE_I18N = True

               USE_TZ = True


               # Static files (CSS, JavaScript, Images)
               # https://docs.djangoproject.com/en/4.2/howto/static-files/

               STATIC_URL = 'static/'

               STATIC_ROOT = os.path.join(BASE_DIR, 'static')

               # Default primary key field type
               # https://docs.djangoproject.com/en/4.2/ref/settings/#default-auto-field

               DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

               TAILWIND_APP_NAME = 'theme'

               INTERNAL_IPS = [
                  "127.0.0.1",
               ]
               ```
         5. Memodifikasi ```views.py``` pada app authentication
               ```python
               from django.shortcuts import render
               from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
               from django.http import JsonResponse
               from django.views.decorators.csrf import csrf_exempt
               from django.contrib.auth.models import User

               @csrf_exempt
               def login(request):
                  username = request.POST['username']
                  password = request.POST['password']
                  user = authenticate(username=username, password=password)
                  if user is not None:
                     if user.is_active:
                           auth_login(request, user)
                           # Status login sukses.
                           return JsonResponse({
                              "username": user.username,
                              "status": True,
                              "message": "Login successful!"
                              # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                           }, status=200)
                     else:
                           return JsonResponse({
                              "status": False,
                              "message": "Login failed, account deactivated."
                           }, status=401)

                  else:
                     return JsonResponse({
                           "status": False,
                           "message": "Login failed, recheck your username and password."
                     }, status=401)
                  
               @csrf_exempt
               def register(request):
                  username = request.POST.get('username')
                  password = request.POST.get('password')

                  if User.objects.filter(username=username).exists():
                     return JsonResponse({"status": False, "message": "Username already used."}, status=400)

                  user = User.objects.create_user(username=username, password=password)
                  user.save()

                  return JsonResponse({"username": user.username, "status": True, "message": "Register successful!"}, status=201)
                  
                  
               @csrf_exempt
               def logout(request):
                  username = request.user.username

                  try:
                     auth_logout(request)
                     return JsonResponse({"username": username, "status": True, "message": "Logout successful!"}, status=200)
                  except:
                     return JsonResponse({"status": False, "message": "Logout failed!"}, status=401)
               ```
         6. Membuat file ```urls.py``` pada app authentication
               ```python
               from django.urls import path
               from authentication.views import *

               app_name = 'authentication'

               urlpatterns = [
                  path('login/', login, name='login'),
                  path('logout/', logout, name='logout'),
                  path('register/', register, name='register'),
               ]
               ```
         7. Memodifikasi ```urls.py``` pada folder project Django
               ```python
               """
               URL configuration for battlechar project.

               The `urlpatterns` list routes URLs to views. For more information please see:
                  https://docs.djangoproject.com/en/4.2/topics/http/urls/
               Examples:
               Function views
                  1. Add an import:  from my_app import views
                  2. Add a URL to urlpatterns:  path('', views.home, name='home')
               Class-based views
                  1. Add an import:  from other_app.views import Home
                  2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
               Including another URLconf
                  1. Import the include() function: from django.urls import include, path
                  2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
               """
               from django.contrib import admin
               from django.urls import path, include

               urlpatterns = [
                  path('admin/', admin.site.urls),
                  path('', include('main.urls')),
                  path('auth/', include('authentication.urls')),
               ]
               ```
         8. Masuk ke project Flutter dan install dua package
               ```
               flutter pub add provider
               flutter pub add pbp_django_auth
               ```
         9. Memodifikasi ```lib/main.dart```
               ```dart
               import 'package:battlechar_mobile/screens/login.dart';
               import 'package:flutter/material.dart';
               import 'package:pbp_django_auth/pbp_django_auth.dart';
               import 'package:provider/provider.dart';

               void main() {
               runApp(const MyApp());
               }

               class MyApp extends StatelessWidget {
               const MyApp({super.key});

               // This widget is the root of your application.
               @override
               Widget build(BuildContext context) {
                  return Provider(create: (_) {
                     CookieRequest request = CookieRequest();
                     return request;
                  },
                  child: MaterialApp(
                     title: 'Battlechar',
                     theme: ThemeData(
                     colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                     useMaterial3: true,
                     ),
                     home: LoginPage(),
                  ));
               }
               }
               ```
      10. Memodifikasi ```lib/widgets/left_drawer.dart```
            ```dart
            import 'package:battlechar_mobile/screens/login.dart';
            import 'package:battlechar_mobile/screens/operatorlist_items.dart';
            import 'package:flutter/material.dart';
            import 'package:battlechar_mobile/screens/menu.dart';
            import 'package:battlechar_mobile/screens/operatorlist_form.dart';
            import 'package:pbp_django_auth/pbp_django_auth.dart';
            import 'package:provider/provider.dart';

            class LeftDrawer extends StatelessWidget {
            const LeftDrawer({super.key});

            @override
            Widget build(BuildContext context) {
               final request = context.watch<CookieRequest>();
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
                     ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text('Logout'),
                        // Bagian redirection ke ShopFormPage
                        onTap: () async {
                        final response = await request.logout(
                           // "http://dimas-herjunodarpito-tugas.pbp.cs.ui.ac.id/auth/logout/",
                           "http://127.0.0.1:8080/auth/logout/");
                        String message = response["message"];
                        if (response['status']) {
                           String uname = response["username"];
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("$message See you again, $uname!"),
                           ));
                           Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                           );
                        } else {
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("$message"),
                           ));
                        }
                        },
                     ),
                  ],
                  ),
               );
            }
            }
            ```
      11. Memodifikasi ```lib/widgets/menu_card.dart```
            ```dart
            import 'package:battlechar_mobile/screens/operatorlist_items.dart';
            import 'package:flutter/material.dart';
            import 'package:battlechar_mobile/screens/operatorlist_form.dart';
            import 'package:pbp_django_auth/pbp_django_auth.dart';
            import 'package:provider/provider.dart';
            import 'package:battlechar_mobile/screens/login.dart';

            class MenuItem {
            final String name;
            final IconData icon;
            final Color color;

            MenuItem(this.name, this.icon, this.color);
            }

            class MenuCard extends StatelessWidget {
            final MenuItem item;

            const MenuCard(this.item, {super.key}); // Constructor

            @override
            Widget build(BuildContext context) {
               final request = context.watch<CookieRequest>();
               return Material(
                  color: item.color,
                  child: InkWell(
                  // Area responsive terhadap sentuhan
                  onTap: () async {
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

                     if (item.name == "Logout") {
                        final response = await request.logout(
                           // "http://dimas-herjunodarpito-tugas.pbp.cs.ui.ac.id/auth/logout/",
                           "http://127.0.0.1:8080/auth/logout/");
                        String message = response["message"];
                        if (response['status']) {
                        String uname = response["username"];
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                           content: Text("$message See you again, $uname!"),
                        ));
                        Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                        } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                           content: Text("$message"),
                        ));
                        }
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
      12. Menambah file ```lib/screens/login.dart```
            ```dart
            import 'package:battlechar_mobile/screens/menu.dart';
            import 'package:battlechar_mobile/screens/register.dart';
            import 'package:flutter/material.dart';
            import 'package:pbp_django_auth/pbp_django_auth.dart';
            import 'package:provider/provider.dart';

            void main() {
            runApp(const LoginApp());
            }

            class LoginApp extends StatelessWidget {
            const LoginApp({super.key});

            @override
            Widget build(BuildContext context) {
               return MaterialApp(
                  title: 'Login',
                  theme: ThemeData(
                  primarySwatch: Colors.indigo,
                  ),
                  home: const LoginPage(),
               );
            }
            }

            class LoginPage extends StatefulWidget {
            const LoginPage({super.key});

            @override
            _LoginPageState createState() => _LoginPageState();
            }

            class _LoginPageState extends State<LoginPage> {
            final TextEditingController _usernameController = TextEditingController();
            final TextEditingController _passwordController = TextEditingController();

            @override
            Widget build(BuildContext context) {
               final request = context.watch<CookieRequest>();
               return Scaffold(
                  appBar: AppBar(
                  title: const Text(
                     'Login',
                     style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.indigo[900],
                  foregroundColor: Colors.white,
                  ),
                  body: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                        TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                           labelText: 'Username',
                           labelStyle: TextStyle(color: Colors.indigo),
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                           ),
                        ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                           labelText: 'Password',
                           labelStyle: TextStyle(color: Colors.indigo),
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                           ),
                        ),
                        obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                        onPressed: () async {
                           String username = _usernameController.text;
                           String password = _passwordController.text;
                           final response = await request.login(
                              "http://127.0.0.1:8080/auth/login/",
                              // "http://dimas-herjunodarpito-tugas.pbp.cs.ui.ac.id/auth/login/", 
                           {
                              'username': username,
                              'password': password,
                           });

                           if (request.loggedIn) {
                              String message = response['message'];
                              String uname = response['username'];
                              
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage()),
                              );
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                    content: Text("$message Welcome, $uname.")));
                           } else {
                              // ignore: use_build_context_synchronously
                              showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                 title: const Text('Login failed'),
                                 content: Text(response['message']),
                                 actions: [
                                    TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                       Navigator.pop(context);
                                    },
                                    ),
                                 ],
                              ),
                              );
                           }
                        },
                        child: const Text('Login'),
                        ),
                        const SizedBox(height: 12.0),
                        ElevatedButton(
                        onPressed: () {
                           // Navigate to Register Page
                           Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterPage()),
                           );
                        },
                        child: const Text('Register'),
                        )
                     ],
                  ),
                  ),
               );
            }
            }
            ```
      13. Menambah file ```lib/screens/register.dart```
            ```dart
            import 'package:battlechar_mobile/screens/login.dart';
            import 'package:flutter/material.dart';
            import 'package:pbp_django_auth/pbp_django_auth.dart';
            import 'package:provider/provider.dart';

            void main() {
            runApp(const RegisterApp());
            }

            class RegisterApp extends StatelessWidget {
            const RegisterApp({super.key});

            @override
            Widget build(BuildContext context) {
               return MaterialApp(
                  title: 'Register',
                  theme: ThemeData(
                  primarySwatch: Colors.indigo,
                  ),
                  home: const RegisterPage(),
               );
            }
            }

            class RegisterPage extends StatefulWidget {
            const RegisterPage({super.key});

            @override
            _RegisterPageState createState() => _RegisterPageState();
            }

            class _RegisterPageState extends State<RegisterPage> {
            final TextEditingController _usernameController = TextEditingController();
            final TextEditingController _passwordController = TextEditingController();
            final TextEditingController _passwordConfirmationController =
                  TextEditingController();

            @override
            Widget build(BuildContext context) {
               final request = context.watch<CookieRequest>();
               return Scaffold(
                  appBar: AppBar(
                  title: const Text(
                     'Register',
                     style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.indigo[900],
                  foregroundColor: Colors.white,
                  ),
                  body: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                        TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                           labelText: 'Username',
                           labelStyle: TextStyle(color: Colors.indigo),
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                           ),
                        ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                           labelText: 'Password',
                           labelStyle: TextStyle(color: Colors.indigo),
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                           ),
                        ),
                        obscureText: true,
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                        controller: _passwordConfirmationController,
                        decoration: const InputDecoration(
                           labelText: 'Confirm Password',
                           labelStyle: TextStyle(color: Colors.indigo),
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                           ),
                        ),
                        obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                        onPressed: () async {
                           String username = _usernameController.text;
                           String password = _passwordController.text;
                           String passwordConfirmation =
                              _passwordConfirmationController.text;

                           if (password != passwordConfirmation) {
                              ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(const SnackBar(
                                    content: Text(
                                       "Register failed, password confimation incorrect.")));
                              return;
                           }
                           final response = await request.post(
                              "http://127.0.0.1:8080/auth/register/",
                              // "http://dimas-herjunodarpito-tugas.pbp.cs.ui.ac.id/auth/register/",
                              {
                                 'username': username,
                                 'password': password,
                              });

                           if (response['status']) {
                              String message = response['message'];
                              
                              Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                              ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(SnackBar(content: Text("$message")));
                           } else {
                              showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                 title: const Text('Register failed.'),
                                 content: Text(response['message']),
                                 actions: [
                                    TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                       Navigator.pop(context);
                                    },
                                    ),
                                 ],
                              ),
                              );
                           }
                        },
                        child: const Text('Register'),
                        ),
                        const SizedBox(height: 12.0),
                        ElevatedButton(
                        onPressed: () {
                           // Navigate to Login
                           Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                           );
                        },
                        child: const Text('Login'),
                        )
                     ],
                  ),
                  ),
               );
            }
            }
            ```
   3. Membuat file ```lib/models/operator.dart``` dengan bantuan website http://app.quicktype.io/
         ```dart
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
         ```
   4. Memodifikasi ```lib/screens/operatorlist_form.dart``` agar bisa membuat Operator dan menyimpannya ke dalam
         ```dart
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
         ```
   5. Memodifikasi ```lib/screens/operatorlist_items.dart``` agar dapat melihat Operator yang di buat User yang sedang logged-in dari database
         ```dart
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
         ```
   6. Menambah file ```lib/screens/detail_operator.dart``` untuk melihat detail dari Operator secara lebih mendalam
         ```dart
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
         ```