class Institution {
  late String id;
  late String responsibleName;
  late String cnpj;
  late String responsibleCpf;
  late String email;
  late String phone;
  late String cep;
  late String logradouro;
  late String lat;
  late String long;

  Institution({
    required this.id,
    required this.responsibleName,
    required this.cnpj,
    required this.responsibleCpf,
    required this.email,
    required this.phone,
    required this.cep,
    required this.logradouro,
    required this.lat,
    required this.long,
  });
}

List<Institution> listIstitution = [
  Institution(
    id: '1',
    responsibleName: 'Fazenda Goes',
    cnpj: '24.653.218/0001-03',
    responsibleCpf: '123.456.789-10',
    email: 'agricultor@teste.com.br',
    phone: '(61) 99376-3638',
    cep: '73081-605',
    logradouro: 'Qms 33A Lote 08 Setor de Mansoes Sobradinho-DF',
    lat: '-15.798598',
    long: '-47.921226',
  ),
  Institution(
    id: '2',
    responsibleName: 'Fazenda Feliz',
    cnpj: '05.346.557/0001-00',
    responsibleCpf: '123.456.789-10',
    email: 'agricultor@teste.com.br',
    phone: '61 99376-3638',
    cep: '72041-45',
    logradouro: '202 Asa Sul Brasília DF',
    lat: '-15.798488',
    long: '-47.924826',
  )
];
