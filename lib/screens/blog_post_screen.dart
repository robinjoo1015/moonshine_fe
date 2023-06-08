import 'package:flutter/material.dart';
import 'package:moonshine_fe/widgets/blog_post_select_widget.dart';

class BlogPostScreen extends StatelessWidget {
  final int type;
  const BlogPostScreen({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    print(type);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '제목',
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                // vertical: 10,
                horizontal: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '내용',
                ),
                // expands: true,
                maxLines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: BlogPostSelect(
                type: type,
              ),
            ),
            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: Container(
                        color: Colors.black12,
                        child: const Center(
                          child: Text('사진 추가'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
