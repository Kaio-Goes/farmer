class TrackingForm {
  late String id;
  late String institutionId;
  late String userId;
  late String nameProduct;
  late int quantity;
  late String productCulture;
  late String? unitValue;
  late String? totalValue;
  late String? numlot;
  late String manufacturingDate;
  late String? ratailerCorporateName;
  late String? invoice;
  late String? dateInvoice;
  late String weight;
  late String createdAt;

  TrackingForm({
    required this.id,
    required this.institutionId,
    required this.userId,
    required this.nameProduct,
    this.unitValue,
    this.totalValue,
    required this.quantity,
    required this.productCulture,
    this.numlot,
    required this.manufacturingDate,
    this.ratailerCorporateName,
    this.invoice,
    this.dateInvoice,
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
    ratailerCorporateName: 'Spezi Tecnologia',
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
    quantity: 15000,
    productCulture: 'Morango',
    manufacturingDate: '21/01/2025',
    weight: '1000.00',
    createdAt: '2025-01-20 08:40',
  ),
  TrackingForm(
    id: '3',
    institutionId: '2',
    userId: '1',
    nameProduct: 'Banana Nanica',
    quantity: 2500,
    productCulture: 'Banana',
    manufacturingDate: '21/01/2025',
    weight: '1200.00',
    createdAt: '2025-01-20 08:40',
  ),
];
