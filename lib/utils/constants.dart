class Constants {
  static String TOP_HEADLINES_URL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=YOUR_KEY";

  static String headLinesFor(String keyword) {
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=YOUR_KEY";
  }
}
