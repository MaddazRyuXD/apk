import 'package:flutter/material.dart';

class RichTextToolbar extends StatelessWidget {
  const RichTextToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: const [Icon(Icons.format_bold), SizedBox(width: 12), Icon(Icons.format_italic)]);
  }
}
