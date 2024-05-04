import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

class HomePageStore = HomePageStoreBase with _$HomePageStore;

abstract class HomePageStoreBase with Store {

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
