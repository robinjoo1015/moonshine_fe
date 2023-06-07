class BlogDummyApi {
  static Future<List<Map<String, dynamic>>> getBarBlogList() async {
    List<Map<String, dynamic>> barBlogList = [];
    barBlogList.add({
      'thumb': 'assets/image/1.jpg',
      'title': 'BarBlogTitle1',
      'id': 0,
    });
    barBlogList.add({
      'thumb': 'assets/image/1.jpg',
      'title': 'BarBlogTitle2',
      'id': 1,
    });
    return barBlogList;
  }

  static Future<List<Map<String, dynamic>>> getCocktailBlogList() async {
    List<Map<String, dynamic>> cocktailBlogList = [];
    cocktailBlogList.add({
      'thumb': 'assets/image/2.jpg',
      'title': 'CocktailBlogTitle1',
      'id': 2,
    });
    cocktailBlogList.add({
      'thumb': 'assets/image/2.jpg',
      'title': 'CocktailBlogTitle2',
      'id': 3,
    });
    return cocktailBlogList;
  }

  static Future<List<Map<String, dynamic>>> getRecipeBlogList() async {
    List<Map<String, dynamic>> recipeBlogList = [];
    recipeBlogList.add({
      'thumb': 'assets/image/3.jpg',
      'title': 'RecipeBlogTitle1',
      'id': 4,
    });
    recipeBlogList.add({
      'thumb': 'assets/image/3.jpg',
      'title': 'RecipeBlogTitle2',
      'id': 5,
    });
    return recipeBlogList;
  }

  static Future<List<Map<String, dynamic>>> getFreeBlogList() async {
    List<Map<String, dynamic>> freeBlogList = [];
    freeBlogList.add({
      // 'thumb': 'assets/blogthumb.png',
      'title': 'FreeBlogTitle1',
      'id': 0,
    });
    freeBlogList.add({
      // 'thumb': 'assets/blogthumb.png',
      'title': 'FreeBlogTitle2',
      'id': 1,
    });
    return freeBlogList;
  }
}
