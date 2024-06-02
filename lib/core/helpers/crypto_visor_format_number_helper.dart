abstract class CryptoVisorFormatNumberHelper {
  static double formatNumber(dynamic number){
    if(number is int){
      return double.parse(number.toDouble().toStringAsFixed(2));
    }
    return double.parse(number.toStringAsFixed(2));
  }
}