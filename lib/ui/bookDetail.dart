import 'package:elibrary/bloc/diditallib_bloc.dart';
import 'package:elibrary/model/tesla_model.dart';
import 'package:elibrary/ui/widgets/tabview.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  BookDetailState createState() => BookDetailState();
}

class BookDetailState extends State<BookDetail> {
  late DigitalLibBloc digitalBloc;
  @override
  void initState() {
    super.initState();
    digitalBloc = DigitalLibBloc();
    digitalBloc.getDigitalLib();
  }

  int i = 0;
  var datas;
  Widget _buildContent(BuildContext context) {
    return StreamBuilder<DigitalLibModel>(
        stream: digitalBloc.digitalLibStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) datas = snapshot.data?.output.result.bookDet;
          return TaBarWidget2([
            snapshot.connectionState != ConnectionState.waiting
                ? ListView.builder(
                    itemCount: datas.length ?? 0,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          height: 100,
                          child: Row(
                            children: [
                              if (datas != null)
                                Image.network(
                                  datas[index].imagePath,
                                  height: 100,
                                ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(datas[index].name),
                                      /*   Text(datas[index].contentType),
                                      Text(datas[index].contentType),
                                      Text(datas[index].contentCode),
                                      Text(datas[index].fileType), */
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        child: Text(datas[index].status),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.teal,
                                          onPrimary: Colors.white,
                                          shape: const BeveledRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                        ),
                                        onPressed: () {
                                          print('Pressed');
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                : Container(
                    alignment: FractionalOffset.center,
                    child: const CircularProgressIndicator(
                        backgroundColor: Colors.black87,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white)),
                  ),
            Container(),
            Container(),
            Container(),
          ], [
            "ebooks",
            "videos",
            "Others",
            "Downloads"
          ], i);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).primaryColor,
        body: _buildContent(context));
  }
}
