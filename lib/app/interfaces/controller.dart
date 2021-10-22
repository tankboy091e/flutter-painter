import 'package:drawing_tool/app/interfaces/view.dart';

abstract class Controller {
  ViewState? viewState;

  void attach(ViewState viewState) {
    this.viewState = viewState;
  }

  void detach(ViewState viewState) {
    this.viewState = null;
  }

  void notify() {
    viewState?.update();
  }
}
