import 'package:flutter/material.dart';
import 'detail_article.dart'; // Mengimpor halaman detail artikel

class ArticlePage extends StatefulWidget {
  final String category;

  ArticlePage(this.category);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  // Placeholder list of articles (replace with actual data from API)
  List<Map<String, String>> articles = [
    {
      'id': '1',
      'title': 'Anggrek Bulan (Phalaenopsis amabilis)',
      'content': 'Detail about Anggrek Bulan',
      'plantCare':
          'Anggrek Bulan membutuhkan cahaya yang terang namun tidak langsung terkena sinar matahari penuh. Tempatkan di tempat yang terkena cahaya indirek atau di dekat jendela yang memiliki gorden.',
      'description':
          'Anggrek Bulan atau Phalaenopsis adalah salah satu genus anggrek yang terkenal dengan bunganya yang besar, berwarna-warni, dan tahan lama. Anggrek ini berasal dari daerah tropis Asia Tenggara dan merupakan pilihan populer dalam hortikultura rumahan karena kemudahan perawatannya.',
      'imageUrl': 'https://linktoyourimage.com/anggrekbulan.jpeg'
    },
    {
      'id': '2',
      'title': 'Anggrek Hitam (Coelogyne pandurata)',
      'content': 'Detail about Anggrek Hitam...',
      'plantCare': 'Water daily. Prefers humid environment.',
      'description': 'Anggrek Hitam is known for its unique black flowers.',
      'imageUrl': 'https://linktoyourimage.com/anggrekhitam.jpg'
    },
    {
      'id': '3',
      'title': 'Bugenvil (Bougainvillea)',
      'content': 'Detail about Bugenvil...',
      'plantCare': 'Water when the top inch of soil is dry. Prefers full sun.',
      'description':
          'Bugenvil is a popular ornamental plant with vibrant flowers.',
      'imageUrl': 'https://linktoyourimage.com/bugenvil.jpg'
    },
    // Add more articles as needed
  ];

  Set<String> likedArticles = Set<String>(); // State to store liked articles

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Articles'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          bool isLiked = likedArticles.contains(articles[index]['id']);

          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              leading: Image.network(
                articles[index]['imageUrl']!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text(
                articles[index]['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(articles[index]['description']!),
              trailing: IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    if (isLiked) {
                      likedArticles.remove(articles[index]['id']);
                    } else {
                      likedArticles.add(articles[index]['id']!);
                    }
                  });
                },
              ),
              onTap: () {
                // Navigate to detailed article page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailPage(
                      articleTitle: articles[index]['title']!,
                      articleContent: articles[index]['content']!,
                      plantCare: articles[index]['plantCare']!,
                      plantDescription: articles[index]['description']!,
                      imageUrl: articles[index]['imageUrl']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Liked Articles',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ...likedArticles.map((articleId) {
              var article = articles.firstWhere(
                (article) => article['id'] == articleId,
                orElse: () => {'title': '', 'description': ''},
              );
              return ListTile(
                title: Text(article['title']!),
                subtitle: Text(article['description']!),
                onTap: () {
                  Navigator.pop(context); // Close drawer
                  // Navigate to detailed article page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleDetailPage(
                        articleTitle: article['title']!,
                        articleContent: article['content']!,
                        plantCare: article['plantCare']!,
                        plantDescription: article['description']!,
                        imageUrl: article['imageUrl']!,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
