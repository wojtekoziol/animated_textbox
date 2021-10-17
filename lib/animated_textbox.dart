import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedTextbox extends HookWidget {
  const AnimatedTextbox({Key? key}) : super(key: key);

  final _height = 70.0;
  final _width = 350.0;
  final _padding = 8.0;

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 350));

    final animation = Tween<double>(begin: 1, end: -1)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(animationController);

    final focusNode = useFocusNode();

    useEffect(() {
      focusNode.addListener(() {
        focusNode.hasFocus
            ? animationController.forward()
            : animationController.reverse();
      });
    }, []);

    return SizedBox(
      height: _height * 2,
      width: _width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: _height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(64),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Align(
              alignment: Alignment(animation.value, 1),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _padding * 3),
                child: SizedBox(
                  height: _height,
                  width: _width * 3 / 5 -
                      _padding * 3 * 2 +
                      (_width * 2 / 5) * animationController.value,
                  child: Center(
                    child: TextField(
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type a  name ...',
                        hintStyle: GoogleFonts.rubik(
                          color: const Color(0xffa1a0a2),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Align(
              alignment: Alignment(-1, animation.value),
              child: child,
            ),
            child: Padding(
              padding: EdgeInsets.all(_padding),
              child: Container(
                height: _height - _padding * 2,
                width: _width * 2 / 5 - _padding * 2,
                decoration: BoxDecoration(
                  color: const Color(0xff3c8aee),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text(
                    'Username',
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
