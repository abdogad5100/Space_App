import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_app/core/resources/AssetsManger.dart';
import 'package:space_app/core/services/planet_loader.dart';
import 'package:space_app/core/widgets/CustomAppBar.dart';
import 'package:space_app/core/widgets/RedBtn.dart';
import 'package:space_app/ui/model/planet_model.dart';
import 'package:space_app/ui/planets_details.dart';

class PlanetsPage extends StatefulWidget {
  static const String routeName = 'planets';

  @override
  State<PlanetsPage> createState() => _PlanetsPageState();
}

class _PlanetsPageState extends State<PlanetsPage> {
  int currentIndex = 0;
  final List<String> planetImages = [
    Assetsmanger.sun,
    Assetsmanger.earth,
    Assetsmanger.mercury,
    Assetsmanger.venus,
    Assetsmanger.mars,
    Assetsmanger.jupiter,
    Assetsmanger.saturn,
    Assetsmanger.uranus,
    Assetsmanger.neptune,
  ];
  final List<String> planetNames = [
    "Sun",
    "Earth",
    "Mercury",
    "Venus",
    "Mars",
    "Jupiter",
    "Saturn",
    "Uranus",
    "Neptune",
  ];

  final PageController _pageController = PageController();
  late Future<List<Planet>> _planetsFuture;

  @override
  void initState() {
    super.initState();
    _planetsFuture = loadPlanetsFromCsv();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<Planet>>(
        future: _planetsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading planets',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No planets found'));
          }

          final planets = snapshot.data!;

          return Column(
            children: [
              CustomAppBar(
                title: "Explore",
                body: ''' Which planet
 would you Explore? ''',
                bodyAlignment: Alignment.bottomLeft,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: planets.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Image.asset(
                          planetImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(Assetsmanger.backward_ic),
                        onPressed: currentIndex > 0
                            ? () {
                                _pageController.previousPage(
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.easeInOut,
                                );
                              }
                            : null,
                      ),
                    ),
                    Text(
                      planetNames[currentIndex],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(Assetsmanger.forward_ic),
                        onPressed: currentIndex < planets.length - 1
                            ? () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.easeInOut,
                                );
                              }
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Redbtn(
                  title: "Explore ${planetNames[currentIndex]}",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlanetDetails(planet: planets[currentIndex]),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
