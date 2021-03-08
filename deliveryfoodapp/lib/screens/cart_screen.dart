import 'package:deliveryfoodapp/data/data.dart';
import 'package:deliveryfoodapp/models/order.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double _total = 0;
    currentUser.cart.forEach((order) {
      return _total += order.quantity * order.food.price;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart (${currentUser.cart.length})',
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(bottom: 30),
        physics: BouncingScrollPhysics(),
        itemCount: currentUser.cart.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _buildCartItem(order);
          }
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Estimated Delivery Time',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '25 min',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$${_total.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.green[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 70,)
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
            height: 1,
          );
        },
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration:
        BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
          BoxShadow(color: Colors.black26, offset: Offset(0, -1), blurRadius: 6)
        ]),
        child: TextButton(
          child: Text(
            'CHECKOUT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 170,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(order.food.imageUrl),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                            Border.all(width: 0.8, color: Colors.black54),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                order.quantity.toString(),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    '\$${order.quantity * order.food.price}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}