import 'package:flutter/material.dart';

import 'package:hee8_lb/utils/constants.dart';

class RoleBanner extends StatefulWidget {
  final int level;
  final String name;
  final String? details;
  final Color color;
  const RoleBanner({Key? key, required this.level, required this.name, this.details, required this.color}) : super(key: key);

  @override
  State<RoleBanner> createState() => _RoleBannerState();
}

class _RoleBannerState extends State<RoleBanner> {
  List<Color> get gradient => [widget.color.withOpacity(0.5), widget.color];

  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: gradient)
        ),
        child: AnimatedSize(
          alignment: Alignment.topCenter,
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.name, style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                  Row(
                    children: [
                      if (widget.details != null) MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(onTap: () {
                          setState(() {
                            showDetails = !showDetails;
                          });
                        }, child: Icon(showDetails ? Icons.expand_less : Icons.expand_more)),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(99)
                        ),
                        child: Text("LV ${widget.level}", style: const TextStyle(fontFamily: kInter, color: Colors.black)),
                      )
                    ],
                  )
                ],
              ),
              if (showDetails) ...[
                Divider(),
                Text(widget.details!)
              ]
            ],
          ),
        )
    );
  }
}
