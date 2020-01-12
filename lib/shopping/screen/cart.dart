import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter/shopping/model/cart.dart';

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.display4),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CardList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
            _CardTotal()
          ],
        ),
      ),
    );
  }
}

class _CardTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle = Theme.of(context).textTheme.display4.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CardModel>(
                builder: (context, cart, child) =>
                    Text('\$${cart.totalPrice}', style: hugeStyle)),
            SizedBox(width: 24),
            FlatButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Buying not supported yet.')));
              },
              color: Colors.white,
              child: Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.title;
    var cart = Provider.of<CardModel>(context);

    return ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              title: Text(
                cart.items[index].name,
                style: itemNameStyle,
              ),
            ));
  }
}
