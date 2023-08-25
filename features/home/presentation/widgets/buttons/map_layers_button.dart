import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../../pages/map_types_bottom_sheet.dart';
import '../../manager/home_view_model.dart';

class MapLayersButton extends StatelessWidget {
  const MapLayersButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 22.w,
      bottom: 130.h,
      child: ValueListenableBuilder<bool>(
        valueListenable: context.read<HomeViewModel>().showControlButtonNotifier,
        builder: (_, value, __) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: !value ? _buildButton(context) : const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return SimpleShadow(
      opacity: 0.6,
      color: Colors.black12,
      offset: const Offset(0, 3),
      sigma: 10,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: () async {
          final mapTypesBottomSheet = MapTypesBottomSheet(context);
          await mapTypesBottomSheet.show();
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.w),
          child: SvgPicture.asset(AppAssets.layersSvg),
        ),
      ),
    );
  }
}
