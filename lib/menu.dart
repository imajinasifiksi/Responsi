import 'package:flutter/material.dart';
import 'news.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                "https://static.republika.co.id/files/images/logo.png",),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(context, "Terbaru"),
                  const SizedBox(
                    width: 20,
                  ),
                  button(context, "Daerah"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(context, "Internasional"),
                  const SizedBox(
                    width: 20,
                  ),
                  button(context, "Islam"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox button(BuildContext context, String category) {
    return SizedBox(
      width: 160,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => News(
                category: category,
              ),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        child: Text(
          category.toUpperCase(),
        ),
      ),
    );
  }
}