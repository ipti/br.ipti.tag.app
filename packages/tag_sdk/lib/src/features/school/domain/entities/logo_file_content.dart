class LogoFileContent {
  final String type;
  final dynamic data;

  const LogoFileContent({required this.type, required this.data});
  
  factory LogoFileContent.fromJson(Map<String,dynamic> map) => LogoFileContent(type: map['type'], data: map['data']);

  Map<String,dynamic> toJson() => {'type': type, 'data': data};
}
