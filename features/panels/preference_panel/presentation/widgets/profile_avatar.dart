import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({required this.fullName, required this.image, Key? key}) : super(key: key);

  final String fullName;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: 'PROFILE_AVATAR',
          child: SimpleShadow(
            opacity: 0.6,
            color: Colors.black12,
            offset: const Offset(0, 0),
            sigma: 10,
            child: CircleAvatar(
              radius: 40.r,
              backgroundColor: Colors.grey.withOpacity(0.31),
              backgroundImage: image,
            ),
          ),
        ),
        SizedBox(width: 22.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(fullName, style: Theme.of(context).textTheme.headline6?.copyWith(color: Theme.of(context).primaryColor)),
            const Text('Active', style: TextStyle(color: Colors.green)),
          ],
        ),
      ],
    );
  }
}
