import 'package:dartt_tot/models/grupo.dart';
import 'package:dartt_tot/models/issue.dart';
import 'package:dartt_tot/models/question.dart';
import 'package:dartt_tot/models/subgrupo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IssuesController extends GetxController {
  final GlobalKey<FormState> formKeyGroup = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyIssue = GlobalKey<FormState>();

  TextEditingController nmesbGrupo = TextEditingController();
  TextEditingController dcesbGrupo = TextEditingController();
  TextEditingController pergunta = TextEditingController();

  Grupo grupo = Grupo();
  Question question = Question();
  List<Issue> issue = [];
  int indexGroup = 0;

  bool obPergunta = false;
  bool obResposta = false;
  bool obMidia = false;

  List<Grupo> allGrupos = [];
  Grupo dropdownValue = Grupo();

  @override
  void onInit() {
    super.onInit();
    // getAllGrupos();
  }

  @override
  void onReady() {
    super.onReady();
    grupo.subgrupo = [];
  }

  void setGrupo(List<dynamic> value) {
    grupo = value[0];
    indexGroup = value[1];
  }

  void setDropdownValue(Grupo? value) {
    if (value!.title != null) {
      dropdownValue = value;
    }
  }

  void setObPergunta(bool value) {
    obPergunta = value;
    update();
  }

  void setObResposta(bool value) {
    obResposta = value;
    update();
  }

  void setObMidia(bool value) {
    obMidia = value;
    update();
  }

  void finalizarIssue(int index) {
    Issue issueNew = Issue(
      title: pergunta.text,
      req: obPergunta,
      reqObs: obResposta,
      reqMidia: obMidia,
    );
    // subGrupo[index].issue!.add(issueNew);
    grupo.subgrupo![index].issue!.add(issueNew);
    update();
  }

  void finalizarSubGrupo() {
    SubGrupo subGrupoNew =
        SubGrupo(title: nmesbGrupo.text, obs: dcesbGrupo.text, issue: []);
    // subGrupo.add(subGrupoNew);
    grupo.subgrupo!.add(subGrupoNew);
    update();
  }

  Future<void> finalizaTudo() async {
    allGrupos.add(grupo);
    getAllGrupos();
    update();
    limparTudo();
  }

  Future<void> atualizaTudo() async {
    allGrupos.removeAt(indexGroup);
    allGrupos.insert(indexGroup, grupo);
    getAllGrupos();
    update();
  }

  void reorderStatus(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = grupo.subgrupo!.removeAt(oldIndex);
    grupo.subgrupo!.insert(newIndex, item);
  }

  void reorderIssues(int oldIndex, int newIndex, int indexSBGruoup) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = grupo.subgrupo![indexSBGruoup].issue!.removeAt(oldIndex);
    grupo.subgrupo![indexSBGruoup].issue!.insert(newIndex, item);
  }

  Future<void> getAllGrupos() async {
    dropdownValue = allGrupos.first;
  }

  Future<void> deleteTypeOcurrency(int indexGroup) async {
    allGrupos.removeAt(indexGroup);
    getAllGrupos();
    update();
  }

  //void setDataForm(Grupo grupoReceived) {
  //  nomeGrupo.text = grupoReceived.title!;
  //  descGrupo.text = grupoReceived.obs!;
  //  subGrupo = grupoReceived.subgrupo!;
  // }

  void limparTudo() {
    nmesbGrupo.text = "";
    dcesbGrupo.text = "";
    pergunta.text = "";
    grupo = Grupo(
      id: null,
      title: null,
      obs: null,
      order: null,
      subgrupo: [],
    );
    question = Question();
    issue.clear();
    setObMidia(false);
    setObPergunta(false);
    setObResposta(false);
    update();
  }
}
