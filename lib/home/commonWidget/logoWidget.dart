import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  String imageUrl;

  String text;

  LogoWidget(this.imageUrl, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageUrl),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2))),
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
