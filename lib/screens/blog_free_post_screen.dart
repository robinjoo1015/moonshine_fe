import 'package:flutter/material.dart';

class BlogFreePostScreen extends StatelessWidget {
  final int type;
  const BlogFreePostScreen({
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      // vertical: 10,
                      horizontal: 10,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '내용',
                      ),
                      expands: true,
                      maxLines: null,
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
