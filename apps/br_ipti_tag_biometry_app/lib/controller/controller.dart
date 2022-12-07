import 'dart:async';

import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';

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
}

class ControllerBiometrics {
  final biometricsService = BiometricsService();
  final _socketResponse = StreamController<BioEvents>.broadcast();

  void Function(BioEvents) get addResponse => _socketResponse.sink.add;

  Stream<BioEvents> get getResponseEvents => _socketResponse.stream;

  void dateBiometrics() {
    biometricsService.connectAndListen();
    biometricsService.streamSocket.getResponse.listen((data) {
      if (data != null) {
        if (data['id'] == 101) {
          addResponse(BioEvents.waiting);
        }
        if (data['id'] == 502) {
          addResponse(BioEvents.fingerNotFound);
        }
        if (data['id'] == 102) {
          addResponse(BioEvents.modeling);
        }
        if (data['id'] == 103) {
          addResponse(BioEvents.modeled);
        }
        if (data['id'] == 104) {
          addResponse(BioEvents.searching);
        }
        if (data['id'] == 105) {
          addResponse(BioEvents.putfinger);
        }
        if (data['id'] == 106) {
          addResponse(BioEvents.putFingerAgain);
        }
        if (data['id'] == 107) {
          addResponse(BioEvents.pictureTaken);
        }
        if (data['id'] == 108) {
          addResponse(BioEvents.waitingFinger);
        }
        if (data['id'] == 113) {
          addResponse(BioEvents.removeFinger);
        }
        if (data['id'] == 114) {
          addResponse(BioEvents.carrer);
        }
        if (data['id'] == 115) {
          addResponse(BioEvents.saved);
        }
        if (data['id'] == 116) {
          addResponse(BioEvents.saved);
        }
        if (data['id'] == 117) {
          addResponse(BioEvents.stored);
        }
        if (data['id'] == 117) {
          addResponse(BioEvents.stored);
        }
        if (data['id'] == 200) {
          addResponse(BioEvents.storeok);
        }
        if (data['id'] == 201) {
          addResponse(BioEvents.deleteok);
        }
        if (data['id'] == 202) {
          addResponse(BioEvents.fingerDected);
        }
        if (data['id'] == 203) {
          addResponse(BioEvents.emptylibrary);
        }
        if (data['id'] == 204) {
          addResponse(BioEvents.passverify);
        }
        if (data['id'] == 205) {
          addResponse(BioEvents.moduleok);
        }
        if (data['id'] == 206) {
          addResponse(BioEvents.ok);
        }
        if (data['id'] == 500) {
          addResponse(BioEvents.storeFail);
        }
        if (data['id'] == 501) {
          addResponse(BioEvents.deleteFail);
        }
        if (data['id'] == 503) {
          addResponse(BioEvents.emptyLibaryFail);
        }
        if (data['id'] == 504) {
          addResponse(BioEvents.packetRecieveerr);
        }
        if (data['id'] == 505) {
          addResponse(BioEvents.imageFail);
        }
        if (data['id'] == 506) {
          addResponse(BioEvents.imagemess);
        }
        if (data['id'] == 507) {
          addResponse(BioEvents.featureFail);
        }
        if (data['id'] == 508) {
          addResponse(BioEvents.noMatch);
        }
        if (data['id'] == 509) {
          addResponse(BioEvents.enrollMisMatch);
        }
        if (data['id'] == 510) {
          addResponse(BioEvents.enrollMisMatch);
        }
        if (data['id'] == 511) {
          addResponse(BioEvents.badLocation);
        }
        if (data['id'] == 512) {
          addResponse(BioEvents.dbrangeFail);
        }
        if (data['id'] == 513) {
          addResponse(BioEvents.uploadFeatureFail);
        }
        if (data['id'] == 514) {
          addResponse(BioEvents.packetTresPonseFail);
        }
        if (data['id'] == 515) {
          addResponse(BioEvents.uploadFail);
        }
        if (data['id'] == 516) {
          addResponse(BioEvents.dbclearFail);
        }
        if (data['id'] == 517) {
          addResponse(BioEvents.passFail);
        }
        if (data['id'] == 518) {
          addResponse(BioEvents.invalidImage);
        }
        if (data['id'] == 519) {
          addResponse(BioEvents.flasherr);
        }
        if (data['id'] == 520) {
          addResponse(BioEvents.invalidReg);
        }
        if (data['id'] == 521) {
          addResponse(BioEvents.addrCode);
        }
        if (data['id'] == 522) {
          addResponse(BioEvents.imageFailErro);
        }
        if (data['id'] == 523) {
          addResponse(BioEvents.otherError);
        }
        if (data['id'] == 524) {
          addResponse(BioEvents.confusingImage);
        }
        if (data['id'] == 525) {
          addResponse(BioEvents.notIdentiftreSources);
        }
        if (data['id'] == 526) {
          addResponse(BioEvents.badstorageLocation);
        }
        if (data['id'] == 527) {
          addResponse(BioEvents.flashstorageError);
        }
        if (data['id'] == 528) {
          addResponse(BioEvents.savingError);
        }
        if (data['id'] == 529) {
          addResponse(BioEvents.fingersNotMatch);
        }
      }
    });
    biometricsService.emit("message", "SearchSendMessage");
  }
}
