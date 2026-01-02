import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../network/weather_service.dart';
import '../theme/app_colors.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late WeatherService service;
  Future<Weather>? weather;
  final TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    service = WeatherService(Dio());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    labelText: "Enter your city",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(

                  child: ElevatedButton(
                    onPressed: () {
                      if (cityController.text.isNotEmpty) {
                        setState(() {
                          weather = service.getWeather(
                            cityController.text,
                            "6d95e6471864420c308aaa6d6385be85",
                            "metric",
                          );
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                    ),
                    child:  Text("Search"),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: weather != null
                ? FutureBuilder<Weather>(
              future: weather,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                final data = snapshot.data!;
                return Center(
                  child: Container(
                    width: 300,
                    child: Card(
                      color: AppColors.card,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              data.cityName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Temp: ${data.temperature} °C",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              data.description,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 16),
                            if (data.icon != null && data.icon.isNotEmpty)
                              Image.network(
                                "https://openweathermap.org/img/wn/${data.icon}@2x.png",
                                width: 120,
                                height: 120,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
