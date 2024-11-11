import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Icon(Icons.add, size: 30, color: Colors.white),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Color(0xFFA4C639).withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(0),
        minimumSize: const Size(50, 50),
      ),
    );
  }
}
