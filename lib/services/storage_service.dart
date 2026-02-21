import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // සල්ලි දැම්ම දවස් ටික සේව් කරන්න
  static Future<void> saveSavedDate(String date) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedDates = prefs.getStringList('saved_dates') ?? [];
    if (!savedDates.contains(date)) {
      savedDates.add(date);
      await prefs.setStringList('saved_dates', savedDates);
    }
  }

  // සේව් කරපු දවස් ටික ආපහු ගන්න
  static Future<List<String>> getSavedDates() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('saved_dates') ?? [];
  }
}
