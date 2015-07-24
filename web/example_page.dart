import 'package:squares/squares.dart';
import 'package:squares/squares_browser.dart';
import 'dart:html';

void main() {
  initTilesBrowserConfiguration();
  mountComponent((div(props: {'class': 'test test-2'}))(div(), div()), querySelector('#dart-part'));
}