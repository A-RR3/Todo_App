import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget extends StatelessWidget {
  IconWidget({super.key, required this.path, this.press, this.size});
  final String? path;
  final VoidCallback? press;
  final double? size;
 

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: press,
      icon:
          // ColorFiltered(
          // colorFilter: const ColorFilter.mode(
          //     Colors.white, BlendMode.srcIn), // Set the color and blend mode
          SvgPicture.asset(path!,),
      iconSize: size ?? 40.0,
    );
  }
}
