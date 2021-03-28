import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'post_api.g.dart';

@RestApi(baseUrl: "http://10.11.201.179:8080/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
  @GET("user")
  Future<Post> getTasks();
}
/*
@JsonSerializable(explicitToJson: true)
class Post {
  String name;
  int age;

  Post({this.name, this.age});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
*/

@JsonSerializable()
class Post {
  String name;
  int age;

  Post({
    required this.name,
    required this.age,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
