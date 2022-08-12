class QueryOrganization {
  // fetch public organization
  String getPublicOrganization() {
    return """
    query {
      public_organizations {
        id
        name
        info
        cover
        logo
        privacy
      	totalSubscribers
        totalCourses
        createdAt
        isVerify
        totalTeacher
        totalStudent
        totalCourses
      }
    }
  """;
  }

}
