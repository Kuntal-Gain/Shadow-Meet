import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shadow_meet/core/utils/constants/colors_constants.dart';
import 'package:shadow_meet/core/utils/constants/size_constants.dart';
import 'package:shadow_meet/core/utils/constants/text_constant.dart';
import 'package:shadow_meet/core/utils/helper/logo.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Get the list of available cameras
    final cameras = await availableCameras();
    // Select the first camera (rear camera)
    final camera = cameras.first;

    _cameraController = CameraController(
      camera,
      ResolutionPreset.medium, // You can adjust the resolution
    );

    _initializeControllerFuture = _cameraController.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                logoWidget(),
                Text(
                  'Verify Face',
                  style: appStyle(
                    size: 35,
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the controller is initialized, display the camera preview
                  return Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          0.4, // 80% of screen height
                      width: MediaQuery.of(context).size.width *
                          0.8, // 80% of screen width
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Optional: Add rounded corners
                        child: CameraPreview(_cameraController),
                      ),
                    ),
                  );
                } else {
                  // Otherwise, display a loading spinner
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.4,
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Retake",
                      style: appStyle(
                        size: 20,
                        color: AppColor.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.4,
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    border: Border.all(color: AppColor.bgGrey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: appStyle(
                        size: 20,
                        color: AppColor.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                )
              ],
            ),
            sizeZ(),
          ],
        ),
      ),
    );
  }
}
