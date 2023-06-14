import 'package:flutter/material.dart';

class CityInformationWidget extends StatefulWidget {
  CityInformationWidget({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String city;

  @override
  _CityInformationWidgetState createState() => _CityInformationWidgetState();
}

class _CityInformationWidgetState extends State<CityInformationWidget> {
  //bool isFavourite = false;

  @override
  void initState() {
    //isFavourite = widget.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(widget.city.toUpperCase(),
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          )),
    ]);
  }
}
