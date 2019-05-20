import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import '../model/friend_model.dart';

String url = "https://jsonplaceholder.typicode.com/users";

Future<List<Friend>> getAllFriend() async {
  final response = await http.get(url);
  print(response.body);
  return allFriendFromJson(response.body);
}

Future<Friend> getFriend() async{
  final response = await http.get('$url/1');
  return friendFromJson(response.body);
}

Future<http.Response> createFriend(Friend post) async{
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: friendToJson(post)
  );
  return response;
}
