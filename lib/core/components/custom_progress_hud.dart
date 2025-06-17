import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomProgressHud extends StatelessWidget {
  const CustomProgressHud({
    super.key,
    required this.isLoading,
    required this.child,
    this.loadingText,
  });

  final bool isLoading;
  final Widget child;
  final String? loadingText;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      opacity: 0.5,
      progressIndicator: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SpinKitFadingCircle(
            color: Colors.white,
            size: 50.0,
          ),
          if (loadingText != null) ...[
            const SizedBox(height: 16.0),
            Text(
              loadingText!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
      child: child,
    );
  }
}
