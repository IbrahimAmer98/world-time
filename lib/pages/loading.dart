import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'grmany.png',url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });

  }
  void initState() {
    super.initState();
    setupWorldTime();

  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(

        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),

      ),
    );
  }
}
