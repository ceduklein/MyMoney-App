// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PersonalRegisterController on _PersonalRegisterController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_PersonalRegisterController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isSuccessAtom =
      Atom(name: '_PersonalRegisterController.isSuccess', context: context);

  @override
  bool get isSuccess {
    _$isSuccessAtom.reportRead();
    return super.isSuccess;
  }

  @override
  set isSuccess(bool value) {
    _$isSuccessAtom.reportWrite(value, super.isSuccess, () {
      super.isSuccess = value;
    });
  }

  late final _$loadUserAsyncAction =
      AsyncAction('_PersonalRegisterController.loadUser', context: context);

  @override
  Future<UserModel> loadUser() {
    return _$loadUserAsyncAction.run(() => super.loadUser());
  }

  late final _$checkDataAsyncAction =
      AsyncAction('_PersonalRegisterController.checkData', context: context);

  @override
  Future<void> checkData(
      {required String nameController,
      required String emailController,
      required String limitValueController,
      required BuildContext buildContext}) {
    return _$checkDataAsyncAction.run(() => super.checkData(
        nameController: nameController,
        emailController: emailController,
        limitValueController: limitValueController,
        buildContext: buildContext));
  }

  late final _$sendDataAsyncAction =
      AsyncAction('_PersonalRegisterController.sendData', context: context);

  @override
  Future<void> sendData() {
    return _$sendDataAsyncAction.run(() => super.sendData());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isSuccess: ${isSuccess}
    ''';
  }
}
