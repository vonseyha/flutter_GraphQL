class School {
List<Map<String, dynamic>> ls = List.empty(growable: true);

  String? id;
  String? name;
  String? info;
  String? cover;
  String? logo;
  String? privacy;
  int? totalMember;
  int? totalCourse;
  bool? isFav;
  bool? isVerify;
  String? createAt;
  int? totalTeacher;
  int? totalStudent;
  int? totalCourses;
  School({
    this.id,
    this.name,
    this.info,
    this.cover,
    this.logo,
    this.privacy,
    this.totalMember,
    this.totalCourse,
    this.isFav = false,
    this.isVerify = false,
    this.createAt,
    this.totalTeacher,
    this.totalStudent,
    this.totalCourses,
  });

  getId() => this.id;
  getName() => this.name;
  getInfo() => this.info;
  getCover() => this.cover;
  getLogo() => this.logo;
  getPrivacy() => this.privacy;
  getTotalMembers() => this.totalMember;
  getTotalCourse() => this.totalCourse;
  getCreateAt() => this.createAt;
  getIsFav() => this.isFav = false;
  getIsVerify() => this.isVerify;
  getTotalTeacher() => this.totalTeacher;
  getTotalStudent() => this.totalStudent;
  gettotalCourse() => this.totalCourse;

   factory School.fromJson(Map<String, dynamic> json) => School(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    info: json['info'] ?? '',
    cover: json['cover'] ?? '',
    logo: json['logo'] ?? '',
    privacy: json['privacy'] ?? '',
    totalMember: json['totalMember'] ,
    totalCourse: json['totalCourses'] ,
    createAt: json['createdAt'] ?? '',
    isVerify: json['isVerify'] ?? false,
    totalCourses: json['totalCourses'],
    totalStudent: json['totalStudent'],
    totalTeacher: json['totalTeacher'],
    isFav: json['isFav'] ,
  );


  List<Map<String, dynamic>> toJson(List<School> b){
    for (int i = 0; i< b.length; i++){
      ls.add({
        'id': b[i].id,
        'name': b[i].name,
        'info': b[i].info,
        'cover': b[i].cover,
        'logo': b[i].logo,
        'privacy': b[i].privacy,
        'totalMember': b[i].totalMember,
        'totalCourse': b[i].totalCourse,
        'createAt': b[i].createAt,
        'isVerify': b[i].isVerify,
        'totalCourses': b[i].totalCourse,
        'totalStudent': b[i].totalStudent,
        'totalTeacher': b[i].totalTeacher,
        'isFav': b[i].isFav,
      });
    }
    return ls;
  }
}
