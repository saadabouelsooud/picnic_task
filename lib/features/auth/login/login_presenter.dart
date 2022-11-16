import 'package:bloc/bloc.dart';
import 'package:flutter_demo/core/domain/model/displayable_failure.dart';
import 'package:flutter_demo/core/utils/bloc_extensions.dart';
import 'package:flutter_demo/core/utils/either_extensions.dart';
import 'package:flutter_demo/features/auth/domain/use_cases/log_in_use_case.dart';
import 'package:flutter_demo/features/auth/login/login_navigator.dart';
import 'package:flutter_demo/features/auth/login/login_presentation_model.dart';

class LoginPresenter extends Cubit<LoginViewModel> {
  LoginPresenter(
  LoginPresentationModel super.model,
  this.navigator,
  this.logInUseCase,
  );

  final LoginNavigator navigator;
  final LogInUseCase logInUseCase;

  // ignore: unused_element
  LoginPresentationModel get _model => state as LoginPresentationModel;

  void login() {
    logInUseCase
        .execute(username: _model.loginParams.userName, password: _model.loginParams.password) //
        .observeStatusChanges(
          (result) => emit(
        _model.copyWith(loginResult: result),
      ),
    )
        .asyncFold(
          (fail) => navigator.showError(
        DisplayableFailure(title: 'Fail!', message: 'Wrong Username or password!'),
      ),
          (success) => navigator.showAlert(
        title: 'Success!',
        message: 'LoggedIn Successfully!',
      ),
    );
  }

  Future<void> handleUsernameChange({required String user}) async{
    await _model.handleUsernameChange(user: user)
        .observeStatusChanges((result) {
      emit(_model.copyWith(loginParams: result.result));
    });
  }

  Future<void> handlePasswordChange({required String password}) async{
    await _model.handlePasswordChange(password: password)
        .observeStatusChanges((result) {
      emit(_model.copyWith(loginParams: result.result));
    });
  }
}