import 'package:flutter/material.dart';

class CustomBottomSheet {
  Future<void> show({
    required BuildContext context,
    required Widget body,
  }) async {
    final deviceHeight = MediaQuery.of(context).size.height;
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      enableDrag: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: deviceHeight * 0.8,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: body,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
