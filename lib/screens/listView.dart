import 'package:flutter/material.dart';

class ListViewDismissScreen extends StatefulWidget {
  @override
  _ListViewDismissScreenState createState() => _ListViewDismissScreenState();
}

class _ListViewDismissScreenState extends State<ListViewDismissScreen> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Interactive List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(
                () {
                  String deletedItem = items.removeAt(index);
                  _key.currentState
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text("Deleted \"$item\""),
                        action: SnackBarAction(
                            label: "UNDO",
                            onPressed: () => setState(
                                  () => items.insert(index, deletedItem),
                                ) // this is what you needed
                            ),
                      ),
                    );
                  //   items.removeAt(index);
                  // });

                  // Scaffold.of(context)
                  //     .showSnackBar(SnackBar(content: Text("$item dismissed")));
                },
              );
            },
            background: leftBackground(),
            secondaryBackground: rightBackground(),
            child: ListTile(title: Text('$item')),
          );
        },
      ),
    );
  }
}

Widget leftBackground() {
  return Container(
    color: Colors.blue,
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.archive,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}

Widget rightBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
  );
}
