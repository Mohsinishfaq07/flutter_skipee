import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skipee/features/panels/menu_panel/presentation/widgets/menu_panel_content.dart';
import 'package:skipee/features/panels/preference_panel/presentation/manager/preference_panel_view_model.dart';

import '../../../../../app/globals.dart';

class MenuPanel extends StatefulWidget {
  const MenuPanel({Key? key}) : super(key: key);

  static const routeName = 'menu-panel';

  @override
  State<MenuPanel> createState() => _MenuPanelState();
}

class _MenuPanelState extends State<MenuPanel> {
  final PreferencePanelViewModel _viewModel = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider.value(
        value: _viewModel,
        builder: (context, child) {
          return const MenuPanelContent();
        },
      ),
    );
  }
}
