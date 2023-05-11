import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_project.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/widgets/bar_tab_item_widget.dart';

class BarTabScreen extends StatefulWidget {
  final Geolocation geolocation;
  const BarTabScreen({super.key, required this.geolocation});

  @override
  State<BarTabScreen> createState() => _BarTabScreenState();
}

class _BarTabScreenState extends State<BarTabScreen> {
  final Future<List<Map<String, String>>> barList = DiffordsGuide.getBarList();
  String? currentAddress;

  void getLocation() async {
    await widget.geolocation.getAddressFromLatLng().then((address) {
      currentAddress = address;
    });
    setState(() {});
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

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
              // print(index);
              if (index == 0) {
                return SizedBox(
                  height: 40,
                  child: Column(
                    children: [
                      const Text('Search'),
                      Text(
                        (currentAddress != null) ? currentAddress! : '',
                      ),
                    ],
                  ),
                );
              }
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
