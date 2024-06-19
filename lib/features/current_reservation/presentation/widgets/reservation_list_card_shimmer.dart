import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/base_shimmer.dart';

class ReservationListCardShimmer extends StatelessWidget {
  const ReservationListCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shadowColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 14.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseShimmer(
                          child: Container(
                        height: 16.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      )),
                      BaseShimmer(
                          child: Container(
                        height: 16.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      )),
                    ],
                  ),
                  BaseShimmer(
                      child: Container(
                    height: 16.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseShimmer(
                    child: Container(
                  height: 16.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                )),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseShimmer(
                            child: Container(
                          height: 16.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        )),
                        const SizedBox(height: 40.0),
                        BaseShimmer(
                            child: Container(
                          height: 16.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        )),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseShimmer(
                            child: Container(
                          height: 16.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        )),
                        const SizedBox(height: 40.0),
                        BaseShimmer(
                            child: Container(
                          height: 16.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: BaseShimmer(
                child: Container(
              height: 48.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
            )),
          )
        ],
      ),
    );
  }
}
