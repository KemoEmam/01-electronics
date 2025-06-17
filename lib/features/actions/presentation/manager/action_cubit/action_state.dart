part of 'action_cubit.dart';

@immutable
sealed class ActionState {}

class ActionInitial extends ActionState {}

class ActionLoaded extends ActionState {
  final List<ActionEntity> actions;

  ActionLoaded(this.actions);
}
