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
        primaryColor: Colors.lightBlue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.lightBlueAccent,
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
    return CustomScaffold(
      title: 'Muhammad Nurfathan',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding biar tidak mepet
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Tengah secara vertikal
            crossAxisAlignment: CrossAxisAlignment.center, // Tengah secara horizontal
            children: [
              const Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 20), // Jarak antar elemen

              // Tombol Navigasi ke Widget Lain
              _buildNavButton(context, "Text Widget", const MyTextWidget()),
              _buildNavButton(context, "Selection Widget", const SelectionWidget()),
              _buildNavButton(context, "Date Picker", const DateTimePicker()),
              _buildNavButton(context, "Loading Cupertino", const LoadingCupertino()),
              _buildNavButton(context, "Image Widget", const MyImageWidget()),
              _buildNavButton(context, "Floating Button", const CustomFloatingButton()),
              _buildNavButton(context, "Show Dialog", null),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String title, Widget? page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Jarak antar tombol
      child: ElevatedButton(
        onPressed: () {
          if (page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomScaffold(title: title, body: page),
              ),
            );
          } else {
            showAlertDialog(context);
          }
        },
        child: Text(title),
      ),
    );
  }
}
