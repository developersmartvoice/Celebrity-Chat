import 'package:get/get.dart';
import 'package:foap/helper/imports/common_import.dart';
import 'package:foap/helper/imports/club_imports.dart';
import '../../components/actionSheets/action_sheet1.dart';
import '../../components/group_avatars/group_avatar2.dart';
import '../../model/category_model.dart';
import '../../model/generic_item.dart';
import '../../model/post_model.dart';
import '../../segmentAndMenu/horizontal_menu.dart';

class CategoryClubsListing extends StatefulWidget {
  final CategoryModel category;

  const CategoryClubsListing({Key? key, required this.category})
      : super(key: key);

  @override
  CategoryClubsListingState createState() => CategoryClubsListingState();
}

class CategoryClubsListingState extends State<CategoryClubsListing> {
  final ClubsController _clubsController = ClubsController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _clubsController.getClubs(
          categoryId: widget.category.id, isStartOver: true);
      _clubsController.selectedSegmentIndex(index: 0, forceRefresh: false);
    });

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _clubsController.clear();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConstants.backgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          backNavigationBar(
            title: widget.category.name,
          ),
          divider().tP8,
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() => Column(
                        children: [
                          HorizontalMenuBar(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              onSegmentChange: (segment) {
                                _clubsController.selectedSegmentIndex(
                                    index: segment, forceRefresh: false);
                              },
                              selectedIndex:
                                  _clubsController.segmentIndex.value,
                              menus: [
                                allString.tr,
                                joinedString.tr,
                                myClubString.tr,
                              ]),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    List<ClubModel> clubs = _clubsController.clubs;

                    return _clubsController.clubs.isEmpty
                        ? Container()
                        : Column(
                            children: [
                              SizedBox(
                                height: clubs.length * 295,
                                child: ListView.separated(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    itemCount: clubs.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext ctx, int index) {
                                      return ClubCard(
                                        club: clubs[index],
                                        joinBtnClicked: () {
                                          _clubsController
                                              .joinClub(clubs[index]);
                                        },
                                        leaveBtnClicked: () {
                                          _clubsController
                                              .leaveClub(clubs[index]);
                                        },
                                        previewBtnClicked: () {
                                          Get.to(() => ClubDetail(
                                                club: clubs[index],
                                                needRefreshCallback: () {
                                                  _clubsController.getClubs(
                                                      categoryId:
                                                          widget.category.id,
                                                      isStartOver: false);
                                                },
                                                deleteCallback: (club) {
                                                  AppUtil.showToast(
                                                      message:
                                                          clubIsDeletedString
                                                              .tr,
                                                      isSuccess: true);
                                                  _clubsController
                                                      .clubDeleted(club);
                                                },
                                              ));
                                        },
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext ctx, int index) {
                                      return const SizedBox(
                                        height: 25,
                                      );
                                    }),
                              ),
                            ],
                          ).bP16;
                  }),
                ]))
              ],
            ),
          ),
        ],
      ),
    );
  }

  showActionSheet(PostModel post) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => ActionSheet1(
              items: [
                GenericItem(
                    id: '1', title: shareString.tr, icon: ThemeIcon.share),
                GenericItem(
                    id: '2', title: reportString.tr, icon: ThemeIcon.report),
                GenericItem(
                    id: '3', title: hideString.tr, icon: ThemeIcon.hide),
              ],
              itemCallBack: (item) {},
            ));
  }
}
