import 'package:buy_it/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EditPage extends StatefulWidget {
  static String id = 'Editdelegate';

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final CollectionReference _delegates =
      FirebaseFirestore.instance.collection('users');
  final controllerName = TextEditingController();

  final controllerLC = TextEditingController();

  final controllerRoom = TextEditingController();
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      controllerName.text = documentSnapshot['name'];
      controllerLC.text = documentSnapshot['LC'];
      controllerRoom.text = documentSnapshot['room'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controllerName,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: controllerLC,
                  decoration: const InputDecoration(labelText: 'LC'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: controllerRoom,
                  decoration: const InputDecoration(
                    labelText: 'room',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String name = controllerName.text;
                    final String LC = controllerLC.text;
                    final int room = int.parse(controllerRoom.text);
                    if (room != null) {
                      await _delegates
                          .doc(documentSnapshot!.id)
                          .update({"name": name, "LC": LC, "room": room});
                      controllerName.text = '';
                      controllerLC.text = '';
                      controllerRoom.text = '';
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _delegates.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a delegate')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMaiinColor,
      body: StreamBuilder(
        stream: _delegates.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                return Card(
                  color: KMaiinColor,
                  shadowColor: Colors.black,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text('Room : ' +
                        documentSnapshot['room'].toString() +
                        ' LC : ' +
                        documentSnapshot['LC']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _update(documentSnapshot),
                          ),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _delete(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
