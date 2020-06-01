import 'package:flutter/material.dart';
import 'quest.dart';

func() {
  FileUtils.readFromFile().then((contents) {
    print(contents);
  });
}
