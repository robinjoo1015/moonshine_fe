import 'package:flutter/material.dart';

class BarDetailScreen extends StatelessWidget {
  final String name, url;
  const BarDetailScreen({
    super.key,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(name),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border_outlined),
                ),
              ],
            )
          ];
        },
        body: Container(
          child: const Center(
            child: Text('BarDetailScreen'),
          ),
        ),
      ),
    );
  }
}
