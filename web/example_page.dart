import 'package:avd/tiles_browser.dart';
import 'package:avd/tiles.dart';
import 'dart:html';

void main() {
  initTilesBrowserConfiguration();
  mountComponent((div(props: {'class': 'test test-2'}))(div(), div()), querySelector('#dart-part'));
}