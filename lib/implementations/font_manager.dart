import 'dart:io';

import 'package:flutter/services.dart';
import 'package:infrastructure/interfaces/ifont_manager.dart';

class FontManager implements IFontManager {
  List<String> _fonts = [];

  @override
  Future<bool> loadFontFromFile(String location, String fontName) async {
    location =
        "/home/kristifor/Projects/shadowkeep/shadowkeep-presentation/shadowkeep-domain/lib/assets/fonts/Lobster-Regular.ttf";
    var data = await File(location).open();
    var contents = await data.read(await data.length());
    await FontLoader(fontName).loadFont(contents, fontName);

    return true;
  }

  @override
  Future<bool> removeFont(String name) {
    // TODO: implement removeFont
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getFonts() async {
    //TODO Add query to local storage module once it's finished

    _fonts = [
      "Loto",
      "Roboto",
      "Akatab-Black",
      "YsabeauInfant",
      "Ubuntu",
      "PlayfairDisplay",
    ];

    return _fonts;
  }
}
