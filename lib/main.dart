import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      title: 'APP ESPK8',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
            home: MyStatefulWidget(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.orange,
              brightness: AppController.instance.isDartTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
          );
        });
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    espk8Screen(),
    protasScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.maps_home_work, size: 30),
            // selectedIcon: Icon(Icons.other_houses, size: 30),
            label: 'Casa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_preferences, size: 30),
            //  selectedIcon: Icon(Icons.room_preferences, size: 30),
            label: 'Portas',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class espk8Screen extends StatefulWidget {
  const espk8Screen({Key? key}) : super(key: key);

  @override
  _espk8ScreenState createState() => _espk8ScreenState();
}

class _espk8ScreenState extends State<espk8Screen> {
  bool value = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;
  final dbRef = FirebaseDatabase.instance.ref();

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  onUpdate1() {
    setState(() {
      value1 = !value1;
    });
  }

  onUpdate2() {
    setState(() {
      value2 = !value2;
    });
  }

  onUpdate3() {
    setState(() {
      value3 = !value3;
    });
  }

  onUpdate4() {
    setState(() {
      value4 = !value4;
    });
  }

  onUpdate5() {
    setState(() {
      value5 = !value5;
    });
  }

  onUpdate6() {
    setState(() {
      value6 = !value6;
    });
  }

  onUpdate7() {
    setState(() {
      value7 = !value7;
    });
  }

// ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "S_Map - Smart Home - ",
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 5,
        actions: [CustomSwither()],
        leading: Icon(Icons.home),
      ),
      body: ListView(children: [
        StreamBuilder(
            //  stream: dbRef.child("LighState").onValue,
            builder: (context, snapshot) {
          //if(snapshot.hasData && !snapshot.hasError && snapshot.data.snapshot.value !=null) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //    Padding(
            //      padding: const EdgeInsets.all(18),
            //     child: Row(
            //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //      children: const [
            //       Icon(Icons.dashboard, color: Colors.orange, size: 30.0),
            //       Text(
            //         "ESPK8_APP",
            //        style: TextStyle(
            //            fontSize: 30,
            //            fontWeight: FontWeight.bold,
            //            color: Colors.orange),
            //       ),
            //        Icon(Icons.view_column, color: Colors.orange, size: 30.0)
            //   ],
            //    ),
            //),

            // ignore: prefer_const_constructors

            //   const SizedBox(height: 20),
//Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Sala",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
                onPressed: () {
                  onUpdate();
                  writeData();
                },
                label: value ? const Text("Ligado") : const Text("Desligado"),
                elevation: 10,
                backgroundColor: value ? Colors.orange : Colors.white,
                icon: value
                    ? const Icon(Icons.wb_incandescent)
                    : const Icon(Icons.lightbulb)),
            //Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Quarto",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
                onPressed: () {
                  onUpdate1();
                  writeData1();
                },
                label: value1 ? const Text("Ligado") : const Text("Desligado"),
                elevation: 10,
                backgroundColor: value1 ? Colors.orange : Colors.white,
                icon: value1
                    ? const Icon(Icons.wb_incandescent)
                    : const Icon(Icons.lightbulb)),

//++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //Column(children: [
            //Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Varanda",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
                onPressed: () {
                  onUpdate2();
                  writeData2();
                },
                label: value2 ? const Text("Ligado") : const Text("Desligado"),
                elevation: 10,
                backgroundColor: value2 ? Colors.orange : Colors.white,
                icon: value2
                    ? const Icon(Icons.wb_incandescent)
                    : const Icon(Icons.lightbulb)),
            // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Banheiro",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
                onPressed: () {
                  onUpdate3();
                  writeData3();
                },
                label: value3 ? const Text("Ligado") : const Text("Desligado"),
                elevation: 10,
                backgroundColor: value3 ? Colors.orange : Colors.white,
                icon: value3
                    ? const Icon(Icons.wb_incandescent)
                    : const Icon(Icons.lightbulb)),

//++++++++++++++++++++++++++++++++++++++++++++++++++++++

            // Column(children: [
            // Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Quintal",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
                onPressed: () {
                  onUpdate4();
                  writeData4();
                },
                label: value4 ? const Text("Ligado") : const Text("Desligado"),
                elevation: 10,
                backgroundColor: value4 ? Colors.orange : Colors.white,
                icon: value4
                    ? const Icon(Icons.wb_incandescent)
                    : const Icon(Icons.lightbulb)),
            //Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Deck",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
                onPressed: () {
                  onUpdate5();
                  writeData5();
                },
                label: value5 ? const Text("Ligado") : const Text("Desligado"),
                elevation: 10,
                backgroundColor: value5 ? Colors.orange : Colors.white,
                icon: value5
                    ? const Icon(Icons.wb_incandescent)
                    : const Icon(Icons.lightbulb)),

//++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //  Column(children: [
            // Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Banehiro Deck",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
                onPressed: () {
                  onUpdate6();
                  writeData6();
                },
                label: value6 ? const Text("Ligado") : const Text("Desligado"),
                elevation: 10,
                backgroundColor: value6 ? Colors.orange : Colors.white,
                icon: value6
                    ? const Icon(Icons.wb_incandescent)
                    : const Icon(Icons.lightbulb)),
            //Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Quarto Suit",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
                onPressed: () {
                  onUpdate7();
                  writeData7();
                },
                label: value7 ? const Text("Ligado") : const Text("Desligado"),
                elevation: 10,
                backgroundColor: value7 ? Colors.orange : Colors.white,
                icon: value7
                    ? const Icon(Icons.wb_incandescent)
                    : const Icon(Icons.lightbulb)),
          ]);
        } //

            ),
      ]),
    );
  }

  Future<void> writeData() async {
    dbRef.child("LighState").set({"switch": !value});
  }

  Future<void> writeData1() async {
    dbRef.child("LighState1").set({"switch1": !value1});
  }

  Future<void> writeData2() async {
    dbRef.child("LighState2").set({"switch2": !value2});
  }

  Future<void> writeData3() async {
    dbRef.child("LighState3").set({"switch3": !value3});
  }

  Future<void> writeData4() async {
    dbRef.child("LighState4").set({"switch4": !value4});
  }

  Future<void> writeData5() async {
    dbRef.child("LighState5").set({"switch5": !value5});
  }

  Future<void> writeData6() async {
    dbRef.child("LighState6").set({"switch6": !value6});
  }

  Future<void> writeData7() async {
    dbRef.child("LighState7").set({"switch7": !value7});
  }
}

class protasScreen extends StatefulWidget {
  const protasScreen({Key? key}) : super(key: key);

  @override
  _protasScreenState createState() => _protasScreenState();
}

class _protasScreenState extends State<protasScreen> {
  int _counter = 0;
  late DatabaseReference _counterRef;
  late StreamSubscription<DatabaseEvent> _counterSubscription;
  FirebaseException? _error;
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    _counterRef = FirebaseDatabase.instance.ref('port:/');

    final database = FirebaseDatabase.instance;

    //_messagesRef = database.ref('messages');
    if (!kIsWeb) {
      database.setPersistenceEnabled(true);
      database.setPersistenceCacheSizeBytes(10000000);
    }

    if (!kIsWeb) {
      await _counterRef.keepSynced(true);
    }

    setState(() {
      var value = _counterRef.get();
      //initialized = true;
    });

    try {
      final counterSnapshot = await _counterRef.get();

      print(
        'Connected to directly configured database and read '
        '${counterSnapshot.value}',
      );
    } catch (err) {
      print(err);
    }

    _counterSubscription = _counterRef.onValue.listen(
      (DatabaseEvent event) {
        setState(() {
          _error = null;
          _counter = (event.snapshot.value ?? 0) as int;
        });
      },
      onError: (Object o) {
        final error = o as FirebaseException;
        setState(() {
          _error = error;
        });
      },
    );
  }

  DatabaseReference starCountRef = FirebaseDatabase.instance.ref('port:/');

  // final dbRef = FirebaseDatabase.instance.ref();
//final snapshot = await dbRef.child('port:/').get();
  //final snapshot = _counterRef.child('port/').get();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "S_Map - Smart Home - ",
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 5,
        actions: [CustomSwither()],
        leading: Icon(Icons.room_preferences),
      ),
      body: ListView(children: [
        StreamBuilder(
            stream: _counterRef.child('port/sala').onValue,
            builder: (context, snapshot) {
              //
              var value = _counterRef.get();
              //var value8 = dbRef.child('port').get();
              if (snapshot.hasData &&
                  !snapshot.hasError &&
                  snapshot.data != null) {
//if (value8 == false) {
                //     value8 = "Aberto!" as Future<DataSnapshot>;
                //   } else {
                //      value8 = "Fechada!" as Future<DataSnapshot>;
//}
//var text = Text(
                //   value8.toString(),
                //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//);

                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Porta de Entrada",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),

                      // ignore: unrelated_type_equality_checks

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${value.toString()}'),
                      ),

                      // ignore: prefer_const_constructors

                      const SizedBox(height: 20),
                    ]);
              } else
                return ListView();
            }),
      ]),
    );
  }
}

class CustomSwither extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDartTheme,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}

class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  bool isDartTheme = false;
  changeTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}
