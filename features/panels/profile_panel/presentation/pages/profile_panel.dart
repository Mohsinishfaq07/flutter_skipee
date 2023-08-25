import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skipee/features/panels/profile_panel/presentation/manager/profile_panel_view_model.dart';
import 'package:skipee/features/panels/profile_panel/presentation/widgets/profile_panel_content.dart';

import '../../../../../app/globals.dart';

class ProfilePanel extends StatefulWidget {
  const ProfilePanel({Key? key}) : super(key: key);

  static const routeName = 'profile-panel';

  @override
  State<ProfilePanel> createState() => _ProfilePanelState();
}

class _ProfilePanelState extends State<ProfilePanel> {
  final ProfilePanelViewModel _viewModel = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider.value(
        value: _viewModel,
        builder: (context, child) {
          return const ProfilePanelContent();
        },
      ),
    );
  }
}
