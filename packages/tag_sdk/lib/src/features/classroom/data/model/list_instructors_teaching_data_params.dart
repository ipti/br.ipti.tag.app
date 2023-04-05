class ListInstructorsTeachingDataParams {
  final int classroomId;
  final String perPage;
  final String page;
  const ListInstructorsTeachingDataParams({
    required this.classroomId,
    this.page = "1",
    this.perPage = '100',
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    "page": page,
    "perPage": perPage,
    "classroomId": classroomId,
  };
}
