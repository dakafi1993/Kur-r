class DocumentType {
  final String id;
  final String title;
  final String description;
  final bool required;

  const DocumentType({
    required this.id,
    required this.title,
    required this.description,
    this.required = true,
  });

  static final List<DocumentType> allDocuments = [
    DocumentType(
      id: 'idCardFront',
      title: 'Občanský průkaz - přední strana',
      description: 'Nahrajte přední stranu OP',
    ),
    DocumentType(
      id: 'idCardBack',
      title: 'Občanský průkaz - zadní strana',
      description: 'Nahrajte zadní stranu OP',
    ),
    DocumentType(
      id: 'driverLicenseFront',
      title: 'Řidičský průkaz - přední strana',
      description: 'Nahrajte přední stranu RP',
    ),
    DocumentType(
      id: 'driverLicenseBack',
      title: 'Řidičský průkaz - zadní strana',
      description: 'Nahrajte zadní stranu RP',
    ),
    DocumentType(
      id: 'profilePhoto',
      title: 'Profilová fotka',
      description: 'Selfie s jasným výrazem obličeje',
    ),
  ];

  static final List<String> czechBanks = [
    'Česká spořitelna',
    'Komerční banka',
    'ČSOB',
    'Raiffeisenbank',
    'UniCredit Bank',
    'mBank',
    'Moneta Money Bank',
    'Air Bank',
    'Fio banka',
    'Equa bank',
  ];
}
