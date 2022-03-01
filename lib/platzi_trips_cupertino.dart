import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/ui/screens/home_trips.dart';
import 'package:platzi_trips_app/Place/ui/screens/search_trips.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/ui/screens/profile_trips.dart';

class PlatziTripsCupertino extends StatelessWidget {
  const PlatziTripsCupertino({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFFF4361A)), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Color(0xFFF4361A)), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Color(0xFFF4361A)), label: ""),
        ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  // return BlocProvider<UserBloc>(bloc:null, child: ,);
                  return HomeTrips();
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  // return BlocProvider<UserBloc>(bloc:null, child: ,);
                  return SearchTrips();
                },
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                    bloc: UserBloc(),
                    child: ProfileTrips(),
                  );
                },
              );
            default:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                    bloc: UserBloc(),
                    child: ProfileTrips(),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
