import 'package:mobx/mobx.dart';

part 'create_edit_page_store.g.dart';

class CreateEditPageStore = CreateEditPageStoreBase with _$CreateEditPageStore;

abstract class CreateEditPageStoreBase with Store {

  @observable
  ObservableList itens = ObservableList(); 
  
  @action
  dispose(){
    itens.clear();
  }
}
