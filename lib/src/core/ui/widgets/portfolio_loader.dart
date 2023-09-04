import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PortfolioLoader extends StatelessWidget {
  const PortfolioLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}
