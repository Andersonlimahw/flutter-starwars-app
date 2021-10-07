import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_images.dart';
import 'package:lemonstarwars/profile/profile_repository.dart';
import 'package:lemonstarwars/profile/profile_state.dart';
import 'package:lemonstarwars/shared/models/user_model.dart';

class ProfileController {
  final stateNotifier = ValueNotifier<ProfileState>(ProfileState.empty);
  set state(ProfileState state) => stateNotifier.value = state;
  ProfileState get state => stateNotifier.value;

  UserModel? user;
  final repository = ProfileRepository();

  void getUser() async {
    state = ProfileState.loading;
    print("ProfileController.getUser(): Starts");   
    user = await repository.getUser().then((value) => value);
    // Insert Apenas para testes, TODO: Adicionar modo de criação de conta.
    if (user == null) {
      state = ProfileState.loading;
      print(
          "ProfileController.getUser(): User not found, creating a new user with default values.");
      final defaultUser = UserModel(
          image: AppImages.userProfileAvatar,
          email: '...',
          name: 'Luke skywalker',
          nickName: '...');
      insertUser(user: defaultUser);
      user = await repository.getUser().then((value) => value);
      state = ProfileState.success;
    }
    print("ProfileController.getUser(): Success, user => ${user.toString()}");
    state = ProfileState.success;
  }

  void insertUser({required UserModel user}) async {
    state = ProfileState.loading;

    print("ProfileController.insertUser(user: ${user.toString()}): Starts");
    await repository.insertUser(user: user);
    print("ProfileController.insertUser(user: ${user.toString()}): Success");

    state = ProfileState.success;
  }

  void deleteUser() async {
    state = ProfileState.loading;
    final userResult = await repository.getUser().then((value) => value);
    if(userResult != null) {
      print("ProfileController.deleteUser(user: ${userResult.toString()}): Starts");
      await repository.delete(id: userResult.id!, tableName: 'user');
      print("ProfileController.deleteUser(user: ${userResult.toString()}): Success");
    }
    state = ProfileState.success;
  }
}
