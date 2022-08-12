import 'package:flutter/material.dart';
import '../../../constant/api_path.dart';
import '../../../controller/org_controller.dart';
import '../../../model/org_model.dart';
import '../../../widget/cach_img.dart';
import '../../../widget/empty_list.dart';

class ListAllSchools extends StatefulWidget {
  const ListAllSchools({ Key? key }) : super(key: key);

  @override
  _ListAllSchoolsState createState() => _ListAllSchoolsState();
}

class _ListAllSchoolsState extends State<ListAllSchools> {

    //Call For List from API
  List<School> listSchools = [];
  SchoolController schoolController = SchoolController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initList();
  }

  void initList() async {
    listSchools = await schoolController.getSchoolList();
    setState(() {
      isLoading = false;
    });
  }

  Future<Null> _refreshList() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      initList();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    
    if(isLoading){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return RefreshIndicator(
      onRefresh: () => _refreshList(),
      child: listSchools.isEmpty? const ResueEmptyList(title:'អត់ទាន់មាន សាលានៅឡើយ' , size: 250,):
      ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: listSchools.length,
        itemBuilder: (BuildContext context, int index){
          School schools = listSchools[index];
          return ItemVideoComponent(
              status: false,
              srcThumbnail: schools.cover,
              titleVideo:schools.name,
              srcChannelImage: schools.logo,
              totalMember: schools.totalMember,
              totalCourses: schools.totalCourses,
              verify:schools.isVerify,
              viewsCount: schools.totalCourses.toString(),
              postTime:schools.createAt,
              onTap: () {
                print('GO TO DETAIL PAGE');
              });
        },
      ),
    );
  }
}




class ItemVideoComponent extends StatelessWidget {
  final String? srcThumbnail;
  final String? titleVideo;
  final String? srcChannelImage;
  final int? totalMember;
  final int? totalCourses;
  final String? viewsCount;
  final String? postTime;
  final bool? verify;
  final bool? status;
  final VoidCallback? onTapMenu;
  final Widget? childFavorite;
  final VoidCallback? onTap;
  const ItemVideoComponent(
      {Key? key,
      this.srcThumbnail,
      this.titleVideo,
      this.srcChannelImage,
      this.totalMember,
      this.totalCourses,
      this.viewsCount,
      this.postTime,
      this.status,
      this.onTapMenu,
      this.childFavorite,
      this.onTap,
      this.verify = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SalaApi salaApi = SalaApi();
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
        child: Container(
           decoration: BoxDecoration(
            border: Border.all(
                width: 0.5,
                color: Colors.grey.withOpacity(0.2)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)
          ),
          height: 290,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: CachNetworkHelper(
                    url: salaApi.imageUploade + srcThumbnail! ,
                  ),
              ),
              SizedBox(
                height: 80,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(top: titleVideo!.length > 40 ? 5 : 0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(salaApi.imageUploade + srcChannelImage!),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            titleVideo!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 17),
                          ),
                          Row(
                            children: [
                              // Text(
                              //   channelName,
                              //   maxLines: 2,
                              //   overflow: TextOverflow.ellipsis,
                              //   style: TypographyHelper.getBodyTextStyleBlack(context)
                              //       .copyWith(
                              //           color: AppColorConstant.getGreyColor(context),
                              //           fontSize: 13),
                              // ),
                              verify!
                                  ? const Padding(
                                      padding: EdgeInsets.only(left: 2, top: 5),
                                      child: Icon(
                                        Icons.check_circle,
                                        size: 10,
                                      ),
                                    )
                                  : Container(),
                              const SizedBox(width: 5),
                              Text(
                                "$postTime",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(width: 15),
                              Container(
                                alignment: Alignment.centerRight,
                                height: 20,
                                width: 90,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    rowIconText(
                                      context: context,
                                      icons: Icons.ondemand_video_rounded,
                                      colorIcon:Colors.grey,
                                      value: "$totalCourses".padLeft(2, '0'),
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                    rowIconText(
                                      context: context,
                                      icons: Icons.groups,
                                      colorIcon:Colors.grey,
                                      value: "$totalMember".padLeft(2, '0'),
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowIconText({BuildContext? context,IconData? icons,Color? colorIcon,String? value,TextStyle? style}) {
    return Row(
      children: [
        Icon(icons, size: 15, color: colorIcon),
        const SizedBox(width: 5),
        Text(
          value!,
          style: style,
        )
      ],
    );
  }
}
