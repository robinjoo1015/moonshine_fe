import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_project.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/widgets/bar_tab_item_widget.dart';
import 'package:searchfield/searchfield.dart';

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
          List<String> names = [];
          for (var item in snapshot.data!) {
            names.add(item['name']!);
          }
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
                return Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Text('추천순'),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: SearchField(
                              itemHeight: 40,
                              maxSuggestionsInViewPort: 8,
                              focusNode: FocusNode(
                                skipTraversal: true,
                              ),
                              suggestionState: Suggestion.hidden,
                              suggestionAction: SuggestionAction.unfocus,
                              scrollbarAlwaysVisible: false,
                              searchInputDecoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                              suggestions: names
                                  .map((name) => SearchFieldListItem(
                                        name,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(name),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.search_outlined,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      child: Center(
                        child: Text(
                          (currentAddress != null) ? currentAddress! : '',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BarTabItem(
                          imgUrl: snapshot.data![0]['imgUrl']!,
                          name: snapshot.data![0]['name']!,
                        ),
                        BarTabItem(
                          imgUrl: snapshot.data![1]['imgUrl']!,
                          name: snapshot.data![1]['name']!,
                        ),
                      ],
                    )
                  ],
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
