import 'package:flutter/material.dart';
import 'package:stockmarketapp/Screens/profile.dart';
import 'package:yahoofin/yahoofin.dart';
import '../Authentication/Methods.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  int navigationIndex = 0;
  final TextEditingController _search = TextEditingController();
  List<String> stocks = List<String>.empty(growable: true);
  List<double?> prices = List<double?>.empty(growable: true);
  List<String?> priceChanges = List<String?>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    void getStock() async {
      setState(() {
        isLoading = true;
      });
      stocks.add(_search.text);
      var yfin = YahooFin();
      StockInfo info = yfin.getStockInfo(ticker: _search.text);
      StockQuote price = await yfin.getPrice(stockInfo: info);
      StockQuote priceChange = await yfin.getPriceChange(stockInfo: info);
      prices.add(price.currentPrice);
      priceChanges
          .add(priceChange.regularMarketChangePercent?.toStringAsFixed(2));
      setState(() {
        isLoading = false;
        _search.clear();
      });
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aktien"),
        actions: [
          IconButton(
              onPressed: () => logout(context), icon: const Icon(Icons.logout))
        ],
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: const CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height / 14,
                    width: size.width / 1.1,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                        hintText: "Aktien Suchen",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                ElevatedButton(
                  onPressed: getStock,
                  child: const Text("Suchen"),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: stocks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(stocks[index]),
                        subtitle: Text(prices[index].toString()),
                        trailing: Text(priceChanges[index].toString() + "%"),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  ),
                )
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
          ),
        ],
        onTap: (index) {
          setState((){
            navigationIndex = index;
            Navigator.push(context, MaterialPageRoute(builder: (_) => profile()));
          });
        },
      ),
    );
  }
}
