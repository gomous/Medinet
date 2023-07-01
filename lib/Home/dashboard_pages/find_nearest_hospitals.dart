import 'package:flutter/material.dart';

class FindNearestHospital extends StatefulWidget {
  const FindNearestHospital({Key? key}) : super(key: key);

  @override
  State<FindNearestHospital> createState() => _FindNearestHospitalState();
}

class _FindNearestHospitalState extends State<FindNearestHospital> {
  @override
  Widget build(BuildContext context) {
    var color  = Colors.white;
    return Container(
      color: color,
      child: Center(
        child: Text("Find Nearest Hospital"),
      ),
    );;
  }
}
