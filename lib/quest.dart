// To parse this JSON data, do
//
//     final questions = questionsFromJson(jsonString);

import 'dart:convert';

List<Questions> questionsFromJson(String str) =>
    List<Questions>.from(json.decode(str).map((x) => Questions.fromMap(x)));

String questionsToJson(List<Questions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Questions {
  String question;
  bool answer;
  String explanation;

  Questions({
    this.question,
    this.answer,
    this.explanation,
  });

  factory Questions.fromMap(Map<String, dynamic> json) => Questions(
        question: json["question"],
        answer: json["answer"],
        explanation: json["explanation"] == null ? null : json["explanation"],
      );

  Map<String, dynamic> toMap() => {
        "question": question,
        "answer": answer,
        "explanation": explanation == null ? null : explanation,
      };
}
