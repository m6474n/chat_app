class SessionController {
  static final SessionController _session = SessionController._internal();

  static String? userId;
  factory SessionController() {
    return _session;
  }
  SessionController._internal();
}
