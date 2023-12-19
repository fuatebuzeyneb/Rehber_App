import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/home_cubit/home_cubit.dart';

class ListViewCharactersCardWidget extends StatelessWidget {
  const ListViewCharactersCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
        return state is HomeCharactersLoading
            ? SizedBox(
                height: size.width * 0.45,
                width: double.infinity,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
        // SizedBox(
        //     height: size.width * 0.45,
        //     child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: homeCubit.historicalCharactersList.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return CustomCharactersCardWidget(
        //           historicalCharacters:
        //               homeCubit.historicalCharactersList[index],
        //         );
        //       },
        //     ),
        //   );
      },
    );
  }
}
/*


*/
