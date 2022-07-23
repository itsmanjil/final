import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class DashboadScreen extends StatefulWidget {
  const DashboadScreen({Key? key}) : super(key: key);

  @override
  State<DashboadScreen> createState() => _DashboadScreenState();
}

class _DashboadScreenState extends State<DashboadScreen> {
  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return const Scaffold(
              body: Center(
                child: Text('Dashboard'),
              ),
            );
          },
        );
      },
    );
  }
}
