import 'package:flutter/material.dart';

import '../../core/router/router.dart';
import '../../core/utilities/assets_paths.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.bookDetailsViewRoute);
      },
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AssetPath.bookImage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
