import 'package:infrastructure/interfaces/isession_manager.dart';

class SessionManager implements ISessionManager {
  @override
  late String customerAccessToken;

  @override
  late int customerId;
  @override
  late int deviceId;

  @override
  late String protoToken;

  @override
  late int selectedLocation;

  @override
  late String password;

  @override
  late String username;

  @override
  clear() {
    customerAccessToken = "";
    customerId = -1;
    protoToken = "";
    selectedLocation = -1;
    password = "";
    username = "";
  }

  @override
  late dynamic tmpData;

  @override
  late int projectId;
}
