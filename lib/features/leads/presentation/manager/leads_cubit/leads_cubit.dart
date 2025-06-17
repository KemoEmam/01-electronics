import 'package:bloc/bloc.dart';
import 'package:electronics_task/features/leads/domain/entities/leads_entity.dart';
import 'package:meta/meta.dart';

part 'leads_state.dart';

class LeadsCubit extends Cubit<LeadsState> {
  LeadsCubit() : super(LeadsInitial());

  final List<LeadsEntity> _allLeads = [];
  final List<LeadsEntity> _visibleLeads = [];
  String? searchQuery;
  String? activeStatusFilter;

  void loadInitialLeads() {
    _visibleLeads.clear();
    _visibleLeads.addAll(_allLeads);
    emit(LeadsLoaded(leads: List.from(_visibleLeads)));
  }

  void addLead(LeadsEntity lead) {
    _allLeads.add(lead);
    _visibleLeads.add(lead);
    emit(LeadsLoaded(leads: List.from(_visibleLeads)));
  }

  void searchLeadByName(String name) {
    final lower = name.toLowerCase();
    _visibleLeads
      ..clear()
      ..addAll(
        _allLeads.where(
          (lead) => lead.name?.toLowerCase().contains(lower) ?? false,
        ),
      );
    emit(LeadsLoaded(leads: List.from(_visibleLeads)));
  }

  void filterByStatus(String status) {
    _visibleLeads
      ..clear()
      ..addAll(_allLeads.where(
        (lead) =>
            lead.tags?.any(
              (tag) => tag.label.toLowerCase() == status.toLowerCase(),
            ) ??
            false,
      ));
    emit(LeadsLoaded(leads: List.from(_visibleLeads)));
  }

  void clearSearch() {
    _visibleLeads
      ..clear()
      ..addAll(_allLeads);
    emit(LeadsLoaded(leads: List.from(_visibleLeads)));
  }
}
