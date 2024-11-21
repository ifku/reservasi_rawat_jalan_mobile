import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/card/rrj_doctor_card.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/features/doctor_schedule/presentation/pages/bloc/doctor_list_bloc.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<DoctorListBloc>().add(GetAllDoctorEvent());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        context.read<DoctorListBloc>().add(GetNextDoctorEvent());
      }
    });
  }

  @override
  void dispose() {
    context.read<DoctorListBloc>().add(ResetDoctorListEvent());
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.doctorListScreen_doctorList.tr(),
            style: Theme.of(context).textTheme.titleMedium),
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        actions: [
          IconButton(
            icon: Assets.icons.iconSortDown.svg(),
            onPressed: () {},
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<DoctorListBloc>().add(ResetDoctorListEvent());
          context.read<DoctorListBloc>().add(GetAllDoctorEvent());
        },
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: BlocConsumer<DoctorListBloc, DoctorListState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is DoctorListLoading) {
                return Center(child: Assets.raw.loadingAnim.lottie());
              }

              if (state is DoctorListSuccess) {
                if (state.doctorList.isEmpty) {
                  return Center(child: Text('No doctors found.'));
                }

                return ListView.separated(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemCount:
                      state.doctorList.length + (state.isFetchingMore ? 1 : 0),
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    if (index == state.doctorList.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return RRJDoctorCard(doctor: state.doctorList[index]);
                  },
                );
              }

              if (state is DoctorListFailure) {
                return Center(child: Text(state.message));
              }

              return Center(child: Text('No data available.'));
            },
          ),
        ),
      ),
    );
  }
}
