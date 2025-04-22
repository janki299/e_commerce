import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final String animation;
  final String text;
  final bool showAction;
  final String actionText;
  final VoidCallback? onActionPressed;

  const LoadingWidget({
    Key? key,
    required this.animation,
    required this.text,
    this.showAction = false,
    this.actionText = '',
    this.onActionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width *
                  0.8), // Display Lottie animation
          const SizedBox(height: 10),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ), // Text
          const SizedBox(height: 10),
          if (showAction)
            SizedBox(
              // width: 250,
              child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.black),
                child: Text(
                  actionText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.white),
                ),
              ),
            ), // OutlinedButton
          const SizedBox(),
        ],
      ),
    );
  }
}
