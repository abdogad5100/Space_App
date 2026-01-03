import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/AssetsManger.dart';

class Redbtn extends StatelessWidget {
  final String title;

  const Redbtn({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SvgPicture.asset(Assetsmanger.forward_ic),
          ],
        ),
      ),
    );
  }
}
