import 'package:flutter/material.dart';
import '/controllers/add_energy.dart';

const energyPerClick = 1;

class EarthClicker extends StatelessWidget {
  const EarthClicker({Key? key}) : super(key: key);

  static const clickerSize = 250.0;
  static const clickerImgSrc = 'assets/earth1.png';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedClicker(
        clickerSize: clickerSize,
        clickerImgSrc: clickerImgSrc,
      ),
    );
  }
}

class AnimatedClicker extends StatefulWidget {
  final double clickerSize;
  final String clickerImgSrc;

  const AnimatedClicker({
    required this.clickerSize,
    required this.clickerImgSrc,
  });

  @override
  _AnimatedClickerState createState() => _AnimatedClickerState();
}

class _AnimatedClickerState extends State<AnimatedClicker> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final addEnergy = useAddEnergy(context);

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
          addEnergy(energyPerClick); // Increment energy by 1
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            transform: Matrix4.identity()..scale(_isTapped ? 0.9 : 1.0),
            child: Image.asset(
              widget.clickerImgSrc,
              height: widget.clickerSize,
              width: widget.clickerSize,
            ),
          ),
          if (_isTapped)
            ClickEffect(), // Show the +1 text effect
        ],
      ),
    );
  }
}

class ClickEffect extends StatefulWidget {
  @override
  _ClickEffectState createState() => _ClickEffectState();
}

class _ClickEffectState extends State<ClickEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      bottom: 100,
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 500),
        onEnd: () => setState(() {}), // Rebuild widget to remove it from the tree
        child: Text(
          '+1',
          style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}