import 'package:flutter/foundation.dart';
import 'package:haggle_x/utils/notifier.dart';

import 'auth_service.dart';

class MainAppProvider with ChangeNotifier, AuthService, ReceiveMoneyNotifier {}
