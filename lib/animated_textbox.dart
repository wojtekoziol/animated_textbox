import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedTextbox extends HookWidget {
  const AnimatedTextbox({Key? key}) : super(key: key);

  final _height = 70.0;
  final _width = 350.0;
  final _padding = 5.0;

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
              width: _width,
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
              child: child,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: _padding, right: _padding * 2),
              child: SizedBox(
                width: _width * 2 / 3 - _padding * 4,
                height: _height,
                child: Center(
                  child: TextField(
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type a  name ...',
                      hintStyle: GoogleFonts.rubik(
                        color: Colors.black45,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
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
              padding: const EdgeInsets.all(5),
              child: Container(
                height: _height - _padding * 2,
                width: _width * 1 / 3 - _padding * 2,
                decoration: BoxDecoration(
                  color: Colors.blue,
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
