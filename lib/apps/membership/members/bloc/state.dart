// state.dart
import 'package:equatable/equatable.dart';
import 'package:african_windows/apps/membership/members/models/model_member.dart';

enum MembersStatus {
  initial,
  loading,
  filtering,
  adding,
  deleting,
  updating,

  // Success States
  loadSuccess,
  filterSuccess,
  addSuccess,
  deleteSuccess,
  updateSuccess,

  // Error States
  loadError,
  filterError,
  addError,
  deleteError,
  updateError,
}

class MembersState extends Equatable {
  final MembersStatus status;
  final List<MemberModel> allMembers;
  final List<MemberModel> filteredMembers;
  final String? errorMessage;

  const MembersState({
    this.status = MembersStatus.initial,
    this.allMembers = const [],
    this.filteredMembers = const [],
    this.errorMessage,
  });

  MembersState copyWith({
    MembersStatus? status,
    List<MemberModel>? allMembers,
    List<MemberModel>? filteredMembers,
    int? totalHits,
    int? currentPage,
    String? errorMessage,
  }) {
    return MembersState(
      status: status ?? this.status,
      allMembers: allMembers ?? this.allMembers,
      filteredMembers: filteredMembers ?? this.filteredMembers,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, allMembers, filteredMembers, errorMessage];
}
