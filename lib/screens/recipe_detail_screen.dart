import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_project.dart';
import 'package:moonshine_fe/widgets/recipe_menu_chart_widget.dart';
import 'package:moonshine_fe/widgets/recipe_menu_image_widget.dart';

class RecipeDetailScreen extends StatefulWidget {
  final String name;
  const RecipeDetailScreen({
    super.key,
    required this.name,
  });

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late Future<Map<String, dynamic>> detail;

  @override
  void initState() {
    super.initState();
    detail = CocktailProject.getDetail(widget.name);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(widget.name),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
            )
          ];
        },
        body: FutureBuilder(
          future: detail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    RecipeMenuImage(detail: snapshot.data!),
                    RecipeMenuChart(name: widget.name),
                    Row()
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  widget.name,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
