import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/screens/account_setting_screen.dart';

import 'package:moonshine_fe/screens/bar_tab_screen.dart';
import 'package:moonshine_fe/screens/blog_tab_screen.dart';
import 'package:moonshine_fe/screens/cocktail_tab_screen.dart';
import 'package:moonshine_fe/config.dart' as globals;

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
            BarTabScreen(
              geolocation: geolocation,
            ),
            CocktailTabScreen(
              geolocation: geolocation,
            ),
            BlogTabScreen(
              geolocation: geolocation,
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(globals.userName),
              accountEmail: const Text(''),
              // currentAccountPicture: const CircleAvatar(),
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountSettingScreen(),
                  ),
                );
                setState(() {});
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Text('Account Settings'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Text('Favorite Bars'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Text('Favorite Cocktails'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Text('My Blog'),
            ),
          ],
        ),
      ),
    );
  }
}
