import 'package:flutter/material.dart';
import 'package:moonshine_fe/widgets/blog_tab_image_list_widget.dart';

class BlogTabScreen extends StatefulWidget {
  const BlogTabScreen({super.key});

  @override
  State<BlogTabScreen> createState() => _BlogTabScreenState();
}

class _BlogTabScreenState extends State<BlogTabScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this,
      animationDuration: Duration.zero,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: TabBar(
            labelStyle: TextStyle(
              fontFamily: Theme.of(context).textTheme.titleMedium!.fontFamily,
              fontSize: 14,
              color: Colors.black,
            ),
            indicatorColor: Colors.black,
            // indicator: const Decoration(),
            tabs: const [
              SizedBox(
                height: 20,
                child: Tab(
                  height: 20,
                  child: Text(
                    '#Bar',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                child: Tab(
                  height: 20,
                  child: Text(
                    '#Cocktail',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                child: Tab(
                  height: 20,
                  child: Text(
                    '#Recipe',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                child: Tab(
                  height: 20,
                  child: Text(
                    '#Free',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
            controller: _tabController,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              BlogTabImageList(),
              BlogTabImageList(),
              BlogTabImageList(),
              BlogTabImageList(),
            ],
          ),
        ),
      ],
    );
  }
}
