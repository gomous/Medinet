import 'package:flutter/material.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({Key? key}) : super(key: key);

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    var color = Colors.white;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          child: Text(
            "Department",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, backgroundColor: Colors.white),
          ),
          padding: EdgeInsets.only(left: 20),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 120,
          color: color,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => buildCard_B(),
              separatorBuilder: (context, _) => SizedBox(width: 12),
              itemCount: 10),
        ),
        SizedBox(
          height: 60,
        ),
        Container(
          child: Text(
            "Your Appointments",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, backgroundColor: Colors.white),
          ),
          padding: EdgeInsets.only(left: 20),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 200,
            color: color,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (context, _) => SizedBox(width: 12),
                itemBuilder: (context, index) => buildCard_A())),
        SizedBox(height: 20,),
        Container(
          child: Text("Recommendations", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, backgroundColor: Colors.white),
          ),
          padding: EdgeInsets.only(left: 20),
        ),


        Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 180,
            color: color,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (context, _) => SizedBox(width: 12),
                itemBuilder: (context, index) => buildCard_C())),
      ],
    );
  }

  Widget buildCard_A() => Container(
        width: 130,
        height: 200,
        color: Colors.red,
      );

  Widget buildCard_B() => Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      );

  Widget buildCard_C() => Container(
    width: 140,
    height: 80,
    color: Colors.blue,
  );


}
