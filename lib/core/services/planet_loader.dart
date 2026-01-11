import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:space_app/ui/model/planet_model.dart';

Future<List<Planet>> loadPlanetsFromCsv() async {
  final rawData = await rootBundle.loadString('assets/data/planets.csv');

  final rows = const CsvToListConverter().convert(rawData, eol: '\n');

  List<Planet> planets = [];

  for (int i = 1; i < rows.length; i++) {
    final row = rows[i];

    try {
      double parseDouble(String s) {
        s = s
            .replaceAll(',', '')
            .replaceAll('×', 'e')
            .replaceAll('³', '3')
            .replaceAll('²', '2');
        return double.tryParse(s) ?? 0;
      }

      planets.add(
        Planet(
          name: row[0].toString(),
          pngImage: row[1].toString(),
          model3D: row[2].toString(),
          title: row[3].toString(),
          about: row[4].toString(),
          distanceFromSun: parseDouble(row[5].toString()),
          lengthOfDay: parseDouble(row[6].toString()),
          orbitalPeriod: parseDouble(row[7].toString()),
          radius: parseDouble(row[8].toString()),
          mass: parseDouble(row[9].toString()),
          gravity: parseDouble(row[10].toString()),
          surfaceArea: parseDouble(row[11].toString()),
        ),
      );
    } catch (e) {
      print("Error parsing row $i: $e");
    }
  }

  print("Loaded ${planets.length} planets");
  return planets;
}
