// Stock Market Project //

import 'dart:math' as Math;

final random = Math.Random();

class Stock {
  Stock(this.name, this.ticker, this.prices);

  String name;
  String ticker;
  List<double> prices;

  List<double> getPrices() {
    return prices;
  }

  double getLatestPrice() {
    return prices.last;
  }

  double getAveragePrice() {
    double sum = 0;
    for (double price in prices) {
      sum += price;
    }
    return sum / prices.length;
  }

  double getMinPrice() => prices.reduce(Math.min);
  double getMaxPrice() => prices.reduce(Math.max);
}

class MarketSimulator {
  MarketSimulator(this.startPrice, this.days);

  double startPrice;
  int days;

  List<double> generateRandomPrices(startPrice, days) {
    List<double> prices = [];

    double price = startPrice;
    for (int day = 1; day <= days; day++) {
      final change = (random.nextDouble() - 0.5) * 0.1;
      price = price * (1 + change);
      prices.add(price);
      print("Price on Day $day: ${price.toStringAsFixed(2)}");
    }
    return prices;
  }
}

class StockAnalyzer {
  StockAnalyzer(this.prices);

  List<double> prices;

  double calculateVolatility(List<double> prices) {
    if (prices.length < 2) {
      return 0.0;
    }

    final returns = <double>[];
    for (var i = 1; i < prices.length; i++) {
      final prev = prices[i - 1];
      final curr = prices[i];
      final r = (curr - prev) / prev;
      returns.add(r);
    }

    final mean = returns.reduce((a, b) => a + b) / returns.length;

    double sumSquaredDiffs = 0.0;
    for (final r in returns) {
      final diff = r - mean;
      sumSquaredDiffs += diff * diff;
    }
    final variance = sumSquaredDiffs / returns.length;

    return variance == 0 ? 0.0 : Math.sqrt(variance);
  }
}

void main() {
  double startPrice = 70.3;
  int days = 31;

  var marketSimulator = MarketSimulator(startPrice, days);
  List<double> prices = marketSimulator.generateRandomPrices(startPrice, days);

  var stock = Stock("Coca-Cola", "COKE", prices);
  print(
    "Average Price of Stock: ${stock.getAveragePrice().toStringAsFixed(2)}",
  );
  print("Current Price of Stock: ${stock.getLatestPrice().toStringAsFixed(2)}");
  print("Lowest Price: ${stock.getMinPrice()}");
  print("Highest Price: ${stock.getMaxPrice()}");

  var stockAnalyzer = StockAnalyzer(prices);
  print(
    "Volatility: ${stockAnalyzer.calculateVolatility(prices).toStringAsFixed(2)}",
  );
}
