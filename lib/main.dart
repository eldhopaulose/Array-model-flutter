import 'package:flutter/material.dart';
import 'package:flutter_application_1/dior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchTitles(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show a loading indicator while waiting for data
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                // Assuming fetchTitles() returns a List<String>
                return ListView.builder(
                  itemCount:
                      snapshot.data?.length, // Provide the number of items
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(snapshot.data![index].date
                              .toString()), // Display the title at the current index
                        ),
                        ListTile(
                          title: Text(snapshot.data![index].commentStatus
                              .toString()), // Display the title at the current index
                        ),
                        ListTile(
                          title: Text(snapshot.data![index].author
                              .toString()), // Display the title at the current index
                        ),
                        ListTile(
                          title: Text(snapshot.data![index].description.rendered
                              .toString()), // Display the title at the current index
                        ),
                        ListTile(
                          title: Text(snapshot.data![index].link
                              .toString()), // Display the title at the current index
                        ),
                        ListTile(
                          title: Text(snapshot
                              .data![index].mediaDetails.imageMeta.camera
                              .toString()), // Display the title at the current index
                        ),
                      ],
                    );
                  },
                );
              } else {
                return Text(
                    'No data available'); // Handle the case when there is no data
              }
            },
          ),
        ));
  }
}
