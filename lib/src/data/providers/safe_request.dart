Future<dynamic> safeRequest(Future<dynamic> Function() request,
    {bool isNeedShowToast = false}) async {
  try {
    return await request();
  } catch (e, s) {
    print(e);
    print(s);

    throw Exception();
  }
}
