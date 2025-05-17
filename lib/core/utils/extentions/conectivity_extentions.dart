import 'package:connectivity_plus/connectivity_plus.dart';

extension ColorExtention on List<ConnectivityResult> {
  bool hasInternetConnection() {
    final bool connected =
        where(
          (element) =>
              element == ConnectivityResult.wifi ||
              element == ConnectivityResult.mobile ||
              element == ConnectivityResult.ethernet,
        ).isNotEmpty;

    return connected;
  }
}
