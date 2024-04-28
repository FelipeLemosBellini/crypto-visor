abstract class IApiRest {
  Future get(String path, {Map<String, dynamic>? query});
}
