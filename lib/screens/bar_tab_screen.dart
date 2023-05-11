import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_project.dart';
import 'package:moonshine_fe/widgets/bar_tab_item_widget.dart';

class BarTabScreen extends StatelessWidget {
  BarTabScreen({super.key});

  final Future<List<Map<String, String>>> barList = DiffordsGuide.getBarList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: barList,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.length ~/ 2,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            physics: const BouncingScrollPhysics(),
            separatorBuilder: ((context, index) {
              return const SizedBox(
                height: 0,
              );
            }),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BarTabItem(
                    imgUrl: snapshot.data![index * 2]['imgUrl']!,
                    name: snapshot.data![index * 2]['name']!,
                  ),
                  BarTabItem(
                    imgUrl: snapshot.data![index * 2 + 1]['imgUrl']!,
                    name: snapshot.data![index * 2 + 1]['name']!,
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
