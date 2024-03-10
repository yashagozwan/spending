import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:spending/core/services/notification_service.dart';

@LazySingleton(as: NotificationService)
class NotificationServiceImpl implements NotificationService {
  final FlutterLocalNotificationsPlugin _plugin;
  final Logger _logger;

  NotificationServiceImpl(this._plugin, this._logger);

  @override
  void background() {
    // TODO: implement background
  }

  @override
  void foreground() {
    // TODO: implement foreground
  }

  @override
  void showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) {
    const android = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      priority: Priority.max,
    );

    const iOS = DarwinNotificationDetails();
    const details = NotificationDetails(android: android, iOS: iOS);
    _plugin.show(id, title, body, details, payload: payload);
  }

  @override
  void init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings();
    const initialize = InitializationSettings(android: android, iOS: iOS);
    final result = await _plugin.initialize(initialize);
    _logger.d('Local Notification: $result');
  }
}
