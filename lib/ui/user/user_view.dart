import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_source/user_network_data_source.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/component/card/recommend_card.dart';
import 'package:flutter_app/ui/drawer/drawer_view.dart';
import 'package:flutter_app/ui/user/user_view_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserView extends HookConsumerWidget {
  UserView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(userViewProvider);
    final recommend = ref.watch(userViewRecommendProvider);
    final l10n = L10n.of(context)!;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(l10n.user),
      ),
      drawer: const DrawerView(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 8),
                  person.when(
                    data: (UserResult result) {
                      final person = result.data;
                      return Column(
                        children: [
                          if (person != null) ...[
                            Text('${person.name}'),
                          ] else ...[
                            Text(l10n.user_not_registered),
                          ]
                        ],
                      );
                    },
                    error: (error, stackTrace) => Container(),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
              Divider(color: Colors.grey.shade300),
            ]),
          ),
          const SizedBox(height: 24),
          Text(l10n.user_recommend_book),
          const SizedBox(height: 12),
          Center(
            child: recommend.when(
              data: (List result) {
                return CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.4,
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 5),
                  ),
                  items: [
                    for (var docs in result) ...[RecommendCard(docs: docs)]
                  ],
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
