import 'dart:math';
import 'package:flutter/material.dart';

/// A class for applying animations to widgets.
class CRCAnimation {
  static Widget applyAnimation<T extends StatefulWidget>({
    required BuildContext context,
    required Widget child,
    required AnimationType type,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    late AnimationController _controller;
  /// Apply the animation to the given [child] widget and return the animated widget.

    switch (type) {
      case AnimationType.fadeIn:
        _controller = AnimationController(
          vsync: Navigator.of(context),
          duration: duration,
        )..forward();
        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              curve: Curves.easeIn,
              parent: _controller,
            ),
          ),
           // Implementation of applyAnimation method.
    // This method applies the specified animation to the child widget.
          child: child,
        );
      case AnimationType.slideIn:
        _controller = AnimationController(
          vsync: Navigator.of(context),
          duration: duration,
        )..forward();
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              curve: Curves.easeIn,
              parent: _controller,
            ),
          ),
          child: child,
        );
      case AnimationType.scale:
        _controller = AnimationController(
          vsync: Navigator.of(context),
          duration: duration,
        )..forward();
        return ScaleTransition(
          scale: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              curve: Curves.easeIn,
              parent: _controller,
            ),
          ),
          child: child,
        );
      case AnimationType.rotate:
        _controller = AnimationController(
          vsync: Navigator.of(context),
          duration: duration,
        )..forward();
        return RotationTransition(
          turns: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              curve: Curves.easeIn,
              parent: _controller,
            ),
          ),
          child: child,
        );
      case AnimationType.bounce:
        _controller = AnimationController(
          vsync: Navigator.of(context),
          duration: duration,
        )..forward();
        return AnimatedBuilder(
          animation: CurvedAnimation(
            curve: Curves.bounceOut,
            parent: _controller,
          ),
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 -
                  (0.5 * (1 - Curves.bounceOut.transform(_controller.value))),
              child: child,
            );
          },
          child: child,
        );
      case AnimationType.slideAndFade:
        _controller = AnimationController(
          vsync: Navigator.of(context),
          duration: duration,
        )..forward();
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, -0.5),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              curve: Curves.easeIn,
              parent: _controller,
            ),
          ),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                curve: Curves.easeIn,
                parent: _controller,
              ),
            ),
            child: child,
          ),
        );
      case AnimationType.flip:
        _controller = AnimationController(
          vsync: Navigator.of(context),
          duration: duration,
        )..forward();
        return AnimatedBuilder(
          animation: CurvedAnimation(
            curve: Curves.easeInOut,
            parent: _controller,
          ),
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX(
                    (0.5 - Curves.easeInOut.transform(_controller.value)) * pi),
              child: child,
            );
          },
          child: child,
        );
      case AnimationType.rotateAndZoomOut:
        _controller = AnimationController(
          vsync: Navigator.of(context),
          duration: duration,
        )..forward();
        return AnimatedBuilder(
          animation: CurvedAnimation(
            curve: Curves.easeInOut,
            parent: _controller,
          ),
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateZ((Curves.easeInOut.transform(_controller.value)) * pi)
                ..scale(1.0 -
                    (0.5 *
                        (1 - Curves.easeInOut.transform(_controller.value)))),
              child: child,
            );
          },
          child: child,
        );
      case AnimationType.fadeOut:
        _controller = AnimationController(
          vsync: Navigator.of(context),
          duration: duration,
        )..forward();
        return FadeTransition(
          opacity: Tween<double>(begin: 1, end: 0).animate(
            CurvedAnimation(
              curve: Curves.easeOut,
              parent: _controller,
            ),
          ),
          child: child,
        );
      case AnimationType.grow:
        _controller = AnimationController(
          vsync: Navigator.of(context),
          duration: duration,
        )..forward();
        return AnimatedBuilder(
          animation: CurvedAnimation(
            curve: Curves.easeOut,
            parent: _controller,
          ),
          builder: (context, child) {
            return Transform.scale(
              scale: Curves.easeOut.transform(_controller.value),
              child: child,
            );
          },
          child: child,
        );
      // Add more animations here
      default:
        return child;
    }
  }
}

/// Enum representing different types of animations.
enum AnimationType {
  fadeIn,
  slideIn,
  scale,
  rotate,
  bounce,
  slideAndFade,
  flip,
  rotateAndZoomOut,
  fadeOut,
  grow,
  // Add more animation types here
}
