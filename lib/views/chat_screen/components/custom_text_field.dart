import 'package:chatgpt_flutter_case/core/theme/theme_shelf.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  Function()? onPressed;
  CustomTextField({super.key, required this.controller, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .9,
      child: TextField(
        controller: controller,
        style: TextStyle(color: textPrimary(context)),
        decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundColor: textPrimary(context),
                child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.send,
                      color: bgPrimary(context),
                    )),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: MainColors.mainGreen, width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[700]),
            hintText: "Message",
            fillColor: const Color(0xff262626)),
      ),
    );
  }
}
