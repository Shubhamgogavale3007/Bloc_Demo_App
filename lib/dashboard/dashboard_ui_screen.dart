import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial_bloc/dashboard/dashboard_bloc.dart';
import 'package:trial_bloc/dashboard/dashboard_event.dart';
import 'package:trial_bloc/dashboard/dashboard_state.dart';
import 'package:trial_bloc/newScreen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
          actions: [
            BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
              print('current state :: ${state}');
              if (state is InitialState) {
                CircularProgressIndicator(
                  color: Colors.white,
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<DashboardBloc>(context).add(ChangeIcon());
                    print('state :: ${state}');
                  },
                  child: Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              );
            }),
          ],
        ),
        body: Column(
          children: [
            BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
              return ElevatedButton(
                  onPressed: () {
                    print('Elevated State :: ${State}');
                    if (state is OnNavigateScreen) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NewScreen()));
                    }
                  },
                  child: Text("Elevated Button Pressed"));
            }),
            ElevatedButton(onPressed: () {}, child: Text("Alert Dialig Shown")),
            ElevatedButton(
                onPressed: () {}, child: Text("Navigator Button Pressed"))
          ],
        ));
  }
}
