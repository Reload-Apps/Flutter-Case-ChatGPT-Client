import 'package:flutter/material.dart';

class MainScreenButton extends StatelessWidget {
  const MainScreenButton({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width * .8,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: const Center(
          child: Text(
            'Continue',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
