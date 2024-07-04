import 'package:flutter/material.dart';

class SavedArticlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Saved Articles'),
      ),
      body: Center(
        child: Text('Saved Articles Page'),
      ),
    );
  }
}
