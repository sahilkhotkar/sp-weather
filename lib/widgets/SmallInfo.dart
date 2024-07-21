import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallInfo extends StatefulWidget {
  final bool? celcius;
  final String infoName;
  final String value;
  const SmallInfo(
      {super.key,
      required this.infoName,
      required this.value,
      required this.celcius});

  @override
  State<SmallInfo> createState() => _SmallInfoState();
}

class _SmallInfoState extends State<SmallInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(widget.infoName,
                style: GoogleFonts.cabin(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.value,
                  style: GoogleFonts.cabin(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                widget.celcius == true
                    ? Text(
                        "\u00B0C",
                        style: GoogleFonts.cabin(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    : Container(),
              ],
            ),
          ],
        )
      ],
    );
  }
}
