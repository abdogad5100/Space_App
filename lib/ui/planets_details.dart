import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_app/core/resources/AssetsManger.dart';
import 'package:space_app/core/widgets/CustomAppBar.dart';
import 'package:space_app/ui/model/planet_model.dart';

class PlanetDetails extends StatelessWidget {
  final Planet planet;

  const PlanetDetails({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomAppBar(
                  title: planet.name,
                  body: "${planet.title}",
                  bodyAlignment: Alignment.bottomLeft,
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(Assetsmanger.backward_ic),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 400,
                  child: Flutter3DViewer(
                    src: "assets/models/${planet.model3D}",
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "About",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  planet.about,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),

                const SizedBox(height: 10),

                Text(
                  "Distance from Sun (km): ${planet.distanceFromSun}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Length of Day (hours): ${planet.lengthOfDay}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Orbital Period (Earth years): ${planet.orbitalPeriod}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Radius (km): ${planet.radius}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Mass (kg): ${planet.mass}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Gravity (m/s²): ${planet.gravity}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Surface Area (km²): ${planet.surfaceArea}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
