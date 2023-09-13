import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/constants/variable_constants.dart';

class HerMessagaBubble extends StatelessWidget {
  final String data;
  final String img;
  const HerMessagaBubble({super.key, required this.data, required this.img});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Material(
            color: colors.colorScheme.secondaryContainer,
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
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius - 20),
          child: Image.network(
            img,
            width: 300,
            height: 200,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 3,
                        blurStyle: BlurStyle.inner)
                  ]),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return child;
            },
          ),
        )
      ],
    );
  }
}
