import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/Home/viewmodel/occasioncubit/occasions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Occasion extends StatelessWidget {
  const Occasion({
    super.key,
    required this.occasionImageUrl,
    required this.title,
  });

  final String occasionImageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 131,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://flower.elevateegy.com/uploads/' + occasionImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 5),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textColor1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class OccasionList extends StatefulWidget {
  const OccasionList({super.key});

  @override
  State<OccasionList> createState() => _OccasionListState();
}

class _OccasionListState extends State<OccasionList> {
  @override
  @override
  void initState() {
    super.initState();
    // context.read<OccasionsCubit>().getAllOccasions();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<OccasionsCubit, OccasionsState>(
      builder: (context, state) {
        if (state is OccasionsError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is OccasionsLoaded) {
          return SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.occasions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Occasion(
                    occasionImageUrl: state.occasions[index].image,
                    title: state.occasions[index].name,
                  ),
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        );
      },
    );
  }
}
