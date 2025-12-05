/// Application asset paths
class AppAssets {
  AppAssets._(); // Private constructor to prevent instantiation

  // Base paths
  static const String _images = 'images';
  static const String _icons = 'icons';
  static const String _logos = 'logos';

  // Images
  static const String gameBoy = '$_images/Game-Boy-FL.jpg';
  static const String placeholder = '$_images/placeholder.png';

  // Icons
  static const String gamepadIcon = '$_icons/gamepad.png';
  static const String consoleIcon = '$_icons/console.png';
  static const String pcIcon = '$_icons/pc.png';

  // Logos
  static const String appLogo = '$_logos/replay_logo.png';
  static const String appLogoWhite = '$_logos/replay_logo_white.png';

  // Categories
  static const String electronics = '$_images/categories/electronics.png';
  static const String games = '$_images/categories/games.png';
  static const String accessories = '$_images/categories/accessories.png';
}
