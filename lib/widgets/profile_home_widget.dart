import 'package:flutter/material.dart';

class ProfileHomeWidget extends StatelessWidget {
  const ProfileHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'XYZ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'xyz@xyz.com',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Add your logout logic here
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size.fromHeight(40)),
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.red)), // Red border
                  foregroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors
                          .white; // Hovered color (entire button turns red)
                    }
                    return Colors.red; // Default transparent background
                  }), // White text color
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors
                          .red; // Hovered color (entire button turns red)
                    }
                    return Colors.transparent; // Default transparent background
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Rounded corners
                    ),
                  ),
                ),
                icon: const Icon(Icons.logout_rounded),
                label: const Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
