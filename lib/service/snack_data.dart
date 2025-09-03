import 'package:tubes_abp/model/snack_model.dart';

List<SnackModel> getSnack() {
  List<SnackModel> snack = [];
  SnackModel snackModel = SnackModel();

  //1
  snackModel.image = "images/batagor.png";
  snackModel.name = "Batagor";
  snackModel.price = "5";
  snack.add(snackModel);
  snackModel = SnackModel();

  snackModel.image = "images/siomay.png";
  snackModel.name = "Siomay";
  snackModel.price = "5";
  snack.add(snackModel);
  snackModel = SnackModel();

  snackModel.image = "images/cilok.png";
  snackModel.name = "Cilok";
  snackModel.price = "5";
  snack.add(snackModel);
  snackModel = SnackModel();

  snackModel.image = "images/cimol.png";
  snackModel.name = "Cimol";
  snackModel.price = "5";
  snack.add(snackModel);
  snackModel = SnackModel();

  return snack;
}
