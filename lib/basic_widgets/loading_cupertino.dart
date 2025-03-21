// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingCupertino extends StatelessWidget {
  const LoadingCupertino({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(top: 30),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                child: const Text("Contoh button"),
                onPressed: () {},
              ),
              const CupertinoActivityIndicator(), // Langsung pakai di sini
            ],
          ),
        );
  }
}
