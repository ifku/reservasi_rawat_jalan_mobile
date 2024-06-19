import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/input_field/rrj_input_textfield.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/create_reservation/bloc/create_reservation/create_reservation_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/widgets/patient_list_card.dart';

class PatientSearch extends StatelessWidget {
  const PatientSearch(
      {super.key,
      required this.patientSearchController, this.onChanged});

  final TextEditingController patientSearchController;
  final Function(String, String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RRJInputTextField(
            controller: patientSearchController,
            hintText: LocaleKeys.createReservation_searchPatientName.tr(),
            textStyle: Theme.of(context).textTheme.bodyMedium,
            borderColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            focusedBorderColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            suffixIcon: Icon(
              Icons.search_rounded,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            )),
        const SizedBox(height: 16.0),
        BlocBuilder<CreateReservationBloc, CreateReservationState>(
          builder: (context, state) {
            if (state is FetchPatientDataLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FetchPatientDataSuccess) {
              return ListView.builder(
                itemCount: state.patientData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return PatientListCard(
                    title: state.patientData[index].patientFullname,
                    nik: state.patientData[index].patientNik,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    onPressed: () {
                      onChanged!(
                        state.patientData[index].idPatient,
                        state.patientData[index].patientFullname,
                      );
                      context.pop();
                    },
                  );
                },
              );
            }
            return const SizedBox();
          },
        )
      ],
    );
  }
}
