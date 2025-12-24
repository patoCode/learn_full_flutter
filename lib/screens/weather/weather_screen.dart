import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_full_flutter/config/constants/environment.dart';
import 'package:learn_full_flutter/infraestructure/datasource/weather/weather_datasource.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _ds = WeatherDatasource();

    void getCityData() async {
      final response2 = await _ds.getCityData();
      log("RESPONSE 2: ${response2.toString()}");
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Weather'), centerTitle: true),
      drawer: Drawer(
        width: 380,
        child: SafeArea(
          child: Column(
            children: [
              TextButton(
                onPressed: () => getCityData(),
                child: Text("Press Here!"),
              ),
              ListTile(
                onTap: () => context.go('/calculator'),
                title: Text("Calculator"),
                leading: Icon(Icons.calculate),
              ),
              ListTile(
                onTap: () => context.go('/weather'),
                title: Text("Clima"),
                leading: Icon(Icons.dew_point),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(Environment.apikey),
                  Text(Environment.environment),
                  Text(Environment.uriApi),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
