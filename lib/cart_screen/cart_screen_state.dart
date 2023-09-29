import 'dart:ui';
import '../model/model.dart';

abstract class CartState{}

class InitialStage extends CartState{}
class FinalStage extends CartState{}
class LoadingStage extends CartState{}


class CartFetchingSuccessfulState extends CartState{
  late List<CartModel> mCartModel;
  Color color;

  CartFetchingSuccessfulState(this.mCartModel,this.color);

}
class SendIdState extends CartState{
  Color color;
SendIdState(this.color);
}