import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';

class CustomRowAddress extends StatefulWidget {
  const CustomRowAddress({super.key});

  @override
  State<CustomRowAddress> createState() => _CustomRowAddressState();
}

class _CustomRowAddressState extends State<CustomRowAddress> {
  String _currentAddress = "Fetching location...";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Check location permissions
      final status = await Permission.location.request();
      if (!status.isGranted) {
        setState(() {
          _currentAddress = "Location permission denied";
          _isLoading = false;
        });
        return;
      }

      // Get current position
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Reverse geocoding to get address
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final Placemark placemark = placemarks.first;
        setState(() {
          _currentAddress =
              "${placemark.street}, ${placemark.locality}, ${placemark.country}";
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _currentAddress = "Unable to get location";
        _isLoading = false;
      });
      debugPrint("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 18,
          color: AppColors.greyColor,
        ),
        Text(
          '${S.of(context).deliverTo} ',
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.greyColor,
          ),
        ),
        Row(
          children: [
            _isLoading
                ? const SizedBox(
                    width: 10,
                    height: 10,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primaryColor,
                    ),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      _currentAddress,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor1,
                      ),
                    ),
                  ),
            IconButton(
              onPressed: _getCurrentLocation,
              iconSize: 24,
              color: AppColors.primaryColor,
              icon: const Icon(Icons.keyboard_arrow_down),
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
            ),
          ],
        ),
      ],
    );
  }
}
