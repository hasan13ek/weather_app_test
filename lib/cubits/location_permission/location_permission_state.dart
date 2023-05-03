part of 'location_permission_cubit.dart';

class LocationPermissionState extends Equatable {
  final LatLong? latLongModel;
  final MyPermissionStatus myPermissionStatus;

  const LocationPermissionState({
    this.latLongModel,
    required this.myPermissionStatus,
  });

  LocationPermissionState copyWith({
    MyPermissionStatus? myPermissionStatus,
    LatLong? latLongModel,
  }) =>
      LocationPermissionState(
        latLongModel: latLongModel ?? this.latLongModel,
        myPermissionStatus: myPermissionStatus ?? this.myPermissionStatus,
      );

  @override
  List<Object?> get props => [
        latLongModel,
        myPermissionStatus,
      ];
}

enum MyPermissionStatus {
  Pure,
  Loading,
  Success,
  Fail,
}
