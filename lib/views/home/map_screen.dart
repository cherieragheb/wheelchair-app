import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/common/widgets/custom_search_bar.dart';
import 'package:tom/controllers/location_controller.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LocationController.instance;

    return Scaffold(
      backgroundColor: MyColors.primary,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Your current location",
          style: TextStyle(
            color: MyColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: MyColors.primary,
      ),
      body: Stack(
        children: [
          Obx(() => GoogleMap(
                myLocationEnabled: true,
                markers: controller.markers,
                onTap: (LatLng pos) =>
                    controller.updateMarker(pos.latitude, pos.longitude),
                trafficEnabled: true,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController ctrl) =>
                    controller.onMapCreated(ctrl),
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    controller.currentLatitude.value,
                    controller.currentLongitude.value,
                  ),
                  zoom: 18.0,
                ),
              )),
          const CustomSearchBar(),
        ],
      ),
    );
  }
}

// showMap(Object item) {
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

//   var markerIdVal = uniqueId;
//   final MarkerId markerId = MarkerId(markerIdVal);

//   // creating a new MARKER
//   final Marker marker = Marker(
//     markerId: markerId,
//     position: LatLng(
//       item.location.lat,
//       item.location.lng,
//     ),
//     icon: controller.markerIcon.value, //We need to set icon in Getx controller
//     onTap: () {},
//   );

//   markers[markerId] = marker;

//   return Container(
//     height: 250,
//     width: double.infinity,
//     decoration: containerRoundShape(size: 16),
//     child: GoogleMap(
//       mapType: MapType.normal,
//       initialCameraPosition: CameraPosition(
//         target: LatLng(item.location.lat, item.location.lng),
//         zoom: 15.5,
//       ),
//       markers: Set<Marker>.of(markers.values),
//       zoomControlsEnabled: true,
//       onMapCreated: (GoogleMapController controller) {
//         _controller.complete(controller);
//       },
//     ),
//   );
// }
