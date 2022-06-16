class AddHelperModel {
  String? helperName;
  String? helperMail;
  String? helperphone;
  String? helperssn;
  String? helperEducation;
  int? helperExprYears;
  String? helperLocation;
  String? helperSkills;
  String? helperGender;

  AddHelperModel(
      {required this.helperName,
      required this.helperMail,
      required this.helperphone,
      required this.helperssn,
      required this.helperEducation,
      required this.helperExprYears,
      required this.helperLocation,
      required this.helperSkills,
      required this.helperGender});

  Map<String, dynamic> toMap() {
    return {
      "name": helperName,
      "governate": helperLocation,
      "qualification": helperEducation,
      "skills": helperSkills,
      "yearsOfExperience": helperExprYears,
      "email": helperMail,
      "ssn": helperssn,
      "gender": helperGender,
      "phone": helperSkills,
    };
  }
}
