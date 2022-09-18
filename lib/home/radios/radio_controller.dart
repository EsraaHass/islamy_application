import 'package:flutter/material.dart';
import 'package:islamy_app/home/providers/settingsProvider.dart';
import 'package:islamy_app/home/radios/Radios.dart';
import 'package:provider/provider.dart';

class RadioController extends StatefulWidget {
  Radios radiusResponse;

  Function play;
  Function pause;

  RadioController({
    required this.radiusResponse,
    required this.play,
    required this.pause,
  });

  @override
  State<RadioController> createState() => _RadioControllerState();
}

class _RadioControllerState extends State<RadioController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProviders>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(widget.radiusResponse.name ?? '',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: provider.isDarkMode() ? Colors.white : Colors.black,
                  ),
              textAlign: TextAlign.center),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    widget.play(widget.radiusResponse.radioUrl);
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: provider.isDarkMode() ? Colors.white : Colors.black,
                  )),
              IconButton(
                  onPressed: () {
                    widget.pause();
                  },
                  icon: Icon(
                    Icons.pause,
                    color: provider.isDarkMode() ? Colors.white : Colors.black,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
