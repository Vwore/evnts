import 'package:flutter/material.dart';
import 'events_example.dart';
import 'signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: 'welcome',
    routes: {
      'welcome':(context)=> MyApp(),
      'home' :(context)=> TableEventsExample(),
      'signup' :(context)=> Signup()},
    // home: MyApp(),
       // home: TableEventsExample(),
       ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // void fire()
  // {
  //   FirebaseFirestore.instance
  //       .collection('Event')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       Timestamp t=doc["date"];
  //       List<dynamic> l=doc["event"];
  //       List<Event> m=[Event('test')];
  //
  //       DateTime d = DateTime.fromMicrosecondsSinceEpoch(t.microsecondsSinceEpoch);
  //
  //       l.forEach((element) {m.add(Event(element)); });
  //       kEvents.addAll({
  //       d: m,
  //       });
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // fire();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome',
        ),
        centerTitle: true,
      ),
        body: Column(

          children: [
            SizedBox(height: 200,),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Signup()),
                  );
                },
                child: Text(
                "sign up",
              ),
              ),

            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Login()),
                  );
                },
                child: Text(
                  "Login",
                ),
              ),
            ),
          ],
        ),
    );
  }
}


