import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skipee/features/panels/security_panel/presentation/manager/security_panel_view_model.dart';

import '../../../../../app/globals.dart';
import '../widgets/security_panel_content.dart';

class SecurityPanel extends StatefulWidget {
  const SecurityPanel({Key? key}) : super(key: key);

  static const routeName = 'security-panel';

  @override
  State<SecurityPanel> createState() => _SecurityPanelState();
}

class _SecurityPanelState extends State<SecurityPanel> {
  final SecurityPanelViewModel _viewModel = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider.value(
        value: _viewModel,
        builder: (context, child) {
          return const SecurityPanelContent();
        },
      ),
    );
  }
}
