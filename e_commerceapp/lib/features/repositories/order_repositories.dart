import 'package:e_commerceapp/features/models/order.dart';

class OrderRepository{
  List<Order> getOrders()
  {
    return[
      Order(
        orderNumber:'123254',
        itemCount: 2,
        totalAmount: 2545,
        status: OrderStatus.active,
        imageUrl: 'aasets/images/shoe.png',
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),

      ),
    Order(
    orderNumber:'123255',
    itemCount: 2,
    totalAmount: 2545,
    status: OrderStatus.completted,
    imageUrl: 'aasets/images/shoe1.png',
    orderDate: DateTime.now().subtract(const Duration(hours: 3)),

    ),
  Order(
  orderNumber:'123256',
  itemCount: 2,
  totalAmount: 2545,
  status: OrderStatus.cancelled,
  imageUrl: 'aasets/images/laptop.png',
  orderDate: DateTime.now().subtract(const Duration(hours: 2)),

  ),



    ];
  }
  List<Order> getOrdersByStatus(OrderStatus status)
  {
    return getOrders().where((order) => order.status == status).toList();
  }


}