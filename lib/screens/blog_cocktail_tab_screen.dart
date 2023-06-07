import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/blog_api.dart';
import 'package:moonshine_fe/widgets/blog_tab_image_list_widget.dart';

class BlogCocktailTabScreen extends StatelessWidget {
  BlogCocktailTabScreen({super.key});
  final Future<List<Map<String, dynamic>>> cocktailBlogList =
      BlogDummyApi.getCocktailBlogList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cocktailBlogList,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.length ~/ 2,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 0,
              );
            },
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlogTabImageList(
                    id: snapshot.data![index * 2]['id']!,
                    imgUrl: snapshot.data![index * 2]['thumb'],
                    name: snapshot.data![index * 2]['title'],
                  ),
                  BlogTabImageList(
                    id: snapshot.data![index * 2 + 1]['id']!,
                    imgUrl: snapshot.data![index * 2 + 1]['thumb'],
                    name: snapshot.data![index * 2 + 1]['title'],
                  ),
                ],
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
