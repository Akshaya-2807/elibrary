import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildContent(BuildContext context) {
    return GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Container(
                height: 70,
                width: 100,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("e-Books"),
          centerTitle: true,
        ),
        // backgroundColor: Theme.of(context).primaryColor,
        body: _buildContent(context));
  }
}
