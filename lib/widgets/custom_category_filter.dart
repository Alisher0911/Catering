import 'package:catering/bloc/filter/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCategoryFilter extends StatelessWidget {

  CustomCategoryFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return Center(child: CircularProgressIndicator());
        }

        else if (state is FilterLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.filter.categoryFilters.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.filter.categoryFilters[index].category.name,
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(
                      height: 25,
                      child: Checkbox(
                        value: state.filter.categoryFilters[index].value,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (bool? newValue) {
                          context.read<FilterBloc>().add(
                            CategoryFilterUpdated(categoryFilter: state.filter.categoryFilters[index].copyWith(value: !state.filter.categoryFilters[index].value))
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }
          );
        }

        else {
          return Text("Something went wrong.");
        }
        
      },
    );
  }
}
