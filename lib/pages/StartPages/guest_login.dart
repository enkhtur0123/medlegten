import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/providers/auth_provider.dart';

class GuestLogin extends ConsumerWidget {
  const GuestLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authProvider);
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        width: double.infinity,
        child: MaterialButton(
          elevation: 5,
          onPressed: () {
            WidgetsBinding.instance?.addPostFrameCallback((_) async {
              ref.read(authProvider.notifier).loginGuest();
            });
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 3, //spread radius
                    blurRadius: 7, // blur radius
                    offset:const Offset(0, 2), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Container(
              margin: const EdgeInsets.only(right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Зочноор нэвтрэх",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
