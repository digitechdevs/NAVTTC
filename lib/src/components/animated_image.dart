
import 'package:navttc/src/core/utils/app_exports.dart';

class AnimatedImage extends StatefulWidget {
  final String imagePath;
  final double initialScale;
  final int duration;
  final VoidCallback onAnimationComplete;

  const AnimatedImage({
    Key? key,
    required this.imagePath,
    this.initialScale = 1,
    this.duration = 2,
    required this.onAnimationComplete,
  }) : super(key: key);

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    );
    _scaleAnimation = Tween<double>(
      begin: widget.initialScale,
      end: widget.initialScale * 2.25,
    ).animate(_animationController)
      ..addListener(() => setState(() {}));
    _animationController.forward().then((value) {
      if (_animationController.isCompleted) {
        widget.onAnimationComplete();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Image.asset(
          widget.imagePath,
          height: 140.sp,
          width: 140.sp,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
