import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/home_cubit/home_cubit.dart';
import 'package:travel_app/widgets/custom_period_card_widget.dart';
import 'package:travel_app/widgets/services/functions/toast_msg.dart';
import 'package:travel_app/widgets/shimmer_widget.dart';

class ListViewPeriodCardWidget extends StatelessWidget {
  const ListViewPeriodCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomePeriodsFailure) {
          toastMsg(errorMsg: state.errorMsg);
        }
      },
      builder: (context, state) {
        HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
        return state is HomePeriodsLoading
            ? const ShimmerWidget()
            : SizedBox(
                height: (size.width * 0.3),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeCubit.historicalPeriodsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: CustomPeriodCardWidget(
                        historicalPeriodsModel:
                            homeCubit.historicalPeriodsList[index],
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
