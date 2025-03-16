import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getFirstLaunchStatus() async {
  // Use shared preferences to check if this is first launch
  final prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('first_launch') ?? true;

  if (isFirstLaunch) {
    // Set flag to false for next time
    await prefs.setBool('first_launch', false);
  }

  return isFirstLaunch;
}
