

Map<String, dynamic> castToMapStringDynamic(Map<Object?, Object?> rawMap) {
  return rawMap.map((key, value) {
    return MapEntry(key.toString(), value);
  });
}
