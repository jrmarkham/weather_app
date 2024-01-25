import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:weather/src/data/models/app_location.dart';
import 'package:weather/src/data/models/app_weather_location.dart';
import 'package:weather/src/globals.dart';
import 'package:weather/src/ui/widgets/weather_mini_card.dart';

import '../../data/blocs/weather_location/weather_location_cubit.dart';
import 'scaffolds/main_screen_scaffold.dart';

const double _defaultLatitude = 40.7143;
const double _defaultLongitude = -74.0060;

class SearchScreen extends StatelessWidget {
  final ThemeData theme;

  const SearchScreen(this.theme, {super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaData = MediaQuery.of(context);
    final WeatherLocationCubit weatherLocationCubit = BlocProvider.of<WeatherLocationCubit>(context);
    void addLocationToList(PickedData pickedData) => weatherLocationCubit.addLocation(AppLocationData(
        name: pickedData.address.split(',').first,
        latitude: pickedData.latLong.latitude.toString(),
        longitude: pickedData.latLong.longitude.toString()));

    OverlayEntry? overlayWidget;
    void closeOverlay() {
      if (overlayWidget == null) return;
      if (overlayWidget?.mounted ?? false) {
        overlayWidget?.remove();
      }
      overlayWidget = null;
    }

    void showOverLay(AppWeatherLocationData data) {
      // for
      Future.delayed(const Duration(seconds: 5), () => closeOverlay());

      overlayWidget = OverlayEntry(builder: (BuildContext context) {
        return GestureDetector(
            onTap: () => closeOverlay(),
            child: Material(
                type: MaterialType.transparency,
                child: Center(child: SizedBox(width: mediaData.size.width * 0.85, height: mediaData.size.height * 0.65, child: WeatherCard(data)))));
      });

      Overlay.of(context).insert(overlayWidget!);
    }

    // void addLocationToList (PickedData pickedData) => weatherLocationCubit.addLocation();

    return BlocBuilder<WeatherLocationCubit, WeatherLocationState>(
        bloc: weatherLocationCubit,
        builder: (BuildContext context, WeatherLocationState state) {
          return MainScreenScaffold(
              body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (state.status == WeatherLocationStatus.loaded) ...[
                SizedBox(
                  width: mediaData.size.width * .85,
                  height: mediaData.size.height * 0.5,
                  child: FlutterLocationPicker(
                    initPosition: const LatLong(_defaultLatitude, _defaultLongitude),
                    initZoom: 11,
                    minZoomLevel: 5,
                    maxZoomLevel: 16,
                    trackMyPosition: true,
                    onPicked: addLocationToList,
                  ),
                ),
                Expanded(
                    child: state.weatherLocationList.isEmpty
                        ? const SizedBox.shrink()
                        : ListView.builder(
                            itemCount: state.weatherLocationList.length,
                            itemBuilder: (BuildContext context, int idx) {
                              final AppWeatherLocationData data = state.weatherLocationList[idx];
                              return InkWell(onTap: () => showOverLay(data), child: WeatherMiniCard(data));
                            }))
              ]
            ],
          ));
        });
  }
}
