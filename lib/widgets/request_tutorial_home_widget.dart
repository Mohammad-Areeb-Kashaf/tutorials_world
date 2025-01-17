import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tutorials_world/consts/constant.dart';

class RequestTutorialHomeWidget extends StatelessWidget {
  const RequestTutorialHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: cardBackgroundColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    hintText: "YouTube Tutorial URL",
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize:
                        const WidgetStatePropertyAll<Size>(Size.fromHeight(50)),
                    side: const WidgetStatePropertyAll(
                        BorderSide(color: selectionColor)),
                    foregroundColor:
                        WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.hovered)) {
                        return Colors.black;
                      }
                      return selectionColor;
                    }),
                    backgroundColor:
                        WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.hovered)) {
                        return selectionColor;
                      }
                      return Colors.transparent;
                    }),
                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Request Tutorial",
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const FittedBox(
                  child: Text(
                      "You can request a playlist or a video to be added to Tutorials World. Just paste it's link in the text field above."),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
