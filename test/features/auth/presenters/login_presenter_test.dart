import 'package:flutter_demo/features/auth/login/login_initial_params.dart';
import 'package:flutter_demo/features/auth/login/login_presentation_model.dart';
import 'package:flutter_demo/features/auth/login/login_presenter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/auth_mock_definitions.dart';

void main() {
  late LoginPresentationModel model;
  late LoginPresenter presenter;
  late MockLoginNavigator navigator;
  late MockLogInUseCase useCase;

  test(
    'sample test',
    () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = LoginPresentationModel.initial(LoginInitialParams());
    navigator = MockLoginNavigator();
    useCase = MockLogInUseCase();
    presenter = LoginPresenter(
      model,
      navigator,
      useCase,
    );
  });
}
