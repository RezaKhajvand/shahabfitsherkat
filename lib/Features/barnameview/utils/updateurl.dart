import 'dart:html' as html;

void updatePageUrl(int page) {
  final uri = Uri.parse(html.window.location.toString());
  final updatedQueryParams = Map<String, String>.from(uri.queryParameters);
  updatedQueryParams["tabIndex"] = page.toString();
  final newUri = uri.replace(queryParameters: updatedQueryParams);
  html.window.history.pushState(null, '', newUri.toString());
}
