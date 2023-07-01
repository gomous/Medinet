import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';



import 'dashboard_pages/ambulance_booking_page.dart';
import 'dashboard_pages/bookings_page.dart';
import 'dashboard_pages/find_nearest_hospitals.dart';
import 'dashboard_pages/medicine_order.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var color = Colors.white;

  late int page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  bodyFunction() {
    switch (page) {
      case 1:
        return AmbulanceBooking();
      case 2:
        return FindNearestHospital();
      case 3:
        return OrderMedicine();
      default:
        return BookingsPage();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bodyFunction(),
        bottomNavigationBar: BottomBarBubble(
          color: Colors.blue,
          backgroundColor: Colors.white,
          selectedIndex: page,
          items: [
            BottomBarItem(
                iconBuilder: (color) =>
                    Image.asset(
                      'assets/dashboard_navbar_icons/bookings.png',
                      color: color,
                      height: 30,
                      width: 30,
                    )),
            BottomBarItem(
                iconBuilder: (color) =>
                    Image.asset(
                      'assets/dashboard_navbar_icons/ambulance.png',
                      color: color,
                      height: 67,
                      width: 67,
                    )),
            BottomBarItem(
                iconBuilder: (color) =>
                    Image.asset(
                      'assets/dashboard_navbar_icons/location.png',
                      color: color,
                      height: 30,
                      width: 30,
                    )),
            BottomBarItem(
                iconBuilder: (color) =>
                    Image.asset(
                      'assets/dashboard_navbar_icons/medicine.png',
                      color: color,
                      height: 30,
                      width: 30,
                    )),
          ],
          onSelect: (index) {
            setState(()  {
              page = index;
            });
          },
        ));
  }
}