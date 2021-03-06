import 'package:buck/bundle/menu.dart';
import 'package:buck_demo/menus/bundle_liquid_exchange/pages/material_step.dart';
import 'package:flutter/material.dart';

class BundleLiquidExchange extends StatelessMenu {
  @override
  Widget get icon => Icon(Icons.wifi_tethering, color: Colors.lightBlue);

  @override
  String get id => 'liquid_exchange';

  @override
  int get sort => 2;

  @override
  String get cnName => 'Exchange';

  @override
  Widget build(BuildContext context) {
    return Main();
  }
}
