import 'package:e_commerceapp/models/notification_type.dart';

class NotificationRepositories
{
  List<NotificationItem> getNotification()
  {

    return const [
      NotificationItem(
          title: 'Order Confirmed',
          message: 'Your order has been confirmed',
          time: '2 minute ago',
          type: NotificationType.order,isRead: true,
      ),
      NotificationItem(
        title: 'Special Offer',
        message: 'Get 20% off on all shoes this weekend',
        time: '1 hour ago',
        type: NotificationType.promo,isRead: true,
      ),
      NotificationItem(
        title: 'Out for delivery',
        message: 'Your order #12323 is out for delivery',
        time: '2 minute ago',
        type: NotificationType.delivery,isRead: true,
      ),

      NotificationItem(
        title: 'Payment successfully',
        message: 'Payment for order #12323 has been successfully',
        time: '2 minute ago',
        type: NotificationType.promo,isRead: true,
      ),

    ];
  }
}