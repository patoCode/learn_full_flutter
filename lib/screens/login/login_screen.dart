import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquerySize = MediaQuery.of(context).size;
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      drawer: Drawer(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  mediaquerySize.height.toString(),
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  mediaquerySize.width.toString(),
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 20),
                Container(
                  color: color.tertiary,
                  height: mediaquerySize.height - 300,
                  width: mediaquerySize.width - 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
