import 'package:get/get.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import '../utils/popups/loaders.dart';

class LocationManager extends GetxController {
  // static LocationManager get instance => Get.find();

  // final Rx<Position?> currentPosition = Rx<Position?>(null);
  // final RxBool isLocationEnabled = false.obs;
  // final Rx<PermissionStatus> locationPermissionStatus = Rx<PermissionStatus>(
  //   PermissionStatus.denied,
  // );

  // @override
  // void onInit() {
  //   super.onInit();
  //   checkAndRequestLocationAccess();
  // }

  // /// Full check: service status, permission status, and request logic
  // Future<void> checkAndRequestLocationAccess() async {
  //   // 1. Check if location services are enabled
  //   final serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   isLocationEnabled.value = serviceEnabled;

  //   if (!serviceEnabled) {
  //     TLoaders.customToast(message: 'Location services are disabled.');
  //     return;
  //   }

  //   // 2. Check location permission status using permission_handler
  //   final permission = await Permission.location.status;
  //   locationPermissionStatus.value = permission;

  //   if (permission.isDenied) {
  //     final result = await Permission.location.request();
  //     locationPermissionStatus.value = result;

  //     if (result.isDenied) {
  //       TLoaders.customToast(message: 'Location permission denied.');
  //       return;
  //     }
  //   }

  //   if (permission.isPermanentlyDenied) {
  //     TLoaders.customToast(
  //       message:
  //           'Location permission permanently denied. Please enable it from app settings.',
  //     );
  //     await openAppSettings(); // optional dialog navigation
  //     return;
  //   }

  //   // 3. If permission granted, get current location
  //   await _getCurrentLocation();
  // }

  // /// Get current location with high accuracy
  // Future<void> _getCurrentLocation() async {
  //   try {
  //     final position = await Geolocator.getCurrentPosition(
  //       locationSettings: const LocationSettings(
  //         accuracy: LocationAccuracy.best,
  //       ),
  //     );

  //     currentPosition.value = position;
  //   } catch (e) {
  //     TLoaders.customToast(message: 'Error getting location: $e');
  //   }
  // }

  // /// Get a stream of location updates (if needed)
  // Stream<Position> get positionStream => Geolocator.getPositionStream(
  //   locationSettings: const LocationSettings(
  //     accuracy: LocationAccuracy.best,
  //     distanceFilter: 10,
  //   ),
  // );

  // /// Public method to refresh location
  // Future<void> refreshLocation() async => await checkAndRequestLocationAccess();
}
