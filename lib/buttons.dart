import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String buttonText;
  final VoidCallback? buttontapped;

  const MyButton({
    super.key,
    this.color,
    this.textColor,
    required this.buttonText,
    this.buttontapped,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive padding and font scaling
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = screenWidth * 0.06; // Responsive font size
    final double padding = screenWidth * 0.02; // Responsive padding

    return GestureDetector(
      onTap: () {
        // Trigger haptic feedback on tap
        HapticFeedback.lightImpact();
        buttontapped?.call();
      },
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          // Apply scale transformation on tap
          transform: buttontapped != null
              ? Matrix4.identity()
              : Matrix4.identity()..scale(0.95),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color ?? Colors.grey[200]!, // Fallback color
                // ignore: deprecated_member_use
                color?.withOpacity(0.8) ?? Colors.grey[300]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15), // Rounded corners
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textColor ?? Colors.black,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}