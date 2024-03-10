import 'package:flutter/material.dart';
import 'package:spending/core/constants/image_asset_path.dart';
import 'package:spending/presentation/screens/splash/splash_screen.dart';

class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(ImageAssetPath.disconnected),
              ),
              const SizedBox(height: 24),
              const Text(
                'Oops',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'No internet was found. Check your connection or try again',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const SplashScreen();
                    },
                  ), (route) => false);
                },
                child: const Text('Try Again'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
