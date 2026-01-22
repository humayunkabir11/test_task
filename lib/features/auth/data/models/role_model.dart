import 'package:equatable/equatable.dart';

import '../../../../core/custom_assets/assets.gen.dart';

enum UserRole {
  teacher("Teacher"),
  student("Student"),
  parents("Parents");

  final String key;
  const UserRole(this.key);
}

class RoleModel extends Equatable {
  final String image;
  final String title;
  final UserRole role;

  const RoleModel({
    required this.image,
    required this.title,
    required this.role,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [role];
}

final userRoles = [
  RoleModel(
    image: Assets.images.imgStudent.path,
    title: "Student",
    role: UserRole.student,
  ),

  RoleModel(
    image: Assets.images.imgParents.path,
    title: "Parents",
    role: UserRole.parents,
  ),

  RoleModel(
    image: Assets.images.imgTeacher.path,
    title: "Teacher",
    role: UserRole.teacher,
  ),
];
