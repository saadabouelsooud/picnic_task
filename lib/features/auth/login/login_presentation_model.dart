import 'package:dartz/dartz.dart';
import 'package:flutter_demo/core/domain/model/user.dart';
import 'package:flutter_demo/core/utils/bloc_extensions.dart';
import 'package:flutter_demo/features/auth/domain/model/log_in_failure.dart';
import 'package:flutter_demo/features/auth/login/login_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class LoginPresentationModel implements LoginViewModel {
  /// Creates the initial state
  LoginPresentationModel.initial(
      // ignore: avoid_unused_constructor_parameters
      LoginInitialParams initialParams,
      ) : loginResult = const FutureResult.empty(), loginParams = LoginInitialParams();

  /// Used for the copyWith method
  LoginPresentationModel._({required this.loginResult,required this.loginParams});

  final FutureResult<Either<LogInFailure, User>> loginResult;
  LoginInitialParams loginParams;



  @override
  bool get isLoginEnabled => loginParams.userName.trim().isNotEmpty && loginParams.password.trim().isNotEmpty;

  @override
  bool get isLoading => loginResult.isPending();

  LoginPresentationModel copyWith({
    FutureResult<Either<LogInFailure, User>>? loginResult,
    LoginInitialParams? loginParams,
  }) {
    return LoginPresentationModel._(
      loginResult: loginResult ?? this.loginResult,
      loginParams: loginParams ?? this.loginParams,
    );
  }

  Future<LoginInitialParams> handleUsernameChange({required String user}) async{
    loginParams.userName = user;
    return loginParams;
  }

  Future<LoginInitialParams> handlePasswordChange({required String password}) async{
    loginParams.password = password;
    return loginParams;
  }
}

/// Interface to expose fields used by the view (page).
abstract class LoginViewModel {
  bool get isLoading;
  bool get isLoginEnabled;
}
