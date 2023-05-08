
import 'package:flutter/material.dart';
import 'package:stay/widgets/body.dart';
import 'package:stay/widgets/homeBar.dart';
import 'package:stay/const.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    Future<Position> determinePosition() async {
        LocationPermission permission;
        permission = await Geolocator.checkPermission();
        if(permission == LocationPermission.denied){
          permission = await Geolocator.requestPermission();
          if(permission == LocationPermission.denied){                     
            return Future.error("error");
          }
        }
        return await Geolocator.getCurrentPosition();
      }

    void getCurrentPosition() async {
      Position position = await determinePosition();
      print(position.latitude);
      print(position.longitude);
     

    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar:buildAppBar(),
        body: Body(),
        /*bottomNavigationBar: HomeBar(),*/
      );
  }

    AppBar buildAppBar() {
      return AppBar(
        actions: [
          IconButton(onPressed: (){getCurrentPosition();}, icon: Icon(Icons.add_location))
        ],
        backgroundColor: kPrimaryColor,
      );
    }

}