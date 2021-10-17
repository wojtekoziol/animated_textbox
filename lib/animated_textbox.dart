import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedTextbox extends StatelessWidget {
  const AnimatedTextbox({Key? key}) : super(key: key);

  final _height = 70.0;
  final _width = 350.0;
  final _padding = 5.0;

  @override
  Widget build(BuildContext context) {
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
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(left: _padding, right: _padding * 2),
              child: SizedBox(
                width: _width * 2 / 3 - _padding * 4,
                height: _height,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a  name ...',
                      hintStyle: GoogleFonts.rubik(
                        color: Colors.black45,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
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
