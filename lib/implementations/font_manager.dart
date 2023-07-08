import 'dart:io';

import 'package:flutter/services.dart';
import 'package:infrastructure/interfaces/ifont_manager.dart';

class FontManager implements IFontManager {
  FontManager();

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
}
