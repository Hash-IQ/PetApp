/// [JsonModel] is an abstraction/interface for all the
/// models that can be coverted from json to a model and
/// back from model to json.
///
/// This interfaces helps to check wheater a specific model
/// can be used inside the api config class so that it has
///  `fromJson` method to it.
abstract class JsonModel<R> {
  R fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
