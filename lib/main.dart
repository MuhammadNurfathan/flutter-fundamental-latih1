import 'package:flutter/material.dart';
import 'package:hello_world/basic_widgets/scaffold.dart';
import 'package:hello_world/basic_widgets/text_widget.dart';
import 'package:hello_world/basic_widgets/selection_widget.dart';
import 'package:hello_world/basic_widgets/date_time_picker.dart';
import 'package:hello_world/basic_widgets/loading_cupertino.dart';
import 'package:hello_world/basic_widgets/image_widget.dart';
import 'package:hello_world/basic_widgets/floating_action_button.dart';
import 'package:hello_world/basic_widgets/dialog_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muhammad Nurfathan', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildNavCard(context, "Text Widget", const MyTextWidget()),
              _buildNavCard(context, "Selection Widget", const SelectionWidget()),
              _buildNavCard(context, "Date Picker", const DateTimePicker()),
              _buildNavCard(context, "Loading Cupertino", const LoadingCupertino()),
              _buildNavCard(context, "Image Widget", const MyImageWidget()),
              _buildNavCard(context, "Floating Button", const CustomFloatingButton()),
              _buildNavCard(context, "Show Dialog", null),
              _buildNavCard(context, "Show Scaffold", const CustomScaffold(body: Center(child: Text("Ini halaman Scaffold")))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavCard(BuildContext context, String title, Widget? page) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap: () {
          print("Navigating to $title");
          if (page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: Text(title),
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                  body: Center(child: page),
                ),
              ),
            );
          } else {
            showAlertDialog(context);
          }
        },
      ),
    );
  }
}
