import 'package:flutter/material.dart';

class LikedArticlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Liked Articles'),
      ),
      body: Center(
        child: Text('Liked Articles Page'),
      ),
    );
  }
}
