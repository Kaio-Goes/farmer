class Institution {
  late String id;
  late String responsibleName;
  late String cnpj;
  late String responsibleCpf;
  late String email;
  late String phone;

  Institution({
    required this.id,
    required this.responsibleName,
    required this.cnpj,
    required this.responsibleCpf,
    required this.email,
    required this.phone,
  });

  Institution.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    responsibleName = json['responsible_name'];
    cnpj = json['cnpj'];
    responsibleCpf = json['responsible_cpf'];
    email = json['email'];
    phone = json['phone'];
  }
}
