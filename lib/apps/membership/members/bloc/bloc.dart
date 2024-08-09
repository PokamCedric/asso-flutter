import 'package:african_windows/apps/membership/members/models/model_member.dart';
import 'package:bloc/bloc.dart';
import 'package:african_windows/apps/membership/members/data/members.dart';
import 'event.dart';
import 'state.dart';

class MembersBloc extends Bloc<MembersEvent, MembersState> {
  MembersBloc() : super(const MembersState()) {
    on<LoadMembersEvent>(_onLoadMembers);
    on<FilterMembersEvent>(_onFilterMembers);
    on<AddMemberEvent>(_onAddMember);
    on<DeleteMemberEvent>(_onDeleteMember);
    on<UpdateMemberEvent>(_onUpdateMember);
  }

  Future<void> _onLoadMembers(LoadMembersEvent event, Emitter<MembersState> emit) async {
    emit(state.copyWith(status: MembersStatus.loading));
    try {
      final members = await loadMembers();
      emit(state.copyWith(
        status: MembersStatus.loadSuccess,
        allMembers: members,
        filteredMembers: members,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MembersStatus.loadError,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onFilterMembers(FilterMembersEvent event, Emitter<MembersState> emit) {
    final currentState = state;
    emit(currentState.copyWith(status: MembersStatus.filtering));
    try {
      final filteredMembers = currentState.allMembers.where((member) {
        final filter = event.filter;
        final query = filter.query?.toLowerCase() ?? '';
        final matchesSearch = query.isEmpty ||
            member.firstName.toLowerCase().contains(query) ||
            member.lastName.toLowerCase().contains(query) ||
            member.email!.toLowerCase().contains(query) ||
            member.phoneNumber!.toLowerCase().contains(query) ||
            member.address!.toLowerCase().contains(query) ||
            member.status.toString().toLowerCase().contains(query);

        final matchesRole = filter.status == 'Select' ||
            member.status == MembershipStatusExtension.fromString(filter.status ?? '');

        return matchesSearch && matchesRole;
      }).toList();

      emit(currentState.copyWith(
        status: MembersStatus.filterSuccess,
        filteredMembers: filteredMembers,
      ));
    } catch (e) {
      emit(currentState.copyWith(
        status: MembersStatus.filterError,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAddMember(AddMemberEvent event, Emitter<MembersState> emit) async {
    emit(state.copyWith(status: MembersStatus.adding));
    try {
      final currentState = state;
      if (currentState.allMembers.isNotEmpty) {
        final updatedMembers = List<MemberModel>.from(currentState.allMembers)..add(event.newMember);
        emit(state.copyWith(
          status: MembersStatus.addSuccess,
          allMembers: updatedMembers,
          filteredMembers: updatedMembers,
        ));
      } else {
        emit(state.copyWith(
          status: MembersStatus.addError,
          errorMessage: 'No members loaded to add',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: MembersStatus.addError,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeleteMember(DeleteMemberEvent event, Emitter<MembersState> emit) async {
    emit(state.copyWith(status: MembersStatus.deleting));
    try {
      final currentState = state;
      if (currentState.allMembers.isNotEmpty) {
        final updatedMembers = currentState.allMembers.where((member) => member.id != event.memberId).toList();
        emit(state.copyWith(
          status: MembersStatus.deleteSuccess,
          allMembers: updatedMembers,
          filteredMembers: updatedMembers,
        ));
      } else {
        emit(state.copyWith(
          status: MembersStatus.deleteError,
          errorMessage: 'No members loaded to delete',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: MembersStatus.deleteError,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateMember(UpdateMemberEvent event, Emitter<MembersState> emit) async {
    emit(state.copyWith(status: MembersStatus.updating));
    try {
      final currentState = state;
      if (currentState.allMembers.isNotEmpty) {
        final updatedMembers = currentState.allMembers.map((member) {
          return member.id == event.updatedMember.id ? event.updatedMember : member;
        }).toList();
        emit(state.copyWith(
          status: MembersStatus.updateSuccess,
          allMembers: updatedMembers,
          filteredMembers: updatedMembers,
        ));
      } else {
        emit(state.copyWith(
          status: MembersStatus.updateError,
          errorMessage: 'No members loaded to update',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: MembersStatus.updateError,
        errorMessage: e.toString(),
      ));
    }
  }
}
