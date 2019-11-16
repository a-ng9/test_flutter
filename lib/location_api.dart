const GOOGLE_API_KEY = 'AIzaSyCdlZMsorenGx2j4gXDc-_TuVrL_Ol61g4';

class LocationAPI {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=600x650 &maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
