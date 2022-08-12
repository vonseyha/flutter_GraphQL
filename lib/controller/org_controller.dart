
import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../backend/graphQL/graphQL_Conf.dart';
import '../backend/graphQL/query/organizations.dart';
import '../model/org_model.dart';
import '../service/date_convert.dart';

class SchoolController {
  Future<List<School>> getSchoolList() async {
    List<School> schools = [];
    QueryOrganization querySchool = QueryOrganization();
    // GetRequest getRequest =  GetRequest();
    GraphQLConfiguration graphQLConfig =  GraphQLConfiguration();
    GraphQLClient _client = graphQLConfig.clientToQuery();
    QueryResult result = await _client.query(QueryOptions(
        document: gql(
      querySchool.getPublicOrganization(),
    )));
    print(result);
    if (!result.hasException) {
      print(result.data);
      for (var i = 0; i < result.data!["public_organizations"].length; i++) {
        schools.add(School(
          id: result.data!['public_organizations'][i]['id'],
          name: result.data!['public_organizations'][i]['name'],
          info: result.data!['public_organizations'][i]['info'],
          cover: result.data!['public_organizations'][i]['cover'],
          logo: result.data!['public_organizations'][i]['logo'],
          privacy: result.data!['public_organizations'][i]['privacy'],
          totalMember: result.data!['public_organizations'][i]['totalSubscribers'],
          totalCourse: result.data!['public_organizations'][i]['totalCourses'],
          createAt: DateConvert.convertTimeStamp(dateTime: int.parse(result.data!['public_organizations'][i]['createdAt'] ?? "1616675286681")),
          isVerify: result.data!['public_organizations'][i]['isVerify'],
          totalCourses: result.data!['public_organizations'][i]['totalCourses'],
          totalStudent: result.data!['public_organizations'][i]['totalStudent'],
          totalTeacher: result.data!['public_organizations'][i]['totalTeacher'],
          isFav: false,
        )
        );
      }
    }
    return schools;
  }
} 