import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skipee/features/panels/preference_panel/presentation/manager/preference_panel_view_model.dart';
import 'package:skipee/features/panels/preference_panel/presentation/widgets/preference_panel_content.dart';

import '../../../../../app/globals.dart';

class PreferencePanel extends StatefulWidget {
  const PreferencePanel({Key? key}) : super(key: key);

  static const routeName = 'preference-panel';

  @override
  State<PreferencePanel> createState() => _PreferencePanelState();
}

class _PreferencePanelState extends State<PreferencePanel> {
  final PreferencePanelViewModel _viewModel = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider.value(
        value: _viewModel,
        builder: (context, child) {
          return const PreferencePanelContent();
        },
      ),
    );
  }
}
