class BlogDummyApi {
  static Future<List<Map<String, dynamic>>> getBarBlogList() async {
    List<Map<String, dynamic>> barBlogList = [];
    barBlogList.add({
      'thumb': 'assets/blogthumb.png',
      'title': 'BarBlogTitle',
      'id': 'ID',
    });
    return barBlogList;
  }

  static Future<List<Map<String, dynamic>>> getCocktailBlogList() async {
    List<Map<String, dynamic>> cocktailBlogList = [];
    cocktailBlogList.add({
      'thumb': 'assets/blogthumb.png',
      'title': 'CocktailBlogTitle',
      'id': 'ID',
    });
    return cocktailBlogList;
  }

  static Future<List<Map<String, dynamic>>> getRecipeBlogList() async {
    List<Map<String, dynamic>> recipeBlogList = [];
    recipeBlogList.add({
      'thumb': 'assets/blogthumb.png',
      'title': 'RecipeBlogTitle',
      'id': 'ID',
    });
    return recipeBlogList;
  }

  static Future<List<Map<String, dynamic>>> getFreeBlogList() async {
    List<Map<String, dynamic>> freeBlogList = [];
    freeBlogList.add({
      // 'thumb': 'assets/blogthumb.png',
      'title': 'FreeBlogTitle',
      'id': 'ID',
    });
    return freeBlogList;
  }
}
