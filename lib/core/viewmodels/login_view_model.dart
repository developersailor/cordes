import 'package:cordes/core/enum/viewstate.dart';
import 'package:cordes/core/services/authentication_service.dart';
import 'package:cordes/core/viewmodels/base_view_model.dart';
import 'package:cordes/locator.dart';

class LoginModel extends BaseViewModel {
  final AuthenticationService? _authenticationService =
      locator<AuthenticationService>();

  Future<bool> signInWithGoogle() async {
    setViewState(ViewState.Busy);

    final success = await _authenticationService?.signInWithGoogle();
    setViewState(ViewState.Idle);
    return success != null;
  }

  Future<bool> registerInEmail(String email, String password) async {
    setViewState(ViewState.Busy);

    var success =
        await _authenticationService?.registrationWithEmail(email, password);

    if (success == null) {
      showToast('Kullanici adi veya şifrenizi kontrol edin.');
    }
    setViewState(ViewState.Idle);
    return success?.user != null;
  }

  Future<bool> signInEmailAndPassword(String email, String password) async {
    setViewState(ViewState.Busy);
    var success = await _authenticationService?.singInWithEmailAndPassword(
        email, password);

    if (success == null) {
      showToast('Kullanici adi veya şifre hatalı.');
    }

    setViewState(ViewState.Idle);
    return success?.user != null;
  }
}
