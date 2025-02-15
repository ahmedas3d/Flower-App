import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:flower_app/generated/l10n.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final TextEditingController address = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController recipientName = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController area = TextEditingController();
  final GlobalKey<FormState> _formaddressKey = GlobalKey<FormState>();
  final List<String> cities = ['Cairo', 'Alexandria', 'Giza', 'Luxor'];
  final List<String> areas = ['Downtown', 'Zamalek', 'Maadi', 'Nasr City'];

  LatLng? currentPosition;
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    _checkLocationServiceAndPermissions();
  }

  Future<void> _checkLocationServiceAndPermissions() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await _showLocationServiceDisabledAlert();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await _showLocationPermissionDeniedAlert();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await _showLocationPermissionPermanentlyDeniedAlert();
      return;
    }

    _getCurrentLocation();
  }

  Future<void> _showLocationServiceDisabledAlert() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(S.of(context).locationRequired),
        content: Text(S.of(context).enableLocationMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await Geolocator.openLocationSettings();
              _checkLocationServiceAndPermissions();
            },
            child: Text(S.of(context).settings),
          ),
        ],
      ),
    );
  }

  Future<void> _showLocationPermissionDeniedAlert() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(S.of(context).permissionRequired),
        content: Text(S.of(context).locationPermissionDenied),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await Geolocator.openAppSettings();
              _checkLocationServiceAndPermissions();
            },
            child: Text(S.of(context).settings),
          ),
        ],
      ),
    );
  }

  Future<void> _showLocationPermissionPermanentlyDeniedAlert() async {
    return showDialog(
      barrierColor: AppColors.backgroundColor,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(S.of(context).permissionRequired),
        content: Text(S.of(context).locationPermissionPermanentlyDenied),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await Geolocator.openAppSettings();
              _checkLocationServiceAndPermissions();
            },
            child: Text(S.of(context).settings),
          ),
        ],
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        currentPosition = LatLng(position.latitude, position.longitude);
        _mapController.move(currentPosition!, 15);
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(S.of(context).address),
        backgroundColor: AppColors.backgroundColor,
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter:
                          currentPosition ?? const LatLng(30.0444, 31.2357),
                      initialZoom: 15,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      if (currentPosition != null)
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 40.0,
                              height: 40.0,
                              point: currentPosition!,
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formaddressKey,
                child: Column(
                  children: [
                    customTextField(
                      controller: address,
                      label: S.of(context).address,
                      hint: S.of(context).enterYourAddress,
                    ),
                    const SizedBox(height: 15),
                    customTextField(
                      controller: phoneNumber,
                      label: S.of(context).phoneNumber,
                      hint: S.of(context).enteryourPhoneNumber,
                    ),
                    const SizedBox(height: 15),
                    customTextField(
                      controller: recipientName,
                      label: S.of(context).recipientName,
                      hint: S.of(context).enteryourRecipientName,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            dropdownColor: AppColors.backgroundColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                              labelText: S.of(context).city,
                              labelStyle: const TextStyle(
                                color: AppColors.textColor3,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: AppColors.textColor3,
                                ),
                              ),
                            ),
                            items: cities.map((String city) {
                              return DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              );
                            }).toList(),
                            onChanged: (value) {
                              print('Selected City: $value');
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            dropdownColor: AppColors.backgroundColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                              labelText: S.of(context).area,
                              labelStyle: const TextStyle(
                                color: AppColors.textColor3,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: AppColors.textColor3,
                                ),
                              ),
                            ),
                            items: areas.map((String area) {
                              return DropdownMenuItem<String>(
                                value: area,
                                child: Text(area),
                              );
                            }).toList(),
                            onChanged: (value) {
                              print('Selected Area: $value');
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    customButton(
                      title: S.of(context).sacedAddresses,
                      onTap: () {},
                      color: AppColors.primaryColor,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
