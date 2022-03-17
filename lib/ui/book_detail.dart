import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  BookDetailState createState() => BookDetailState();
}

class BookDetailState extends State<BookDetail> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
        //backgroundColor: Theme.of(context).primaryColor,
        body: Center(
      child: SizedBox(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Login Screen-OEE"),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/dashboardHome');
              },
              child: const Text("Login"))
        ],
      )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).primaryColor,
        body: _buildContent(context));
  }
}
