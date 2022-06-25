import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/constants/app/app_constant.dart';
import '../../../../core/extensions/color_extension/color_extension.dart';
import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../viewModel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      lazy: false,
      create: (context) => HomeViewModel(),
      builder: (context, child) {
        return Scaffold(
            backgroundColor: context.themeWhiteColor,
            appBar: AppBar(title: Text('Question 1 App')),
            body: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: context
                                          .watch<HomeViewModel>()
                                          .previousBtnStatus !=
                                      true
                                  ? null
                                  : () {
                                      context
                                          .read<HomeViewModel>()
                                          .fetchPreviousItems();
                                    },
                              child: Text('Previous')),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                context.read<HomeViewModel>().fetchNextItems();
                              },
                              child: Text(' Next')),
                        ],
                      ),
                    )),
                Expanded(
                  flex: 11,
                  child: ListView.builder(
                    itemCount: context.watch<HomeViewModel>().homeItems?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.white10,
                          elevation: 2,
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: context.lowHeightPadding,
                                horizontal: context.highWidthPadding),
                            leading: Text(
                                'Id: ${context.watch<HomeViewModel>().homeItems?.elementAt(index)['id']}'),
                            title: Text(
                                'UserId: ${context.watch<HomeViewModel>().homeItems?.elementAt(index)['userId']}'),
                            subtitle: Text(
                                '${context.watch<HomeViewModel>().homeItems?.elementAt(index)['title']}'),
                            trailing: Text(
                                '${context.watch<HomeViewModel>().homeItems?.elementAt(index)['completed']}'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ));
      },
    );
  }
}
