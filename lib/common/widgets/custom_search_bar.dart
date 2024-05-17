import 'package:flutter/material.dart';
import 'package:tom/common/widgets/place_tile.dart';
import 'package:tom/controllers/location_controller.dart';
import 'package:tom/controllers/place_controller.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PlaceController.instance;

    return Container(
        padding: const EdgeInsets.all(8),
        height: 56,
        width: 343,
        child: SearchAnchor(
            isFullScreen: true,
            searchController: controller.searchBarController.value,
            suggestionsBuilder: (_, ctrl) {
              return [
                ...(controller.filteredPlaces.map(
                  (place) => PlaceTile(
                      place: place,
                      onTap: () {
                        LocationController.instance.updateMarker(
                            place.location.latitude, place.location.longitude);
                        ctrl.closeView(place.name);
                      }),
                ))
              ];
            },
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                padding:
                    const MaterialStatePropertyAll(EdgeInsets.only(left: 12)),
                onTap: () => controller.openView(),
                onSubmitted: (text) {
                  controller.closeView(text);
                },
                controller: controller,
                shape: const MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                hintText: "Search available places...",
                hintStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            }));
  }
}
