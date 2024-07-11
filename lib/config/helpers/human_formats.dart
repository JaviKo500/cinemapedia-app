

import 'package:intl/intl.dart';

class HumanFormats {
  
  static String number( double value, [ int decimals = 0 ] ) {

    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en',
    ).format(value);

    return formattedNumber;
  }
}