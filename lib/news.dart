import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'list_news_model.dart';

class News extends StatefulWidget {
  final String category;

  const News({super.key, required this.category});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<Post> posts = [];

  Future _getData() async {
    var response = await http.get(
      Uri.parse(
        "https://api-berita-indonesia.vercel.app/republika/${widget.category.toLowerCase()}",
      ),
    );

    NewsListResponse newsListResponse = newsListResponseFromJson(response.body);
    posts.clear();
    posts = newsListResponse.data.posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("REPUBLIKA ${widget.category.toUpperCase()}"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 2 / 3 - 4,
                          child: Text(
                            posts[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1 / 3 - 4,
                          child: Image.network(posts[index].thumbnail),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}