import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial_bloc/cart_screen/cart_screen_bloc.dart';
import 'package:trial_bloc/cart_screen/cart_screen_event.dart';
import 'package:trial_bloc/cart_screen/cart_screen_state.dart';
import '../cart_list_screen/cart_list_ui.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            BlocListener<CartBloc, CartState>(
              listener: (context, state) {
                if (state is LoadingStage) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Fetching Cart List')));
                } else if (state is CartFetchingSuccessfulState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartListScreen()));
                }
              },
              child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context).add(OnGetCart());
                  },
                  child: Text('Get Cart List')),
            ),
          ],
        ),
      ),
    );
  }
}
