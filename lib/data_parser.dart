import 'dart:convert';

import 'package:flutter/material.dart';

class DataParser {
  BuildContext context;
  DataParser(BuildContext context) : this.context = context;

  Future<List> getData() async {
    List _appData = await jsonDecode(await DefaultAssetBundle.of(context)
        .loadString("/assets/apps_data.json"));
    return _appData;
  }
}
