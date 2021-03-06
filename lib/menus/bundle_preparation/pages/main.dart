import 'package:buck_demo/menus/bundle_preparation/pages/Initial_inspection_step.dart';
import 'package:buck_demo/menus/bundle_preparation/pages/material_step.dart';
import 'package:buck_demo/menus/bundle_preparation/pages/preparation_step.dart';
import 'package:buck_demo/menus/bundle_preparation/widgets/step_tab.dart';
import 'package:buck/bundle/menu.dart';
import 'package:buck/widgets/scaffold/chromatic_app_bar.dart';
import 'package:buck/widgets/scaffold/chromatic_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Main extends StatefulMenu {
  @override
  String get cnName => 'Preparation';

  @override
  Widget get icon => Icon(Icons.palette, color: Colors.redAccent,);

  @override
  String get id => 'preparation';

  @override
  int get sort => 1;

  @override
  State<StatefulWidget> createState() => BundlePreparationState();
}

class BundlePreparationState extends State<Main> with SingleTickerProviderStateMixin {
  int _stepIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChromaticScaffold(
      body: Card(
        elevation: 3.0,
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: DefaultTabController(
          child: new LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return Column(
                children: <Widget>[_buildTabBar(), _buildForm(viewportConstraints)],
              );
            },
          ),
          length: 3,
        ),
      ),
      chromaticAppBar: ChromaticAppBar('Preparation'),
    );
  }

  Widget _buildTabBar({bool showFirstOption}) {
    return Stack(
      children: <Widget>[
        new Positioned.fill(
          top: null,
          child: new Container(
            height: 2.0,
            color: new Color(0xFFEEEEEE),
          ),
        ),
        new Row(
          children: [
            StepTab(
              text: "Preparation",
              selected: _stepIndex == 0,
            ),
            StepTab(
              text: "Initial",
              selected: _stepIndex == 1,
            ),
            StepTab(
              text: "Cleaning",
              selected: _stepIndex == 2,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildForm(BoxConstraints viewportConstraints) {
    switch (_stepIndex) {
      case 0:
        return MaterialStep(viewportConstraints, () => this.setState(() => _stepIndex = 1));
      case 1:
        return InitialInspectionStep(viewportConstraints, () => this.setState(() => _stepIndex = 0), () => this.setState(() => _stepIndex = 2));
      case 2:
        return PreparationStep(viewportConstraints, () => this.setState(() => _stepIndex = 1), () => this.setState(() => _stepIndex = 0));
      default:
        return null;
    }
  }
}
