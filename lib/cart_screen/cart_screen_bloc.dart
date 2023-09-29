import 'dart:convert';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:trial_bloc/cart_screen/cart_screen_event.dart';
import 'package:trial_bloc/cart_screen/cart_screen_state.dart';
import 'package:http/http.dart' as http;
import 'package:trial_bloc/model/model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(InitialStage()) {
    on<OnGetCart>((event, emit) async {
      emit(LoadingStage());
      try {
        var client = http.Client();

        List<CartModel> mCartModel = [];

        var response =
            await client.get(Uri.parse('https://fakestoreapi.com/products'));

        print('API RESPONSE :: ${response.body}');
        mCartModel = (json.decode(response.body) as List)
            .map((data) => CartModel.fromJson(data))
            .toList();

        print('CART LENGTH :: ${mCartModel.length}');
        emit(CartFetchingSuccessfulState(mCartModel, Color(0xFFFFFFFF)));
      } catch (e) {
        print('ERROR :: ${e}');
      }
    });

    on<AddCartItem>((event, emit) {
      emit(SendIdState(Color(0xFFFFAB40)));
    });
  }
}
