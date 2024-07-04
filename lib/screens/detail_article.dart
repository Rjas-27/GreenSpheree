import 'package:flutter/material.dart';

class ArticleDetailPage extends StatefulWidget {
  final String articleTitle;
  final String articleContent;
  final String plantCare;
  final String plantDescription;
  final String imageUrl;

  const ArticleDetailPage({
    required this.articleTitle,
    required this.articleContent,
    required this.plantCare,
    required this.plantDescription,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  List<String> comments = [];

  void addComment(String comment) {
    setState(() {
      comments.add(comment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.articleTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.network(widget.imageUrl, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              widget.articleContent,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plant Description',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(widget.plantDescription),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Care Instructions',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(widget.plantCare),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Comments',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CommentSection(
              comments: comments,
              onCommentSubmitted: addComment,
            ),
          ],
        ),
      ),
    );
  }
}

class CommentSection extends StatefulWidget {
  final List<String> comments;
  final Function(String) onCommentSubmitted;

  const CommentSection({
    required this.comments,
    required this.onCommentSubmitted,
    Key? key,
  }) : super(key: key);

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _controller = TextEditingController();

  void _submitComment() {
    if (_controller.text.isNotEmpty) {
      widget.onCommentSubmitted(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var comment in widget.comments)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(comment),
              ),
            ),
          ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add a comment...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: _submitComment,
            ),
          ],
        ),
      ],
    );
  }
}
