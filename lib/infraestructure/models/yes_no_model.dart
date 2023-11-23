import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:yes_no_app/domain/domain.dart';

class YesNoModel {

  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromRawJson(String str) => YesNoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
    answer: json["answer"] ?? "yes",
    forced: json["forced"] ?? "no",
    image: json["image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  Message toMessageEntity() => Message(
    text: answer,
    fromWho: FromWho.hers,
    imageUrl: image
  );

}
