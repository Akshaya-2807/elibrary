class DigitalLibModel {
  DigitalLibModel({
    required this.output,
  });
  late final Output output;
  
  DigitalLibModel.fromJson(Map<String, dynamic> json){
    output = Output.fromJson(json['output']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['output'] = output.toJson();
    return _data;
  }
}

class Output {
  Output({
    required this.result,
  });
  late final Result result;
  
  Output.fromJson(Map<String, dynamic> json){
    result = Result.fromJson(json['Result']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Result'] = result.toJson();
    return _data;
  }
}

class Result {
  Result({
    required this.status,
    required this.bookDet,
  });
  late final String status;
  late final List<BookDet> bookDet;
  
  Result.fromJson(Map<String, dynamic> json){
    status = json['status'];
    bookDet = List.from(json['BookDet']).map((e)=>BookDet.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['BookDet'] = bookDet.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class BookDet {
  BookDet({
    required this.id,
    required this.contentType,
    required this.contentCode,
    required this.name,
    required this.imagePath,
    required this.fileType,
    required this.status,
  });
  late final String id;
  late final String contentType;
  late final String contentCode;
  late final String name;
  late final String imagePath;
  late final String fileType;
  late final String status;
  
  BookDet.fromJson(Map<String, dynamic> json){
    id = json['id'];
    contentType = json['content_type'];
    contentCode = json['content_code'];
    name = json['name'];
    imagePath = json['image_path'];
    fileType = json['file_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['content_type'] = contentType;
    _data['content_code'] = contentCode;
    _data['name'] = name;
    _data['image_path'] = imagePath;
    _data['file_type'] = fileType;
    _data['status'] = status;
    return _data;
  }
}