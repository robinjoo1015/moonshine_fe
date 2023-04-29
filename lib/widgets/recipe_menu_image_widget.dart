import 'package:flutter/widgets.dart';

import '../apis/cocktail_project.dart';

class RecipeMenuImage extends StatelessWidget {
  final Map<String, dynamic> detail;
  const RecipeMenuImage({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final size = constraints.maxWidth;
              return SizedBox(
                height: size,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(
                    parent: ClampingScrollPhysics(),
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: size,
                      width: size,
                      child: Image.network(
                        CocktailProject.baseUrl + detail['imgList'][index % 3],
                        width: size,
                        height: size,
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
