import 'package:mylist/app/models/user_model.dart';
import 'package:mylist/app/services/http_manager.dart';

class UserRepository {
  HttpManager httpManager = HttpManager();

  Future<List<UserModel>> getAll() async {
    final response = await httpManager.request(
      url: "https://ilearn.appke.com.br/api/users",
      method: HttpMethods.get,
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<UserModel> userList = UserModel.fromList(list);

      return userList;
    } else {
      return [];
    }
  }

  Future<UserModel> getById(int id) async {
    UserModel model = UserModel();

    final response = await httpManager.request(
      url: "https://ilearn.appke.com.br/api/categories/$id",
      method: HttpMethods.get,
    );

    if (response['data'] != null) {
      model = UserModel.fromJson(response['data']);
    }

    return model;
  }
}
