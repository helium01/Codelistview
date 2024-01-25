import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyListView(),
    );
  }
}

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  bool showDetails = false;

  final List<String> titles = ['Title 1', 'Title 2', 'Title 3'];
  final List<String> codes = ['Code 1', 'Code 2', 'Code 3'];
  final List<String> descriptions = ['Desc 1', 'Desc 2', 'Desc 3'];
  final List<String> photos = ['Photo 1', 'Photo 2', 'Photo 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(showDetails ? titles[index] + ' - ' + codes[index] : titles[index]),
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  showDetails = !showDetails;
                });
              },
              child: Text(showDetails ? 'Hide Details' : 'Show Details'),
            ),
            subtitle: showDetails
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Code: ${codes[index]}'),
                      Text('Description: ${descriptions[index]}'),
                      Text('Photo: ${photos[index]}'),
                    ],
                  )
                : null,
          );
        },
      ),
    );
  }
}
