import 'package:flugraphql/constant/api_path.dart';
import 'package:flutter/material.dart';

import '../../backend/graphQL/graphQL_Conf.dart';
import 'components/body.dart';

class ListSchool extends StatefulWidget {

  const ListSchool({
    Key? key,
  }):super(key: key);
  @override
  _ListSchoolState createState() => _ListSchoolState();
}

class _ListSchoolState extends State<ListSchool> {
  // ScrollController scrollController = ScrollController();
  SalaApi salaApi = SalaApi();

  @override
  void initState() {
    GraphQLConfiguration.setToken(salaApi.staticToken);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Responsive responsive = Responsive(context);
    // SalaApi salaApi = SalaApi();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("សាលាទាំងអស់", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, ),),
      ),
      body:const Padding(
          padding: EdgeInsets.only(top: 3),
          child: ListAllSchools(),
        ),
    );
  }
}
