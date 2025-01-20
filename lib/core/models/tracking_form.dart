class TrackingForm {
  late String id;
  late String institutionId;
  late String userId;
  late String nameProduct;
  late int quantity;
  late String productCulture;
  late String numlot;
  late String manufacturingDate;
  late String invoice;
  late String weight;

  TrackingForm({
    required this.id,
    required this.institutionId,
    required this.userId,
    required this.nameProduct,
    required this.quantity,
    required this.productCulture,
    required this.numlot,
    required this.manufacturingDate,
    required this.invoice,
    required this.weight,
  });
}

List<TrackingForm> listForm = [
  TrackingForm(
    id: '1',
    institutionId: '1',
    userId: '1',
    nameProduct: 'Tomate Cereja',
    quantity: 5000,
    productCulture: 'Tomate',
    numlot: '00150',
    manufacturingDate: DateTime.now().toString(),
    invoice: '123456789012345',
    weight: '75',
  ),
  TrackingForm(
    id: '2',
    institutionId: '1',
    userId: '1',
    nameProduct: 'Morango Nordeste',
    quantity: 15000,
    productCulture: 'Morango',
    numlot: '00151',
    manufacturingDate: DateTime.now().toString(),
    invoice: '123456789343443',
    weight: '1000.00',
  ),
  TrackingForm(
    id: '3',
    institutionId: '2',
    userId: '1',
    nameProduct: 'Banana Nanica',
    quantity: 2500,
    productCulture: 'Banana',
    numlot: '00152',
    manufacturingDate: DateTime.now().toString(),
    invoice: '12345678901455',
    weight: '1200.00',
  ),
];
