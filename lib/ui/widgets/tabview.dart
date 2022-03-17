import 'package:flutter/material.dart';

class TaBarWidget2 extends StatefulWidget {
  const TaBarWidget2(this.tabDataChildren, this.tabHeading, this.tabIndex,
      {Key? key, this.onChange})
      : super(key: key);
  final List<Widget> tabDataChildren;
  final List<String> tabHeading;
  final int? tabIndex;
  final Function(int data)? onChange;
  @override
  _TaBarWidget2State createState() => _TaBarWidget2State();
}

class _TaBarWidget2State extends State<TaBarWidget2>
    with TickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: widget.tabHeading.length, vsync: this);
    controller!.animateTo(widget.tabIndex!);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.tabHeading.length,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50), // here the desired height
              child: AppBar(
                elevation: 1,
                titleSpacing: 30,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                centerTitle: false,
                title: TabBar(
                  onTap: (index) {
                    widget.onChange!(index);
                    setState(() {
                      controller!.animateTo(index);
                      controller!.index = index;
                    });
                  },
                  automaticIndicatorColorAdjustment: true,
                  labelPadding: const EdgeInsets.all(0),
                  indicator: const BoxDecoration(
                    color: Colors.red,
                  ),
                  controller: controller,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  labelStyle: Theme.of(context).textTheme.headline4,
                  indicatorPadding: const EdgeInsets.only(left: 10, right: 10),
                  tabs: widget.tabHeading
                      .map((value) => Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            padding: const EdgeInsets.all(5.0),
                            width: MediaQuery.of(context).size.width *
                                1 /
                                widget.tabHeading.length,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      displayTitle(value, context),
                                    ])),
                          ))
                      .toList(),
                ),
              )),
          body: SizedBox(
            height: double.maxFinite,
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: widget.tabDataChildren),
          ),
        ));
  }

  Text displayTitle(String value, BuildContext context) {
    return Text(
      widget.tabHeading[widget.tabHeading.indexOf(value)],
      style: TextStyle(fontSize: 15),
    );
  }
}
