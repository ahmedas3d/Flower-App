import 'dart:convert';
import 'dart:async';
import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final LatLng flowerShop =
      LatLng(30.5965, 32.2654); // محل الورد في الإسماعيلية
  final LatLng customerLocation = LatLng(30.6021, 32.2719); // موقع العميل
  List<LatLng> routePoints = []; // قائمة تحتوي على نقاط المسار
  int currentDriverIndex = 0; // لتتبع موقع السائق على المسار

  @override
  void initState() {
    super.initState();
    _fetchRoute();
  }

  // جلب المسار من OSRM API
  Future<void> _fetchRoute() async {
    final url = Uri.parse(
        "https://router.project-osrm.org/route/v1/driving/${flowerShop.longitude},${flowerShop.latitude};${customerLocation.longitude},${customerLocation.latitude}?geometries=geojson");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> coordinates =
          data['routes'][0]['geometry']['coordinates'];

      setState(() {
        routePoints = coordinates
            .map((coord) => LatLng(coord[1], coord[0])) // تحويل الإحداثيات
            .toList();
      });

      _startDriverMovement(); // بدء تحرك السائق بعد تحميل المسار
    } else {
      throw Exception("Failed to load route");
    }
  }

  // تحريك السائق تدريجياً على المسار
  void _startDriverMovement() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentDriverIndex < routePoints.length - 1) {
        setState(() {
          currentDriverIndex++;
        });
      } else {
        timer.cancel(); // إيقاف المؤقت عند وصول السائق
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: flowerShop,
              initialZoom: 15.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              if (routePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: routePoints, // مسار الطريق الفعلي
                      color: Colors.blue.withOpacity(0.7),
                      strokeWidth: 4,
                    ),
                  ],
                ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: flowerShop,
                    width: 40,
                    height: 40,
                    child:
                        Icon(Icons.local_florist, color: Colors.red, size: 35),
                  ),
                  Marker(
                    point: customerLocation,
                    width: 40,
                    height: 40,
                    child: Icon(Icons.location_on_outlined,
                        color: Colors.green, size: 35),
                  ),
                  if (routePoints.isNotEmpty)
                    Marker(
                      point: routePoints[
                          currentDriverIndex], // السائق يتحرك على المسار
                      width: 50,
                      height: 50,
                      child: Icon(Icons.delivery_dining,
                          color: Colors.orange, size: 35),
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 35,
            left: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Estimated arrival",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "03 Sep 2024, 11:00 AM",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor1,
                    ),
                  ),
                  Divider(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.person_pin_circle,
                        color: Colors.orange,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mohamed",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Is your delivery hero for today",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.call, color: AppColors.primaryColor),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon:
                            Icon(Icons.message, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  customButton(
                    title: "Order Details",
                    onTap: () {},
                    color: AppColors.primaryColor,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
