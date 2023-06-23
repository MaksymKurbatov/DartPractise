class CryptoCoinDetails {
  const CryptoCoinDetails(
      {required this.name,
      required this.priceInUSD,
      required this.imageURL,
      required this.highDay,
      required this.lowhDay});

  final String name;
  final double priceInUSD;
  final String imageURL;
  final double highDay;
  final double lowhDay;
}
