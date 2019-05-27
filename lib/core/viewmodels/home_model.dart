import 'package:flutter_provider/core/enums/viewstate.dart';
import 'package:flutter_provider/core/models/post.dart';
import 'package:flutter_provider/core/services/api.dart';
import 'package:flutter_provider/core/viewmodels/base_model.dart';
import 'package:flutter_provider/locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
