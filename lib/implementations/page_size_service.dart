import 'package:collection/collection.dart';
import 'package:domain/models/page_size.dart';
import 'package:infrastructure/interfaces/ipage_size_service.dart';

class PageSizeService implements IPageSizeService {
  final List<PageSize> _sizes = [
    PageSize(
      name: "A3 Portrait 297x420mm",
      width: 1122.519685,
      height: 1587.4015748,
    ),
    PageSize(
      name: "A3 Landscape 420x297mm",
      width: 1587.4015748,
      height: 1122.519685,
    ),
    PageSize(
      name: "A4 Portrait 210x297mm",
      width: 793.7007874,
      height: 1122.519685,
    ),
    PageSize(
      name: "A4 Landscape 297x210mm",
      width: 1122.519685,
      height: 793.7007874,
    ),
    PageSize(
      name: "A5 Portrait 210x297mm",
      width: 559.37007874,
      height: 1122.519685,
    ),
    PageSize(
      name: "A5 Landscape 297x210mm",
      width: 1122.519685,
      height: 559.37007874,
    ),
    PageSize(
      name: "A6 Portrait 105x148mm",
      width: 396.8503937,
      height: 559.37007874,
    ),
    PageSize(
      name: "A6 Landscape 148x105mm",
      width: 559.37007874,
      height: 396.8503937,
    ),
    PageSize(
      name: "Royal Portrait 156x234mm",
      width: 589.60629921,
      height: 884.40944882,
    ),
    PageSize(
      name: "Royal Landscape 234x156mm",
      width: 884.40944882,
      height: 589.60629921,
    ),
    PageSize(
      name: "Trade paperback Portrait 129x198mm",
      width: 487.55905512,
      height: 748.34645669,
    ),
    PageSize(
      name: "Trade paperback Landscape 198x129mm",
      width: 748.34645669,
      height: 487.55905512,
    ),
  ];

  @override
  Future<bool> addSize(String name, double width, double height) async {
    if (_sizes.firstWhereOrNull((element) => element.name == name) != null) {
      return false;
    }

    _sizes.add(PageSize(name: name, width: width, height: height));

    return true;
  }

  @override
  List<PageSize> getSizes() {
    return _sizes;
  }

  @override
  Future<bool> removeSize(String name) async {
    var exists = _sizes.firstWhereOrNull((element) => element.name == name);

    if (exists == null) return false;

    //TODO add call to local storage.
    _sizes.remove(exists);

    return true;
  }
}
