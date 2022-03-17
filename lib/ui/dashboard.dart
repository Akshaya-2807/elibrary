import 'package:auto_route/auto_route.dart';
import 'package:elibrary/bloc/diditallib_bloc.dart';
import 'package:elibrary/model/tesla_model.dart';
import 'package:elibrary/repository/digitallib_repo.dart';
import 'package:elibrary/ui/bookDetail.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  late DigitalLibBloc digitalBloc;
  @override
  void initState() {
    super.initState();
    digitalBloc = DigitalLibBloc();
    digitalBloc.getDigitalLib();
  }

  List<Map<dynamic, dynamic>> datas = [
    {
      "image": "assets/images/digital library.png",
      "title": "Digital Library",
      "subtitle": "Access e-books,videos,lecture notes,etc.,"
    },
    {
      "image": "assets/images/courses.png",
      "title": "Courses",
      "subtitle": "Enroll to online certification courses"
    },
    {
      "image": "assets/images/events.png",
      "title": "Events",
      "subtitle": "List of college events"
    },
    {
      "image": "assets/images/meetings.png",
      "title": "Meetings",
      "subtitle": "Take up various online tests"
    },
    {
      "image": "assets/images/diss board.png",
      "title": "Discussion board",
      "subtitle": "Important college events"
    },
    {
      "image": "assets/images/members.png",
      "title": "Members",
      "subtitle": "Connect with institution's members"
    },
  ];

  Widget _buildContent(BuildContext context) {
    return GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: datas.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: InkWell(
              onTap: () {
                context.navigateNamedTo("/book-detail");
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Container(
                  height: 70,
                  width: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        datas[index]["image"],
                        height: 90,
                      ),
                      Text(
                        datas[index]["title"],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        datas[index]["subtitle"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13.5,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
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
