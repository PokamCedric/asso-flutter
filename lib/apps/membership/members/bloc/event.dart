import 'package:african_windows/apps/membership/members/models_views/model_filter.dart';
import 'package:equatable/equatable.dart';
import 'package:african_windows/apps/membership/members/models/model_member.dart';

abstract class MembersEvent extends Equatable {
  const MembersEvent();

  @override
  List<Object> get props => [];
}

class LoadMembersEvent extends MembersEvent {}

class FilterMembersEvent extends MembersEvent {
  final FilterModel filter;

  const FilterMembersEvent(this.filter);

  @override
  List<Object> get props => [filter];
}

class AddMemberEvent extends MembersEvent {
  final MemberModel newMember;

  const AddMemberEvent(this.newMember);

  @override
  List<Object> get props => [newMember];
}

class DeleteMemberEvent extends MembersEvent {
  final String memberId;

  const DeleteMemberEvent(this.memberId);

  @override
  List<Object> get props => [memberId];
}

class UpdateMemberEvent extends MembersEvent {
  final MemberModel updatedMember;

  const UpdateMemberEvent(this.updatedMember);

  @override
  List<Object> get props => [updatedMember];
}
