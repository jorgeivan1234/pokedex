

// import 'package:flutter_riverpod/legacy.dart';

// import '../auth/entities/user.dart';
// import '../auth/infraestructure/errors/auth_errors.dart';

// final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref){

//   final authRepository = AuthRepositoryImpl();
//   final keyValueStorageService = KeyValueStorageServiceImpl();

//   return AuthNotifier(
//     authRepository: authRepository,
//     keyValueStorageService: keyValueStorageService
//   );
// });

// class AuthNotifier extends StateNotifier<AuthState>{

//   final AauthRepository authRepository;
//   final KeyValueStorageService keyValueStorageService;

//   AuthNotifier({
//     required this.authRepository, 
//     required this.keyValueStorageService
//   }): super (AuthState()){
//     checkAuthUser();
//   }


//   Future<void> loginUser(String email, String password) async {
//     await Future.delayed(const Duration(milliseconds: 500));

//     try{
//       final user = await authRepository.login(email, password);
//       _setLoggedUser(user);
//     } on CustomError catch(e) {
//       logout(e.message);
//     }catch (e){
//       logout('Error no controlado');
//     }
//   }

//   void registerUser(String email, String password) async {

//   }

//   void checkAuthUser() async {
//     final token = await keyValueStorageService.getValue <String>('token');

//     if(token == null) return logout();
//   }


//   void _setLoggedUser(User user ) async {
//     await keyValueStorageService.setKeyValue('token', user.token);

//     state = state.copyWith(
//       user: user,
//       authStatus: AuthStatus.authenticated,
//       errorMessage: '',
//     );
//   }

//   Future<void> logout([String? errorMessage]) async {
//     await keyValueStorageService.removeKey('token');

//     state = state.copyWith(
//       authStatus: AuthStatus.notauthenticated,
//       user: null,
//       errorMessage: errorMessage,
//     );
//   }
// }

// enum AuthStatus{checking,authenticated, notauthenticated}

// class AuthState {
//   final AuthStatus authStatus;
//   final User? user;
//   final String errorMessage;

//   AuthState({
//     this.authStatus =AuthStatus.checking, 
//     this.user, 
//     this.errorMessage = ''
//   });

//   AuthState copyWith({
//     AuthStatus? authStatus,
//     User? user,
//     String? errorMessage,
//   }) => AuthState(
//     authStatus: authStatus ?? this.authStatus,
//     user: user ?? this.user,
//     errorMessage: errorMessage ?? this.errorMessage
//   );

  
// }