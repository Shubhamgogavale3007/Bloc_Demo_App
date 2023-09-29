import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial_bloc/cart_screen/cart_screen_bloc.dart';
import 'package:trial_bloc/cart_screen/cart_screen_state.dart';
import 'package:trial_bloc/your_cart/your_cart_ui.dart';
import '../cart_screen/cart_screen_event.dart';

class CartListScreen extends StatelessWidget {
  CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    bool isSelected;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart List'),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {


              print('INSIDE :: ${state}');


              if (state is CartFetchingSuccessfulState) {
                /* final successState = state as CartFetchingSuccessfulState;*/
                print('INSIDE :: ${state}');
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.mCartModel.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        print('CART LIST LENGTH :: ${state.mCartModel.length}');
                        return GestureDetector(
                          onLongPress: () {
                            state.mCartModel[index].isSelected = true;
                            BlocProvider.of<CartBloc>(context)
                                .add(AddCartItem());
                          },
                          child: Card(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Image.network(
                                    state.mCartModel[index].image.toString(),
                                    height: 50,
                                    width: 50,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          state.mCartModel[index].title
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(state.mCartModel[index].description
                                            .toString()),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Price : ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              state.mCartModel[index].price
                                                  .toString(),
                                            ),
                                            Spacer(),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              YourCart(
                                                                id: state
                                                                    .mCartModel[
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                                isSeletedItem: state
                                                                    .mCartModel[
                                                                        index]
                                                                    .isSelected,
                                                              )));
                                                             BlocProvider.of<CartBloc>(
                                                        context)
                                                    .add(OnGetCart());
                                                  print(state);
                                                },
                                                child: Text('Add To Cart'))
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }
              return CircularProgressIndicator  ();
            })
          ],
        ),
      ),
    );
  }
}
