import 'dart:async';

import 'package:elibrary/model/tesla_model.dart';
import 'package:elibrary/repository/digitallib_repo.dart';
import 'package:flutter/cupertino.dart';


class DigitalLibBloc {
  late DigitalLibRepository digitalLibRepository;

  StreamController? digitalLibController;

  StreamSink<DigitalLibModel> get digitalLibSink =>
      digitalLibController!.sink as StreamSink<DigitalLibModel>;

  Stream<DigitalLibModel> get digitalLibStream =>
      digitalLibController!.stream as Stream<DigitalLibModel>;

  DigitalLibBloc() {
    digitalLibRepository = DigitalLibRepository();
    digitalLibController = StreamController<DigitalLibModel>();
  }

  getDigitalLib() async {
    try {
      DigitalLibModel response = await digitalLibRepository.data();
      digitalLibSink.add(response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  dispose() {
    digitalLibController?.close();
  }
}
