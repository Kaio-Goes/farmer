class TrackingForm {
  late String id;
  late String institutionId;
  late String userId;
  late String nameProduct;
  late int quantity;
  late String productCulture;
  late String unitValue;
  late String totalValue;
  late String numlot;
  late String manufacturingDate;
  late String invoice;
  late String dateInvoice;
  late String weight;
  late String createdAt;

  TrackingForm({
    required this.id,
    required this.institutionId,
    required this.userId,
    required this.nameProduct,
    required this.unitValue,
    required this.totalValue,
    required this.quantity,
    required this.productCulture,
    required this.numlot,
    required this.manufacturingDate,
    required this.invoice,
    required this.dateInvoice,
    required this.weight,
    required this.createdAt,
  });
}

List<TrackingForm> listForm = [
  TrackingForm(
    id: '1',
    institutionId: '1',
    userId: '1',
    nameProduct: 'Tomate Cereja',
    unitValue: '1.50',
    totalValue: '45950.00',
    quantity: 5000,
    productCulture: 'Tomate',
    numlot: '00150',
    manufacturingDate: '21/01/2025',
    invoice: '123456789012345',
    dateInvoice: '21/01/2025',
    weight: '75',
    createdAt: '2025-01-20 08:40',
  ),
  TrackingForm(
    id: '2',
    institutionId: '1',
    userId: '1',
    nameProduct: 'Morango Nordeste',
    unitValue: '2.50',
    totalValue: '64950.00',
    quantity: 15000,
    productCulture: 'Morango',
    numlot: '00151',
    manufacturingDate: '21/01/2025',
    invoice: '123456789343443',
    dateInvoice: '21/01/2025',
    weight: '1000.00',
    createdAt: '2025-01-20 08:40',
  ),
  TrackingForm(
    id: '3',
    institutionId: '2',
    userId: '1',
    nameProduct: 'Banana Nanica',
    unitValue: '0.50',
    totalValue: '22950.00',
    quantity: 2500,
    productCulture: 'Banana',
    numlot: '00152',
    manufacturingDate: '21/01/2025',
    invoice: '12345678901455',
    dateInvoice: '21/01/2025',
    weight: '1200.00',
    createdAt: '2025-01-20 08:40',
  ),
];
