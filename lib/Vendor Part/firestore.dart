import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Fire extends StatefulWidget {
  @override
  _Fire createState() => _Fire();
}

class _Fire extends State<Fire> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection('Vendor').document('HomeBox Catagory').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          dynamic va = snapshot.data.data['category'];
          print(va);
          if (snapshot.hasError) return Text('${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text("Loading...");
            default:
              return ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Text(va[index]['category'].toString()),
                    );
                  });
          }
        });
  }
}
