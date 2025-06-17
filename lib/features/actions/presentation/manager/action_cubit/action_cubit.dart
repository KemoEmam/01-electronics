import 'package:bloc/bloc.dart';
import 'package:electronics_task/features/actions/domain/actions_entity.dart';
import 'package:meta/meta.dart';

part 'action_state.dart';

class ActionCubit extends Cubit<ActionState> {
  ActionCubit() : super(ActionInitial());

  final List<ActionEntity> _allActions = [];
  final List<ActionEntity> _visibleActions = [];

  void addAction(ActionEntity action) {
    _allActions.add(action);
    _visibleActions.add(action);
    emit(ActionLoaded(List.from(_visibleActions)));
  }

  void searchActionByName(String name) {
    final lower = name.toLowerCase();
    _visibleActions
      ..clear()
      ..addAll(
        _allActions.where(
          (action) => action.leadName?.toLowerCase().contains(lower) ?? false,
        ),
      );
    emit(ActionLoaded(List.from(_visibleActions)));
  }

  void clearSearch() {
    _visibleActions
      ..clear()
      ..addAll(_allActions);
    emit(ActionLoaded(List.from(_visibleActions)));
  }

  List<ActionEntity> get actions => _visibleActions;
}
