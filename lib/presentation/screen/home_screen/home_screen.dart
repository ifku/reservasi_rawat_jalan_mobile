import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/common/base_shimmer.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/card/rrj_doctor_schedule_card.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/card/rrj_menu_item_card.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/card/rrj_news_card.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/home_screen/bloc/home_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/home_screen/widget/home_menu_item_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(const FetchHomeData());
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${LocaleKeys.homeScreen_halo.tr()}, Ifku Syoba!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18.0),
                ),
                const SizedBox(height: 12.0),
                Text(
                  LocaleKeys.homeScreen_whatDoYouWantToDoToday.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                      ),
                ),
                const SizedBox(height: 12.0),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 80,
                    crossAxisCount: 2,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return RRJMenuItemCard(
                        menuLabel: HomeMenuItemData.getLabel(index),
                        menuDescription: HomeMenuItemData.getDescription(index),
                        menuIcon: HomeMenuItemData.getIcon(index),
                        iconContainerColor: HomeMenuItemData.getColor(index),
                        onTap: () {
                          switch (index) {
                            case 0:
                              context.goNamed(RouteName.clinicList);
                            case 2:
                              context.goNamed(RouteName.reservation);
                          }
                        });
                  },
                ),
                const SizedBox(height: 18.0),
                Text(
                  LocaleKeys.homeScreen_latestInformation.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18.0),
                ),
                const SizedBox(height: 18.0),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return BaseShimmer(
                        child: SizedBox(
                          height: 200.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: RRJColors.grey200,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      );
                    }
                    if (state is HomeSuccess) {
                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: state.news.map((news) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: RRJNewsCard(
                                newsTitle: news.title,
                                newsImageUrl: news.urlToImage,
                                newsDate: news.publishedAt,
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const SizedBox(height: 18.0),
                Text(
                  LocaleKeys.homeScreen_upcomingSchedule.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18.0),
                ),
                const SizedBox(height: 18.0),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return BaseShimmer(
                        child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: RRJColors.grey200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    if (state is HomeSuccess) {
                      return ListView.builder(
                          itemCount: state.upcomingSchedule.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 14.0),
                              child: RRJDoctorScheduleCard(
                                doctorName:
                                    state.upcomingSchedule[index].doctorName,
                                doctorSchedule: state
                                    .upcomingSchedule[index].doctorSchedule,
                                doctorImage:
                                    state.upcomingSchedule[index].doctorImage,
                              ),
                            );
                          });
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const FetchHomeData());
  }
}
