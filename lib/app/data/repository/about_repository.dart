import '../about_model.dart';
import '../providers/about_provider.dart';

class AboutRepository {
  static final AboutProvider _aboutProvider = AboutProvider();

  static Future<About?> getAbout() => _aboutProvider.getAbout();
}
