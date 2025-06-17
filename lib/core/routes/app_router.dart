import 'package:electronics_task/core/layout/navigation_bar_layout.dart';
import 'package:electronics_task/core/routes/routes.dart';
import 'package:electronics_task/core/services/service_locator.dart';
import 'package:electronics_task/features/actions/presentation/manager/action_cubit/action_cubit.dart';
import 'package:electronics_task/features/actions/presentation/views/actions_view.dart';
import 'package:electronics_task/features/actions/presentation/views/add_new_action_view.dart';
import 'package:electronics_task/features/auth/domain/repos/auth_repo.dart';
import 'package:electronics_task/features/auth/presentation/manager/password/password_cubit.dart';
import 'package:electronics_task/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:electronics_task/features/auth/presentation/manager/signup/signup_cubit.dart';
import 'package:electronics_task/features/auth/presentation/views/password_view.dart';
import 'package:electronics_task/features/auth/presentation/views/signin_view.dart';
import 'package:electronics_task/features/auth/presentation/views/signup_view.dart';
import 'package:electronics_task/features/dashboard/presentations/views/dashboard_view.dart';
import 'package:electronics_task/features/leads/presentation/manager/leads_cubit/leads_cubit.dart';
import 'package:electronics_task/features/leads/presentation/views/add_new_lead_view.dart';
import 'package:electronics_task/features/leads/presentation/views/leads_view.dart';
import 'package:electronics_task/features/projects/presentation/views/projects_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: '_root');

final router = GoRouter(
  initialLocation: Routes.signin,
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (context, state) => const Scaffold(
    body: Center(child: Text('Oops! Page not found')),
  ),
  routes: [
    GoRoute(
      path: Routes.signin,
      builder: (context, state) => BlocProvider(
        create: (context) => SigninCubit(sl<AuthRepo>()),
        child: const SigninView(),
      ),
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => BlocProvider(
        create: (context) => SignupCubit(sl<AuthRepo>()),
        child: const SigninupView(),
      ),
    ),
    GoRoute(
      path: Routes.password,
      builder: (context, state) => BlocProvider(
        create: (context) => PasswordCubit(sl<AuthRepo>()),
        child: const PasswordView(),
      ),
    ),
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.dashboard,
              builder: (context, state) => const DashboardView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.leads,
              builder: (context, state) => const LeadsView(),
              routes: [
                GoRoute(
                  path: Routes.addNewLead,
                  builder: (context, state) => const AddNewLeadView(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.actions,
              builder: (context, state) => const ActionsView(),
              routes: [
                GoRoute(
                  path: Routes.addNewAction,
                  builder: (context, state) => const AddNewActionView(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.projects,
              builder: (context, state) => BlocProvider(
                create: (context) => SigninCubit(sl<AuthRepo>()),
                child: const ProjectsView(),
              ),
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LeadsCubit()..loadInitialLeads(),
          ),
          BlocProvider(
            create: (context) => ActionCubit(),
          ),
        ],
        child: NavigationBarLayout(
          shell: navigationShell,
        ),
      ),
    ),
  ],
);
