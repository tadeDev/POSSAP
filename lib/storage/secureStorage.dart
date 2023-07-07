import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LocalStorage{

  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  // STORE ID
  storeUserId(String userId) async{
    try {
      await _flutterSecureStorage.write(key: "UserId", value: userId);
      print("Saved Id");
    } catch (e) {
      print(e);
      print("Could not save id");
    }
  }

  // FETCH ID
  Future<String> fetchUserId() async{
    String userId = await _flutterSecureStorage.read(key: "UserId") ?? "";
    print("Fetched Id successful");

    return userId;
  }

  // STORE TOKEN
  storeUserToken(String token) async{
    try {
      await _flutterSecureStorage.write(key: "Token", value: token);
      print("Saved Id");
    } catch (e) {
      print(e);
      print("Could not save token");
    }
  }

  // FETCH TOKEN
  Future<String> fetchUserToken() async{
    String token = await _flutterSecureStorage.read(key: "Token") ?? "";
    print("Fetched token successful");

    return token;
  }

  // STORE RIGHT THUMB
  storeUserRightThumb(String thumb) async{
    try {
      await _flutterSecureStorage.write(key: "RightThumb", value: thumb);
      print("Saved!!!");
    } catch (e) {
      print(e);
      print("Could not save!!!");
    }
  }

  // FETCH THUMB
  Future<String> fetchUserRightThumb() async{
    String thumb = await _flutterSecureStorage.read(key: "RightThumb") ?? "";
    print("Fetched successful");

    return thumb;
  }

  // STORE RIGHT INDEX
  storeUserRightIndex(String index) async{
    try {
      await _flutterSecureStorage.write(key: "RightIndex", value: index);
      print("Saved!!!");
    } catch (e) {
      print(e);
      print("Could not save!!!");
    }
  }

  // FETCH INDEX
  Future<String> fetchUserRightIndex() async{
    String index = await _flutterSecureStorage.read(key: "RightIndex") ?? "";
    print("Fetched successful");

    return index;
  }

  // STORE right middle
  storeUserRightMiddle(String middle) async{
    try {
      await _flutterSecureStorage.write(key: "RightMiddle", value: middle);
      print("Saved!!!");
    } catch (e) {
      print(e);
      print("Could not save!!!");
    }
  }

  // FETCH middle
  Future<String> fetchUserRightMiddle() async{
    String middle = await _flutterSecureStorage.read(key: "RightMiddle") ?? "";
    print("Fetched successful");

    return middle;
  }

  // STORE RIGHT RING
  storeUserRightRing(String ring) async{
    try {
      await _flutterSecureStorage.write(key: "RightRing", value: ring);
      print("Saved!!!");
    } catch (e) {
      print(e);
      print("Could not save!!!");
    }
  }

  // FETCH RING
  Future<String> fetchUserRightRing() async{
    String ring = await _flutterSecureStorage.read(key: "RightRing") ?? "";
    print("Fetched successful");

    return ring;
  }

  // STORE RIGHT PINKY
  storeUserRightPinky(String pinky) async{
    try {
      await _flutterSecureStorage.write(key: "RightPinky", value: pinky);
      print("Saved!!!");
    } catch (e) {
      print(e);
      print("Could not save!!!");
    }
  }

  // FETCH PINKY
  Future<String> fetchUserRightPinky() async{
    String pinky = await _flutterSecureStorage.read(key: "RightPinky") ?? "";
    print("Fetched successful");

    return pinky;
  }


  // STORE Left THUMB
  storeUserLeftThumb(String thumb) async{
    try {
      await _flutterSecureStorage.write(key: "LeftThumb", value: thumb);
      print("Saved!!!");
    } catch (e) {
      print(e);
      print("Could not save!!!");
    }
  }

  // FETCH THUMB
  Future<String> fetchUserLeftThumb() async{
    String thumb = await _flutterSecureStorage.read(key: "LeftThumb") ?? "";
    print("Fetched successful");

    return thumb;
  }

  // STORE Left INDEX
  storeUserLeftIndex(String index) async{
    try {
      await _flutterSecureStorage.write(key: "LeftIndex", value: index);
      print("Saved!!!");
    } catch (e) {
      print(e);
      print("Could not save!!!");
    }
  }

  // FETCH INDEX
  Future<String> fetchUserLeftIndex() async{
    String index = await _flutterSecureStorage.read(key: "LeftIndex") ?? "";
    print("Fetched successful");

    return index;
  }

  // STORE Left middle
  storeUserLeftMiddle(String middle) async{
    try {
      await _flutterSecureStorage.write(key: "LeftMiddle", value: middle);
      print("Saved!!!");
    } catch (e) {
      print(e);
      print("Could not save!!!");
    }
  }

  // FETCH middle
  Future<String> fetchUserLeftMiddle() async{
    String middle = await _flutterSecureStorage.read(key: "LeftMiddle") ?? "";
    print("Fetched successful");

    return middle;
  }

  // STORE Left RING
  storeUserLeftRing(String ring) async{
    try {
      await _flutterSecureStorage.write(key: "LeftRing", value: ring);
      print("Saved!!!");
    } catch (e) {
      print(e);
      print("Could not save!!!");
    }
  }

  // FETCH RING
  Future<String> fetchUserLeftRing() async{
    String ring = await _flutterSecureStorage.read(key: "LeftRing") ?? "";
    print("Fetched successful");

    return ring;
  }

  // STORE Left PINKY
  storeUserLeftPinky(String pinky) async{
    try {
      await _flutterSecureStorage.write(key: "LeftPinky", value: pinky);
      print("Saved!!!");
    } catch (e) {
      print(e);
      print("Could not save!!!");
    }
  }

  // FETCH PINKY
  Future<String> fetchUserLeftPinky() async{
    String pinky = await _flutterSecureStorage.read(key: "LeftPinky") ?? "";
    print("Fetched successful");

    return pinky;
  }

  // STORE Image
  storeFacialImage(String image) async{
    try {
      await _flutterSecureStorage.write(key: "Image", value: image );
      print("Saved!!!");
    } catch (e) {
      print(e);
      print("Could not save!!!");
    }
  }

  // FETCH Image
  Future<String> fetchFacialImage() async{
    String image = await _flutterSecureStorage.read(key: "Image") ?? "";
    print("Fetched successful");

    return image;
  }


  // DELETE USER FROM STORAGE
  Future<void> deleteUserStorage() async{
    await _flutterSecureStorage.deleteAll();
    print("Deleted Storage :)");
  }
  
}