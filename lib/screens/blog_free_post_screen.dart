import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moonshine_fe/apis/blog_api.dart';
import 'package:moonshine_fe/config.dart' as globals;

class BlogFreePostScreen extends StatefulWidget {
  final int type;

  const BlogFreePostScreen({
    super.key,
    required this.type,
  });

  @override
  State<BlogFreePostScreen> createState() => _BlogFreePostScreenState();
}

class _BlogFreePostScreenState extends State<BlogFreePostScreen> {
  String content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        actions: [
          IconButton(
            onPressed: () async {
              var response = await http.post(
                Uri.parse('${globals.baseUrl}/blog/4/create'),
                headers: <String, String>{
                  "Content-Type": "application/json; charset=UTF-8",
                },
                body: jsonEncode({
                  "user_id": globals.userId,
                  "content": content,
                }),
              );
              var responseJson = jsonDecode(response.body);
              if (responseJson['status'] == 200) {
                Navigator.pop(context, responseJson['blogId']);
              }
            },
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final height = constraints.maxHeight;
                return SizedBox(
                  height: height - 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      // vertical: 10,
                      horizontal: 10,
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: '내용',
                      ),
                      expands: true,
                      maxLines: null,
                      onChanged: (value) {
                        setState(() {
                          content = value;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Column(
                children: const [],
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
