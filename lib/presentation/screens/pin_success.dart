import 'package:flutter/material.dart';

class OverlayExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlay Example'),
      ),
      body: Stack(
        children: [
          // Background Widget
          Container(
            color: Colors.blue, // Set the background color
            child: Center(
              child: Text(
                'Background Widget',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
          ),
          // Overlay Widget
          Opacity(
            opacity: 0.5, // Set the desired opacity (0.0 to 1.0)
            child: Container(
              color: Colors.red, // Set the overlay color
              child: Center(
                child: Text(
                  'Overlay Widget',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
