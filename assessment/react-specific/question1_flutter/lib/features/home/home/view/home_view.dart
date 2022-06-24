import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/extensions/color_extension/color_extension.dart';
import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../viewModel/home_view_model.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel _homeViewModel) {
        return RefreshIndicator(
          onRefresh: () async {
            _homeViewModel.init();
          },
          color: context.marvelRed,
          child: Scaffold(
            appBar: appBarCustom(context),
            //bottomNavigationBar: bottomNavBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar appBarCustom(BuildContext context) {
    return AppBar(
      elevation: 5,
      title: Image(
        image: AssetImage(
          AppConstant.instance!.PROJECT_LOGO_PATH,
        ),
        width: MediaQuery.of(context).size.width * 0.35,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: context.mediumWidthPadding2),
          child: Icon(
            Icons.settings_outlined,
            color: context.marvelRed,
          ),
        ),
      ],
    );
  }
}
