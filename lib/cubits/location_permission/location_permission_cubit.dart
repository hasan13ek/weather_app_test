import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app_test/data/models/helper/lat_lon.dart';
import 'package:equatable/equatable.dart';
part 'location_permission_state.dart';


class LocationPermissionCubit extends Cubit<LocationPermissionState> {
  LocationPermissionCubit()
      : super(
          const LocationPermissionState(
            myPermissionStatus: MyPermissionStatus.Pure,
          ),
        );

  Location location = Location();
  LatLong? latLongModel;

  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  Future<void> fetchCurrentLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    emit(state.copyWith(myPermissionStatus: MyPermissionStatus.Loading));
    LocationData locationData = await location.getLocation();
    await Future.delayed(const Duration(seconds: 3));
    latLongModel = LatLong(
      lat: locationData.latitude!,
      long: locationData.longitude!,
    );
    if (latLongModel != null) {
      emit(state.copyWith(
          myPermissionStatus: MyPermissionStatus.Success,
          latLongModel: latLongModel));
    } else {
      emit(state.copyWith(myPermissionStatus: MyPermissionStatus.Fail));
    }
  }
}
