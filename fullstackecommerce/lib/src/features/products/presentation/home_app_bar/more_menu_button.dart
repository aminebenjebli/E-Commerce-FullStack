import 'package:flutter/material.dart';
import 'package:fullstackecommerce/src/features/authentication/domain/app_user.dart';
import 'package:fullstackecommerce/src/localization/string_hardcoded.dart';
import 'package:fullstackecommerce/src/routing/app_router.dart';
import 'package:go_router/go_router.dart';

enum PopupMenuOption {
  signIn,
  orders,
  account,
}

class MoreMenuButton extends StatelessWidget {
  const MoreMenuButton({super.key, this.user});
  final AppUser? user;

  // * Keys for testing using find.byKey()
  static const signInKey = Key('menuSignIn');
  static const ordersKey = Key('menuOrders');
  static const accountKey = Key('menuAccount');

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // three vertical dots icon (to reveal menu options)
      icon: const Icon(Icons.more_vert),
      itemBuilder: (_) {
        // show all the options based on conditional logic
        return <PopupMenuEntry<PopupMenuOption>>[
          if (user != null) ...[
            PopupMenuItem(
              key: ordersKey,
              value: PopupMenuOption.orders,
              child: Text('Orders'.hardcoded),
            ),
            PopupMenuItem(
              key: accountKey,
              value: PopupMenuOption.account,
              child: Text('Account'.hardcoded),
            ),
          ] else
            PopupMenuItem(
              key: signInKey,
              value: PopupMenuOption.signIn,
              child: Text('Sign In'.hardcoded),
            ),
        ];
      },
      onSelected: (option) {
        // push to different routes based on selected option
        switch (option) {
          case PopupMenuOption.signIn:
            context.goNamed(AppRoute.signIn.name);
          case PopupMenuOption.orders:
            context.goNamed(AppRoute.orders.name);
          case PopupMenuOption.account:
            context.goNamed(AppRoute.account.name);
        }
      },
    );
  }
}
