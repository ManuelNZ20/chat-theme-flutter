import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/constants/variable_constants.dart';

class MyMessageBubble extends StatelessWidget {
  final String data;
  const MyMessageBubble({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Material(
            color: colors.colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data,
                style: textStyle.bodyMedium,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
