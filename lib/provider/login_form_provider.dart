// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:formz/formz.dart';

// import '../shared/infraestructure/inputs/imputs.dart';

// final loginFormProvider = StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref){

//   final loginUserCallback = ref.watch(authProvider.notifier).loginUser;
  
//   return LoginFormNotifier(
//     loginUserCallback: loginUserCallback, 
//   );
// });

// class LoginFormNotifier extends StateNotifier<LoginFormState> {

//   final Function(String, String) loginUserCallback;

//   LoginFormProvider({
//     required this.loginUserCallbac
//     }): super(LoginFormState());

//     onEmailChange(String value){
//       final newEmail = Email.dirty(value);
//       state = state.copyWith(
//         email: newEmail,
//         isValid: Formz.validate([newEmail, state.password])
//       );
//     }

//     onPasswordChange(String value){
//       final newPassword = Password.dirty(value);
//       state = state.copyWith(
//         password: newPassword,
//         isValid: Formz.validate([newPassword, state.email])
//       );
//     }

//     onFormSubmit() async {
//       _toucheEveryField();

//       if (state.isValid) return;

//       state = state.copyWith(isPosting: true);

//       await loginUserCallback(state.email.value, state.password.value);

//       state = state.copyWith(isPosting: false);
//     }

//     _toucheEveryField(){
      
//       final email = Email.dirty(state.email.value);
//       final password = Password.dirty(state.password.value);

//       state = state.copyWith(
//         isFormPasted: true,
//         email: email,
//         password: password,
//         isValid: Formz.validate([email, password])
//       );
//     }
// }


// class LoginFormState{
//   final bool isPosting;
//   final bool isFormPasted;
//   final bool isValid;
//   final Email email;
//   final Password password;

//   LoginFormState({
//     this.isPosting = false, 
//     this.isFormPasted = false, 
//     this.isValid = false, 
//     this.email = const Email.pure(), 
//     this.password = const Password.pure(),
//   });

//   LoginFormState copyWith({
//     bool? isPosting,
//     bool? isFormPasted,
//     bool? isValid,
//     Email? email,
//     Password? password,
//   }) => LoginFormState(
//     isPosting: isPosting ?? this.isPosting,
//     isFormPasted: isFormPasted ?? this.isFormPasted,
//     isValid: isValid ?? this.isValid,
//     email: email ?? this.email,
//     password: password ?? this.password,
//   );

//   @override
//   String toString() {
//     return '''
//     LoginFormState: $LoginFormState
//     isPosting:      $isPosting
//     isFormPasted:   $isFormPasted
//     isValid:        $isValid
//     email:          $email
//     password:       $password
// ''';
//   }
// }