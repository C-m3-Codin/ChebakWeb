import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:testweb/DisplayQr.dart';
import 'package:testweb/datamodelobj.dart';
import 'package:testweb/services.dart';

// void main() {
//   runApp(MyApp());
// }

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
//   print("run App run \n\n ");
// }
String trnasOn = "Nothappening";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // print("\n\n\nEntered\n\n\n\n\n");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DatabaseService _db = new DatabaseService();
    return MultiProvider(
        providers: [
          StreamProvider<List<QrObj>>(
              create: (BuildContext context) => _db.geDateofMatchetest(),
              initialData: []),
        ],
        child: MaterialApp(title: 'Flutter Demo', initialRoute: '/',
            // initialRoute: '/',
            routes: {
              '/': (context) => MyHomePage(),
            }));
  }
}

class MyHomePage extends StatefulWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
// qr[0].cardNo.isEmpty?

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var qr = Provider.of<List<QrObj>>(context).toList();
    QrObj selected;
    for (int i = 0; i < qr.length; i++) {
      if (qr[i].cardNo.isNotEmpty && qr[i].transActive == true ||
          (qr[i].cardNo.isEmpty && qr[i].transActive == false)) {
        selected = qr[i];
        print("\n\n\n\n\n selected is ${qr[i].idNo}");
      }
    }
    print("\n\n\n\n\n${qr.length}");
    return Scaffold(
        appBar: AppBar(
          title: Text("asd"),
        ),
        body: selected == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : selected.cardNo.isEmpty
                ? DsiplayQr(qr: selected)
                : AfterAuthScreen(selected: selected));
  }
}

class AfterAuthScreen extends StatelessWidget {
  const AfterAuthScreen({
    Key key,
    @required this.selected,
  }) : super(key: key);

  final QrObj selected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Welcome to The Bank ${selected.person}"),
    );
  }
}
