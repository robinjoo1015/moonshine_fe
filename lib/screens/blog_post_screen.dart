import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moonshine_fe/apis/blog_api.dart';
import 'package:moonshine_fe/widgets/blog_post_select_widget.dart';

class BlogPostScreen extends StatefulWidget {
  final int type;
  const BlogPostScreen({
    super.key,
    required this.type,
  });

  @override
  State<BlogPostScreen> createState() => _BlogPostScreenState();
}

class _BlogPostScreenState extends State<BlogPostScreen> {
  Map<String, dynamic> selectionData = {};
  String title = '';
  String content = '';
  final ImagePicker _picker = ImagePicker();
  List<String> imagePathList = [];

  void updateData(Map<String, dynamic> dataChild) {
    setState(() {
      selectionData = dataChild;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.type);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        actions: [
          IconButton(
            onPressed: () async {
              if (imagePathList.isEmpty || imagePathList.length > 10) {
                return;
              }
              print(imagePathList);
              var imageResponse = await BlogApi.createImage(imagePathList);
              if (imageResponse.isEmpty) {
                return;
              } else {
                Map<String, String> postData = {};
                postData['title'] = title;
                postData['content'] = content;
                Map<String, String> selectionDataNew = {
                  'mainSelection':
                      selectionData['mainSelection']['id'].toString(),
                };
                List<Map<String, String>> ratingListNew = [];
                for (var rating in selectionData['ratingList']) {
                  ratingListNew.add({
                    'id': rating.keys.first['id'].toString(),
                    'rating': rating[rating.keys.first].toString(),
                  });
                }
                selectionDataNew['ratingList'] = jsonEncode(ratingListNew);
                postData['selectionData'] = jsonEncode(selectionDataNew);
                postData['images'] = imageResponse;
                postData['thumbnail'] =
                    imageResponse.split(',')[0].substring(1);

                final responseDecode =
                    await BlogApi.createPost(widget.type, postData);
                // print(responseDecode);
                if (responseDecode == -1) {
                  print(responseDecode);
                } else {
                  if (responseDecode['status'] == 200) {
                    Navigator.pop(context, responseDecode['blogId']);
                  }
                }
              }
            },
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: '제목',
                  ),
                  onChanged: (value) {
                    setState(() {
                      title = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                // vertical: 10,
                horizontal: 10,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: '내용',
                ),
                // expands: true,
                maxLines: null,
                onChanged: (value) {
                  setState(() {
                    content = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: BlogPostSelect(
                type: widget.type,
                callback: updateData,
              ),
            ),
            Column(
              children: [
                for (int i = 0; i < (imagePathList.length ~/ 3) + 1; i++)
                  Row(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final size = constraints.maxWidth;
                            return Row(
                              children: [
                                for (int j = 0; j < 3; j++)
                                  Expanded(
                                    child: (imagePathList.length > i * 3 + j)
                                        ? Image(
                                            image: FileImage(
                                              File(
                                                imagePathList[i * 3 + j],
                                              ),
                                            ),
                                            width: size / 3,
                                            height: size / 3,
                                            fit: BoxFit.cover,
                                          )
                                        : Container(),
                                  )
                              ],
                            );
                          },
                        ),
                      ),
                      // for (int j = 0; j < 3; j++)
                      //   Expanded(
                      //     child: (imagePathList.length > i * 3 + j)
                      //         ? Image(
                      //             image: FileImage(
                      //               File(
                      //                 imagePathList[i * 3 + j],
                      //               ),
                      //             ),
                      //           )
                      //         : Container(),
                      // )
                    ],
                  ),
              ],
            ),
            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final List<XFile> images =
                            await _picker.pickMultiImage();
                        // print(images[0].path);
                        imagePathList = [];
                        for (var image in images) {
                          imagePathList.add(image.path);
                        }
                        setState(() {});
                      },
                      child: SizedBox(
                        height: 50,
                        width: 100,
                        child: Container(
                          color: Colors.black12,
                          child: const Center(
                            child: Text('사진 추가'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
