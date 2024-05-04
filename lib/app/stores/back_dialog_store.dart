import 'package:mobx/mobx.dart';

part 'back_dialog_store.g.dart';

class BackDialogStore = BackDialogStoreBase with _$BackDialogStore;

abstract class BackDialogStoreBase with Store {

  @observable
  ObservableList itens = ObservableList(); 
  @observable
  bool diaogIsOpen = false;

  @action
  setDialogState(){
    diaogIsOpen = !diaogIsOpen;
  }
  
  @action
  dispose(){
    itens.clear();
  }
}
