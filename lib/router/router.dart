import 'package:firebase_test_3/screens/login_page.dart';
import 'package:firebase_test_3/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_test_3/screens/home_page.dart';

final router = GoRouter(
  initialLocation: '/loginpage',
  routes: <GoRoute>[
    GoRoute(
      path: '/homepage',
      pageBuilder: (context, state) =>
          const MaterialPage(child: HomePage()),
    ),
    GoRoute(
      path: '/loginpage',
      pageBuilder: (context, state) =>
          MaterialPage(child: LoginPage()),
    ),
    GoRoute(
      path: '/signuppage',
      pageBuilder: (context, state) =>
          MaterialPage(child: SignupPage()),
    ),
  ],
);
