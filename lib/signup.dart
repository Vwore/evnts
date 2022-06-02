import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'events_example.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  late String name,email,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign UP'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',

                  ),
                  onChanged: (value) {
                    name=value;
                  }
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TextField(

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
                  ),
                  onChanged: (value) {
                    email=value;
                    print(email);
                  }
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (value) {
                    password=value;
                  }
              ),

            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () async {
              try {
                UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: "$email",
                    password: "$password",
                );
                print('1');
                FirebaseFirestore.instance.collection(email).add({
                  "key":25 //your data which will be added to the collection and collection will be created after this
                }).then((_){
                  print("collection created");
                }).catchError((_){
                  print("an error occured");
                });
                print('2');
                Navigator.pushReplacementNamed(context, 'home',arguments: email);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                }
                else
                  {
                    print('registered');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  TableEventsExample()),
                    );
                  }
              } catch (e) {
                print(e);
              }
            },
                child: Text("sign up")),


          ],
        ),
      ),
    );
  }
}
