import 'package:firebase_crud/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: const Icon(Icons.search),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Search(
                data: data,
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('data').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    for (int i = 0; i < snapshot.data!.docs.length; i++) {
                      data.add(snapshot.data!.docs[i]['text']);
                    }

                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ListTile(
                                title:
                                    Text(snapshot.data!.docs[index]['text'])));
                  } else {
                    return const Center(child: Text("Loading..."));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
