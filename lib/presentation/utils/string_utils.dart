
String capitalize(String s) {
  if (s.isEmpty) return s;
  return s[0].toUpperCase() + s.substring(1);
}

String formattPokedexIndex(int index) {
  return '#${index.toString().padLeft(3, '0')}';
}

String getIDfromURL(String url) {
  final uri = Uri.parse(url);
  return uri.pathSegments[uri.pathSegments.length - 2];
}