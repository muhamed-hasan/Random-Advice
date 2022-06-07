import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_activity/feature/random_activity/display/pages/legalese_page.dart';
import 'package:random_activity/feature/random_activity/display/pages/random_activity_page.dart';

import '../provider/random_activity_provier.dart';
import '../provider/selected_page_provider.dart';
import 'bottom_bar_widget.dart';

List<Widget> pages = const [RandomActivityPage(), LegalesePage()];

class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedPage = Provider.of<SelectedPageProvider>(context).selectedPage;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('The Boring App'),
        actions: [
          IconButton(
            onPressed: () async {
              Provider.of<SelectedPageProvider>(context, listen: false)
                  .changePage(0);

              Provider.of<RandomActivityProvider>(context, listen: false)
                  .eitherFailureOrRandomActivity();
            },
            icon: const Icon(
              Icons.flash_on_outlined,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
      body: pages[selectedPage],
      bottomNavigationBar: const CustomBottomBarWidget(),
    );
  }
}
