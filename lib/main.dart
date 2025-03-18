import 'package:flutter/material.dart';
import 'package:hello_world/basic_widgets/date_time_picker.dart';
import 'package:hello_world/basic_widgets/dialog_widgets.dart';
import 'package:hello_world/basic_widgets/floating_action_button.dart';
import 'package:hello_world/basic_widgets/image_widget.dart';
import 'package:hello_world/basic_widgets/loading_cupertino.dart';
import 'package:hello_world/basic_widgets/scaffold.dart';
import 'package:hello_world/basic_widgets/selection_widget.dart';
import 'package:hello_world/basic_widgets/text_widget.dart';

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
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Selector')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNavigationButton(context, 'DateTime Picker', const DateTimePicker()),
          _buildNavigationButton(context, 'Dialog Widgets', null, showDialogCallback: () => showAlertDialog(context)),
          _buildNavigationButton(context, 'Floating Action Button', const CustomFloatingButton()),
          _buildNavigationButton(context, 'Image Widget', const MyImageWidget()),
          _buildNavigationButton(context, 'Loading Cupertino', const LoadingCupertino()),
          _buildNavigationButton(context, 'Scaffold Example', const MyScaffold()),
          _buildNavigationButton(context, 'Selection Widget', const SelectionWidget()),
          _buildNavigationButton(context, 'Text Widget', const MyTextWidget()),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context, String title, Widget? page, {VoidCallback? showDialogCallback}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          if (showDialogCallback != null) {
            showDialogCallback();
          } else if (page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Scaffold(appBar: AppBar(title: Text(title)), body: Center(child: page))),
            );
          }
        },
        child: Text(title),
      ),
    );
  }
}
