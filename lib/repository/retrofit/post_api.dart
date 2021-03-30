import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'post_api.g.dart';

@RestApi(baseUrl: "http://localhost:8080/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
  @POST("user")
  Future<Post> getTasks(
      @Query("username") String username, @Query("password") String password);
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
  int id;
  String name;
  int age;
  String address;
  String outCode;
  String outMessage;

  Post(
      {required this.id,
      required this.name,
      required this.age,
      required this.address,
      required this.outCode,
      required this.outMessage});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
