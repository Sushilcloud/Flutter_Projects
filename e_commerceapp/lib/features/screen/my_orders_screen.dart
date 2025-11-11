import 'package:e_commerceapp/features/models/order.dart';
import 'package:e_commerceapp/features/repositories/order_repositories.dart';
import 'package:e_commerceapp/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/order.dart';


class MyOrdersScreen extends StatelessWidget {
  final OrderRepository _repository=OrderRepository();

  MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness==Brightness.dark;

    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back_ios,
        color: isDark? Colors.white: Colors.black,),),

        title: Text('My Order',
        style: AppTextStyles.withColor(AppTextStyles.hi3,
        isDark? Colors.white: Colors.black),),

        bottom: TabBar(
          labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: isDark?Colors.grey[400]: Colors.grey[600],
            tabs: const[
          Tab(text: 'Active'),
          Tab(text: 'Completed'),
          Tab(text: 'Cancelled'),

        ]),
      ),

      body: TabBarView(children: [
        _buildOrderList(context, OrderStatus.active),
        _buildOrderList(context, OrderStatus.completted),
        _buildOrderList(context, OrderStatus.cancelled),
      ],
      ),
    ));
    }

    Widget _buildOrderList(BuildContext context, OrderStatus status){
      {
        final order=_repository.getOrdersByStatus(status);


        return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: order.length,
            itemBuilder: (context,index)=> OrderCard(
              order: order[index],
              onViewDetails:(){},
            )
        );

      }}
}
