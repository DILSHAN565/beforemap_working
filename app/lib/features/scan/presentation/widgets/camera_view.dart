import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraView extends StatelessWidget {
  final CameraController? cameraController;
  final XFile? capturedImage;
  final double width;
  final double height;

  const CameraView({
    Key? key,
    required this.cameraController,
    required this.capturedImage,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.black, // Set the border color
          width: 2.0, // Set the border width
        ),
      ),
      child: capturedImage != null
          ? Image.file(
              File(capturedImage!.path), // Display the captured image
              width: width,
              height: height,
              fit: BoxFit.cover,
            )
          : (cameraController != null && cameraController!.value.isInitialized)
              ? CameraPreview(cameraController!) // Display live camera feed
              : Center(
                  child:
                      CircularProgressIndicator(), // Show loading indicator while the camera is initializing
                ),
    );
  }
}
