abstract class NotificationService {
  void showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  });

  void init();

  void background();

  void foreground();
}
