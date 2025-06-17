import 'package:electronics_task/core/themes/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTopBar extends StatelessWidget {
  final String? sectionLabel;
  final String title;
  final bool showBackButton;
  final VoidCallback? onBack;

  const CustomTopBar({
    super.key,
    required this.title,
    this.sectionLabel,
    this.showBackButton = true,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Centered Title
                Center(
                  child: Text(
                    title,
                    style: AppTextStyles.interSemiBold16,
                    textAlign: TextAlign.center,
                  ),
                ),

                Positioned(
                  left: 0,
                  top: -2,
                  child: Row(
                    children: [
                      if (showBackButton)
                        Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: IconButton(
                            icon:
                                const Icon(Icons.arrow_back_ios_new, size: 18),
                            onPressed: onBack ?? () => Navigator.pop(context),
                          ),
                        ),
                      if (sectionLabel != null)
                        Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Text(
                            sectionLabel!,
                            style: AppTextStyles.interRegular10,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.black12, thickness: 1),
        ],
      ),
    );
  }
}
