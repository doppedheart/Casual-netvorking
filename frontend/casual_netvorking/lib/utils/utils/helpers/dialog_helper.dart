import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DialogHelper {
  // Singleton instance
  static final DialogHelper _instance = DialogHelper._();

  // Private constructor
  DialogHelper._();

  // Get the singleton instance
  static DialogHelper get instance => _instance;

  // Method to show an error dialog
  void showError(BuildContext context, String message) {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Method to show a success dialog
  void showSuccess(BuildContext context, String message) {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Method to show a permission dialog
  void showPermission(BuildContext context, String message, Function onGranted, Function onDenied) {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Permission'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onDenied();
              },
              child: const Text('Deny'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onGranted();
              },
              child: const Text('Allow'),
            ),
          ],
        );
      },
    );
  }

  // Method to show a loading dialog
  void showLoading(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Dialog(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text('Loading...'),
              ],
            ),
          ),
        );
      },
    );
  }

  // Method to hide the loading dialog
  void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  // Method to select an image from the gallery or camera
  void selectImage(BuildContext context, Function onImageSelected) {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Select Image'),
          children: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                onImageSelected(image);
              },
              child: const Text('Gallery'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                final image = await ImagePicker().pickImage(source: ImageSource.camera);
                onImageSelected(image);
              },
              child: const Text('Camera'),
            ),
          ],
        );
      },
    );
  }
}
