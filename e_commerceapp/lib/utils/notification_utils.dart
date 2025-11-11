import 'package:e_commerceapp/models/notification_type.dart';
import 'package:flutter/material.dart';

class NotificationUtils{
  static IconData getNotificationIcon(NotificationType type)
  {
    switch(type)
        {

      case NotificationType.order:
        // TODO: Handle this case.
        return Icons.shopping_bag_outlined;
      case NotificationType.delivery:
        // TODO: Handle this case.
        return Icons.local_shipping_outlined;
      case NotificationType.promo:
        // TODO: Handle this case.
        return Icons.local_offer_outlined;
      case NotificationType.payment:
        // TODO: Handle this case.
        return Icons.payment_outlined;

    }
  }
  static Color getIconBackgroundColor(BuildContext context, NotificationType type)
  {
    switch(type)
    {

      case NotificationType.order:
        // TODO: Handle this case.
        return Theme.of(context).primaryColor.withOpacity(0.1);
      case NotificationType.delivery:
        // TODO: Handle this case.
        return Colors.green[100]!;
      case NotificationType.promo:
        // TODO: Handle this case.
        return Colors.orange[100]!;
      case NotificationType.payment:
        // TODO: Handle this case.
        return Colors.red[100]!;
    }
  }
  static Color getIconColor(BuildContext context, NotificationType type)
  {
  switch(type) {
    case NotificationType.order:
    // TODO: Handle this case.
      return Theme.of(context).primaryColor.withOpacity(0.1);
    case NotificationType.delivery:
    // TODO: Handle this case.
      return Colors.green;
    case NotificationType.promo:
    // TODO: Handle this case.
      return Colors.orange;
    case NotificationType.payment:
    // TODO: Handle this case.
      return Colors.red;

  }
}
}