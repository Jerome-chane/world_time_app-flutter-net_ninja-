import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

   setupWorldTime() async {
     WorldTime instance = WorldTime(
         location: 'Berlin', flag: 'germany.png', url: '/europe/berlin');
     await instance.getTime();
     // Once data is fetched

    // This replace the current route with Home. !important! Replace the route, not push on top of it
     Navigator.pushReplacementNamed(context, '/home', arguments: { // arguments pass data to the next route
       'location': instance.location,
       'flag': instance.flag,
       'time': instance.time,
       'isDaytime': instance.isDaytime,
     });

   }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child: SpinKitThreeBounce( // loader
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
