import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../constant/api_path.dart';

String typenameDataIdFromObject(Object object) {
  if (object is Map<String, Object> &&
      object.containsKey('__typename') &&
      object.containsKey('id')) {
    return "${object['__typename']}/${object['id']}";
  }
  return '';
}

class GraphQLConfiguration with ChangeNotifier{
  static SalaApi salaApi = SalaApi();
  // ignore: avoid_init_to_null
  static Link? link = null;
  static HttpLink httpLink = HttpLink(
    Platform.isAndroid
      ? 'https://salabackend.koompi.com/private/api'
      : 'https://salabackend.koompi.com/private/api',
      // defaultHeaders:<String, String>{
      //   'recapcha_token': '03ANYolqtDeeYLzbHeJ7a0OufSBc9BP1QwpxhXrmUx3hpxkQCmxFgSNAYa1c7_SoFoFtzd-sETw8LdCI_nhX-XF9xoT1HWxpIVhrqJBIvkSZGq7BtyLhjVWWHrTe5WZbBDxFF7OdWheKJnW4nFAoCRhXU0OgTHJABjUMnGHmt542emAoMxcQjNxh5kIyN4Y1k4-aO8i4IZCe00TlIa18uLdtfPrQRdvMvztaJFD6b3c93wBIYyyECef1R56w-X4DIr3FReGOlO5qro9YuyA5Aa4r0n9TxNU2-aV26fidXjKqEqwjDpSNyG4A1c8hqPQKhn8SJpmfJpVruH4u806eNkogNrMifbqkxjH-wQ46wV4TaZmlN9sBiKSoKN9dq1gCFcEOQHvsM7R4WW9Ljd2a-g30MTIY2N9WxCn2wZygjQfYueneG5oHxKcv6rXsJ7HEWQF2P8JaoTN9P1cNqouIjpumtpIDMV588MzQ',
      // },
    );
      
  static void setToken(String token) {
    print(token);
    AuthLink alink = AuthLink(getToken: () async => token);//'your access  token');
    GraphQLConfiguration.link = alink.concat(GraphQLConfiguration.httpLink);
  }

  static void removeToken() {
    GraphQLConfiguration.link = null;
  }

  static Link? getLink() {
    // print("Link${GraphQLConfiguration.link}");
    return GraphQLConfiguration.link ?? GraphQLConfiguration.httpLink;
  }

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: getLink()!,
      cache: GraphQLCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );
  
  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(dataIdFromObject: typenameDataIdFromObject),
      link: getLink()!,
    );
  }
}
