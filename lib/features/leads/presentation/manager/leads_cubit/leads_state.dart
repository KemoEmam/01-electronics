part of 'leads_cubit.dart';

@immutable
sealed class LeadsState {}

final class LeadsInitial extends LeadsState {}

final class LeadsLoading extends LeadsState {}

final class LeadsLoaded extends LeadsState {
  final List<LeadsEntity> leads;

  LeadsLoaded({required this.leads});
}

final class LeadsError extends LeadsState {
  final String message;

  LeadsError({required this.message});
}
