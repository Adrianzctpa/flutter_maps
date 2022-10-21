class LocationUtil {
  static const googleApiKey = String.fromEnvironment('API_KEY');

  static String generateLocationPreviewImg({required double latitude, required double longitude}) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$googleApiKey";
  }
}