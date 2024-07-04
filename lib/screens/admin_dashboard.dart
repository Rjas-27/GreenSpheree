import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                'Manage Articles',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                gradient: LinearGradient(colors: [Colors.teal, Colors.green]),
              ),
              SizedBox(height: 20),
              _buildFeatureCard(
                context,
                title: 'Manage Articles',
                icon: Icons.article,
                gradient:
                    LinearGradient(colors: [Colors.green, Colors.lightGreen]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminArticlePage()),
                  );
                },
              ),
              SizedBox(height: 30),
              GradientText(
                'View Most Viewed Articles',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                gradient: LinearGradient(colors: [Colors.teal, Colors.blue]),
              ),
              SizedBox(height: 20),
              _buildFeatureCard(
                context,
                title: 'Most Viewed Articles',
                icon: Icons.trending_up,
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.lightBlueAccent]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MostViewedArticlesPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required String title,
      required IconData icon,
      required LinearGradient gradient,
      required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Icon(icon, color: Colors.white, size: 30),
          ],
        ),
      ),
    );
  }
}

class AdminArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> articles = [
      'Anggrek Bulan',
      'Bunga Mawar',
      'Bunga Matahari',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Articles',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(20),
              title: Text(
                articles[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Deleted ${articles[index]}'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class MostViewedArticlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> mostViewedArticles = [
      'Bunga Matahari',
      'Bunga Mawar',
      'Bunga Anggrek Bulan',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Most Viewed Articles',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: mostViewedArticles.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(20),
              title: Text(
                mostViewedArticles[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Views: 100'), // Replace with actual views count
              leading: Icon(Icons.visibility, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  GradientText(this.text, {required this.style, required this.gradient});

  final String text;
  final TextStyle style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AdminDashboard(),
  ));
}
