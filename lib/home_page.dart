import 'package:flutter/material.dart';
import 'package:space_app/core/widgets/RedBtn.dart';

import 'core/resources/AssetsManger.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: AlignmentGeometry.centerLeft,
          children: [
            Image.asset(Assetsmanger.planet),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  "Explore The Universe",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 16,
              right: 16,
              child: Redbtn(title: "Explore"),
            ),
          ],
        ),
      ),
    );
  }
}
