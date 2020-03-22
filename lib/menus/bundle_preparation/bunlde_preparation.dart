import 'package:buck_demo/menus/bundle_preparation/pages/main.dart';
import 'package:buck/bundle/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BundlePreparation extends StatelessMenu {
  @override
  String get cnName => 'Preparation';

  @override
  Widget get icon => Icon(Icons.palette, color: Colors.redAccent);

  @override
  String get id => 'preparation';

  @override
  int get sort => 1;

  @override
  Widget build(BuildContext context) => Main();
}
