Future<Null> local(String method) async {
  try {
    var result = await platform.invokeMethod(method);
    print(result);
  } on PlatformException catch (e) {
    print("Error while connecting to android code");
    print(e.toString());
  }
}
