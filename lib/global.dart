import 'package:courseapp/common/service/storage_service.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    /// "WidgetsFlutterBinding.ensureInitialized();": This line ensures that the necessary bindings for the Flutter widgets are initialized before the application starts.
    WidgetsFlutterBinding.ensureInitialized();

    /// <await Firebase.initializeApp();>: This line initializes Firebase.
    /// It's an asynchronous operation, so it uses await to wait for Firebase to initialize before proceeding
    await Firebase.initializeApp();
    storageService = await StorageService().init();
  }
}
