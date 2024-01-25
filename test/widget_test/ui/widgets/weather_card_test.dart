import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather/src/data/models/app_location.dart';
import 'package:weather/src/data/models/app_weather.dart';
import 'package:weather/src/data/models/app_weather_location.dart';
import 'package:weather/src/globals.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget _testWidget(Widget testWidget) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        child: testWidget,
      ),
    ));
  }

  group('Test Weather Card Widget', () {
    testWidgets('should find elements [] of the Weather Card ', (WidgetTester tester) async {
      final ThemeData theme = ThemeData();
      final WeatherCard testWeatherCar = WeatherCard(
          data: const AppWeatherLocationData(
              location: AppLocationData(name: 'The Bat Cave', longitude: '10', latitude: '10'),
              weather: AppWeatherData(
                  temperature: 10,
                  temperatureUnit: 'F',
                  windDirection: 'wind go North',
                  windSpeed: 'fast',
                  detailedForecast: 'very bad weather',
                  shortForecast: 'bad weather')),
          theme: theme);

      await tester.pumpWidget(_testWidget(testWeatherCar));
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(Container), findsWidgets);
    });
  });
}
