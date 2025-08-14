import 'package:flutter/material.dart';

class CodeBlock extends StatelessWidget {
  final String code;

  const CodeBlock({
    required this.code,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SelectableText(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          color: Colors.white,
          fontSize: 14.0,
        ),
      ),
    );
  }
}