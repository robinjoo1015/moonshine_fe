import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/geolocation.dart';

import 'package:moonshine_fe/screens/bar_tab_screen.dart';
import 'package:moonshine_fe/screens/blog_tab_screen.dart';
import 'package:moonshine_fe/screens/cocktail_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late Geolocation geolocation;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      animationDuration: Duration.zero,
    );
    geolocation = Geolocation();
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
                    text: '#Bar',
                    // icon: Icon(Icons.map_outlined),
                  ),
                  Tab(
                    text: '#Cocktail',
                    // icon: Icon(Icons.comment_bank_outlined),
                  ),
                  Tab(
                    text: '#Blog',
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
          physics: const NeverScrollableScrollPhysics(),
          children: [
            BarTabScreen(geolocation: geolocation),
            CocktailTabScreen(),
            const BlogTabScreen(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text('AccountName'),
              accountEmail: Text('AccountEmail'),
              currentAccountPicture: CircleAvatar(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Text('Account Settings'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Text('Favorites'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Text('My Bar Blog'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Text('My Cocktail Blog'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Text('My Recipe Blog'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Text('My Free Blog'),
            ),
          ],
        ),
      ),
    );
  }
}
