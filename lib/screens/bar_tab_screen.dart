import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/bar_api.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/screens/bar_detail_screen.dart';
import 'package:moonshine_fe/screens/map_screen.dart';
import 'package:moonshine_fe/widgets/bar_tab_item_widget.dart';
import 'package:searchfield/searchfield.dart';

class BarTabScreen extends StatefulWidget {
  final Geolocation geolocation;
  const BarTabScreen({
    super.key,
    required this.geolocation,
  });

  @override
  State<BarTabScreen> createState() => _BarTabScreenState();
}

class _BarTabScreenState extends State<BarTabScreen> {
  // final Future<List<Map<String, String>>> barList = DiffordsGuide.getBarList();
  final Future<List<Map<String, dynamic>>> barList = BarApi.getBarList();
  String? currentAddress;

  void getLocation() async {
    await widget.geolocation.getAddressFromLatLng().then((address) {
      currentAddress = address;
    });
    if (mounted) {
      setState(() {});
    }
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
          // List<String> names = [];
          // for (var item in snapshot.data!) {
          //   names.add(item['name']!);
          // }
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: (snapshot.data!.length + 1) ~/ 2,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
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
                        // const SizedBox(
                        //   width: 40,
                        //   height: 40,
                        //   child: Center(
                        //     child: Text('추천순'),
                        //   ),
                        // ),
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
                              suggestions: snapshot.data!
                                  .map((item) => SearchFieldListItem(
                                        item['name'],
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BarDetailScreen(
                                                  id: item['id'],
                                                  name: item['name'],
                                                  geolocation:
                                                      widget.geolocation,
                                                  isFavorite:
                                                      item['is_favorite'],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(item['name']),
                                              ],
                                            ),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              (currentAddress != null) ? currentAddress! : '',
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MapScreen(
                                    geolocation: widget.geolocation,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.map_outlined),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BarTabItem(
                          id: snapshot.data![0]['id']!,
                          imgUrl: snapshot.data![0]['url']!,
                          name: snapshot.data![0]['name']!,
                          // url: snapshot.data![0]['url']!,
                          geolocation: widget.geolocation,
                          isFavorite: snapshot.data![0]['is_favorite']!,
                        ),
                        BarTabItem(
                          id: (snapshot.data!.length == 1)
                              ? -1
                              : snapshot.data![1]['id']!,
                          imgUrl: (snapshot.data!.length == 1)
                              ? ''
                              : snapshot.data![1]['url']!,
                          name: (snapshot.data!.length == 1)
                              ? ''
                              : snapshot.data![1]['name']!,
                          // url: snapshot.data![1]['url']!,
                          geolocation: widget.geolocation,
                          isFavorite: (snapshot.data!.length == 1)
                              ? false
                              : snapshot.data![1]['is_favorite']!,
                        ),
                      ],
                    ),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BarTabItem(
                    id: snapshot.data![index * 2]['id']!,
                    imgUrl: snapshot.data![index * 2]['url']!,
                    name: snapshot.data![index * 2]['name']!,
                    // url: snapshot.data![index * 2]['url']!,
                    geolocation: widget.geolocation,
                    isFavorite: snapshot.data![index * 2]['is_favorite']!,
                  ),
                  BarTabItem(
                    id: (index * 2 + 1 == snapshot.data!.length)
                        ? -1
                        : snapshot.data![index * 2 + 1]['id']!,
                    imgUrl: (index * 2 + 1 == snapshot.data!.length)
                        ? ''
                        : snapshot.data![index * 2 + 1]['url']!,
                    name: (index * 2 + 1 == snapshot.data!.length)
                        ? ''
                        : snapshot.data![index * 2 + 1]['name']!,
                    // url: snapshot.data![index * 2 + 1]['url']!,
                    geolocation: widget.geolocation,
                    isFavorite: (index * 2 + 1 == snapshot.data!.length)
                        ? ''
                        : snapshot.data![index * 2 + 1]['is_favorite']!,
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
