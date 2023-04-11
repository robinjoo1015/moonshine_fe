import 'package:flutter/material.dart';
import 'package:moonshine_fe/screens/recipe_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      animationDuration: Duration.zero,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.wine_bar_outlined,
                  ),
                  Text(
                    'MoonShine',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily:
                          Theme.of(context).textTheme.titleLarge!.fontFamily,
                    ),
                  ),
                ],
              ),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              pinned: false,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                labelStyle: TextStyle(
                  fontFamily:
                      Theme.of(context).textTheme.titleMedium!.fontFamily,
                  fontSize: 16,
                ),
                tabs: const [
                  Tab(
                    text: '#Map',
                    // icon: Icon(Icons.map_outlined),
                  ),
                  Tab(
                    text: '#Blog',
                    // icon: Icon(Icons.comment_bank_outlined),
                  ),
                  Tab(
                    text: '#Recipe',
                    // icon: Icon(Icons.wine_bar_outlined),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            const Text('Map Page'),
            const Text('Blog Page'),
            RecipeTabScreen(),
          ],
        ),
      ),
    );
  }
}
