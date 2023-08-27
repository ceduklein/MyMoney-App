// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupController on _SignupController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SignupController.isLoading', context: context);

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
      Atom(name: '_SignupController.isSuccess', context: context);

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

  late final _$checkDataAsyncAction =
      AsyncAction('_SignupController.checkData', context: context);

  @override
  Future<void> checkData(
      {required String nameController,
      required String emailController,
      required String passwordController,
      required String passwordCheckController,
      required BuildContext buildContext}) {
    return _$checkDataAsyncAction.run(() => super.checkData(
        nameController: nameController,
        emailController: emailController,
        passwordController: passwordController,
        passwordCheckController: passwordCheckController,
        buildContext: buildContext));
  }

  late final _$senDataAsyncAction =
      AsyncAction('_SignupController.senData', context: context);

  @override
  Future<void> senData() {
    return _$senDataAsyncAction.run(() => super.senData());
  }

  late final _$validateAsyncAction =
      AsyncAction('_SignupController.validate', context: context);

  @override
  Future<void> validate() {
    return _$validateAsyncAction.run(() => super.validate());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isSuccess: ${isSuccess}
    ''';
  }
}
