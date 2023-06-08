import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moonshine_fe/apis/bar_api.dart';
import 'package:moonshine_fe/apis/cocktail_api.dart';
import 'package:searchfield/searchfield.dart';

class BlogPostSelect extends StatefulWidget {
  final int type;
  const BlogPostSelect({
    super.key,
    required this.type,
  });

  @override
  State<BlogPostSelect> createState() => _BlogPostSelectState();
}

class _BlogPostSelectState extends State<BlogPostSelect> {
  final Future<List<Map<String, dynamic>>> cocktailList =
      CocktailApi.getCocktailList();
  final Future<List<Map<String, dynamic>>> barList = BarApi.getBarList();
  double _tempRating = 3.0;
  Map<String, dynamic> _mainSelection = {};
  Map<String, dynamic> _tempSelection = {};
  List<Map<dynamic, double>> ratingList = [];

  void _showDialog(bool isBar) {
    if (ratingList.length == 10) {
      return;
    }
    if (isBar) {
      // Bar Select Dialog
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('바 추가하기'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder(
                future: barList,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return SearchField(
                      itemHeight: 50,
                      hint: '바',
                      onSuggestionTap: (value) {
                        // print(value.item);
                        setState(() {
                          _tempSelection = value.item!;
                        });
                      },
                      suggestions: snapshot.data!
                          .map(
                            (item) => SearchFieldListItem(
                              item['name'],
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
                              item: item,
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
              RatingBar.builder(
                minRating: 1,
                initialRating: 3,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5,
                ),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _tempRating = rating;
                  });
                },
              ),
            ],
          ),
          actions: [
            MaterialButton(
              textColor: Colors.black,
              child: const Text('취소'),
              onPressed: () {
                setState(() {
                  _tempSelection = {};
                  _tempRating = 3.0;
                });
                print(ratingList);
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              textColor: Colors.black,
              child: const Text('추가'),
              onPressed: () {
                if (_tempSelection.isNotEmpty) {
                  setState(() {
                    ratingList.add({
                      _tempSelection: _tempRating,
                    });
                    _tempSelection = {};
                    _tempRating = 3.0;
                  });
                  print(ratingList);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      );
    } else {
      // Cocktail Select Dialog
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('칵테일 추가하기'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder(
                future: cocktailList,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return SearchField(
                      itemHeight: 50,
                      hint: '칵테일',
                      onSuggestionTap: (value) {
                        // print(value.item);
                        setState(() {
                          _tempSelection = value.item!;
                        });
                      },
                      suggestions: snapshot.data!
                          .map(
                            (item) => SearchFieldListItem(
                              item['name'],
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
                              item: item,
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
              RatingBar.builder(
                minRating: 1,
                initialRating: 3,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5,
                ),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _tempRating = rating;
                  });
                },
              ),
            ],
          ),
          actions: [
            MaterialButton(
              textColor: Colors.black,
              child: const Text('취소'),
              onPressed: () {
                setState(() {
                  _tempSelection = {};
                  _tempRating = 3.0;
                });
                print(ratingList);
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              textColor: Colors.black,
              child: const Text('추가'),
              onPressed: () {
                if (_tempSelection.isNotEmpty) {
                  setState(() {
                    ratingList.add({
                      _tempSelection: _tempRating,
                    });
                    _tempSelection = {};
                    _tempRating = 3.0;
                  });
                  print(ratingList);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case 1:
        // Bar Blog Post
        return Column(
          children: [
            FutureBuilder(
              future: barList,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return SearchField(
                    itemHeight: 50,
                    hint: '바',
                    onSuggestionTap: (value) {
                      setState(() {
                        _mainSelection = value.item!;
                      });
                      print(_mainSelection);
                    },
                    suggestionAction: SuggestionAction.unfocus,
                    suggestions: snapshot.data!
                        .map(
                          (item) => SearchFieldListItem(
                            item['name'],
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
                            item: item,
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Container();
                }
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                for (var rating in ratingList)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(rating.keys.first['name']),
                        Expanded(
                          child: Container(),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 14,
                            ),
                            Text('${rating.values.first.toString()} / 5.0'),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  // vertical: 10,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => _showDialog(false),
                      child: SizedBox(
                        height: 50,
                        width: 100,
                        child: Container(
                          color: Colors.black12,
                          child: const Center(
                            child: Text('칵테일 추가'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );

      case 2:
        // Cocktail Blog Post
        return Column(
          children: [
            FutureBuilder(
              future: cocktailList,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return SearchField(
                    itemHeight: 50,
                    hint: '칵테일',
                    onSuggestionTap: (value) {
                      setState(() {
                        _mainSelection = value.item!;
                      });
                      print(_mainSelection);
                    },
                    suggestionAction: SuggestionAction.unfocus,
                    suggestions: snapshot.data!
                        .map(
                          (item) => SearchFieldListItem(
                            item['name'],
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
                            item: item,
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Container();
                }
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                for (var rating in ratingList)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(rating.keys.first['name']),
                        Expanded(
                          child: Container(),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 14,
                            ),
                            Text('${rating.values.first.toString()} / 5.0'),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  // vertical: 10,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => _showDialog(true),
                      child: SizedBox(
                        height: 50,
                        width: 100,
                        child: Container(
                          color: Colors.black12,
                          child: const Center(
                            child: Text('바 추가'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );

      case 3:
        // Recipe Blog Post
        return Column(
          children: [
            FutureBuilder(
              future: cocktailList,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return SearchField(
                    itemHeight: 50,
                    hint: '칵테일',
                    onSuggestionTap: (value) {
                      setState(() {
                        _mainSelection = value.item!;
                      });
                      print(_mainSelection);
                    },
                    suggestionAction: SuggestionAction.unfocus,
                    suggestions: snapshot.data!
                        .map(
                          (item) => SearchFieldListItem(
                            item['name'],
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
                            item: item,
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Container();
                }
              }),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
