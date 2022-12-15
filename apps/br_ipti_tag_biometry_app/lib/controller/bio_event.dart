enum BioEvents {
  waiting(code: 101, info: 'Aguardando imagem...'),
  modeling(code: 102, info: 'Modelagem...'),
  modeled(code: 103, info: 'Modelado'),
  searching(code: 104, info: 'Procurando...'),
  putfinger(code: 105, info: 'Coloque o dedo no sensor...'),
  putFingerAgain(code: 106, info: 'Coloque o mesmo dedo novamente...'),
  pictureTaken(code: 107, info: 'Coloque o mesmo dedo novamente...'),
  waitingFinger(code: 108, info: '.'),
  removeFinger(code: 113, info: 'Remover dedo'),
  carrer(code: 114, info: 'Criado'),
  saving(code: 115, info: 'Salvando...'),
  saved(code: 116, info: 'Salvo'),
  stored(code: 117, info: 'Armazenado'),
  storeok(code: 200, info: 'Impressão cadastrada com sucesso'),
  deleteok(code: 201, info: 'Impressão deletada com sucesso'),
  fingerDected(code: 202, info: 'Impressão detectada'),
  emptylibrary(code: 203, info: 'Biblioteca esvaziada com sucesso'),
  passverify(code: 204, info: 'Aprovação bem sucedida'),
  moduleok(code: 205, info: 'Módulo OK'),
  ok(code: 206, info: 'Módulo OK'),
  storeFail(code: 500, info: 'Ocorreu um erro ao cadastrar'),
  deleteFail(code: 501, info: 'Ocorreu um erro ao deletar'),
  fingerNotFound(code: 502, info: 'Impressão não encontrada'),
  emptyLibaryFail(code: 503, info: 'Falha ao esvaziar a biblioteca'),
  packetRecieveerr(code: 504, info: 'Erro de recebimento de pacote'),
  imageFail(code: 505, info: 'Falha na imagem'),
  imagemess(code: 506, info: 'Imagem confusa'),
  featureFail(code: 507, info: 'Falha de recurso'),
  noMatch(code: 508, info: 'Sem correspondência'),
  notFound(code: 509, info: 'Não encontrado'),
  enrollMisMatch(code: 510, info: 'Impressões não correspondem'),
  badLocation(code: 511, info: 'Erro de local de armazenamento'),
  dbrangeFail(code: 512, info: 'Falha de alcance no banco de dados'),
  uploadFeatureFail(code: 513, info: 'Falha no recurso de upload'),
  packetTresPonseFail(code: 514, info: 'Falha de resposta do pacote'),
  uploadFail(code: 515, info: '	Falha no envio'),
  dbclearFail(code: 516, info: '	Falha na limpeza do banco de dados'),
  passFail(code: 517, info: 'Falha na aprovação'),
  invalidImage(code: 518, info: 'Imagem invalida'),
  flasherr(code: 519, info: 'Erro de armazenamento flash'),
  invalidReg(code: 520, info: 'Registro invalido'),
  addrCode(code: 521, info: 'ADDR Code'),
  imageFailErro(code: 522, info: 'Erro de imagem'),
  otherError(code: 523, info: 'Outro erro'),
  confusingImage(code: 524, info: 'Imagem muito confusa'),
  notIdentiftreSources(
      code: 525, info: '	Não foi possível identificar recursos'),
  badstorageLocation(code: 526, info: 'Não foi possível identificar recursos'),
  flashstorageError(code: 527, info: 'Erro de armazenamento flash'),
  savingError(code: 528, info: 'Erro de armazenamento flash'),
  fingersNotMatch(code: 529, info: 'As impressões não correspondem');

  const BioEvents({required this.code, required this.info});

  final int code;
  final String info;

  static BioEvents byCode(code) =>
      BioEvents.values.firstWhere((e) => e.code == code);
}
