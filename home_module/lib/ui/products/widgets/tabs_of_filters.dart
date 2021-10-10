import 'package:flutter/material.dart';
import 'package:home_module/ui/products/filters.dart';

class TabsOfFiltersProducts extends StatelessWidget {
  final IFilterProducts? filter;
  final FormFieldState state;
  const TabsOfFiltersProducts({ Key? key, this.filter,required this.state }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        Text('Filtros',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 5,),
        SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _TabFilter(filter: FilterProductsByName(),
                isActivate: filter is FilterProductsByName,
                label: "Nome",
                state: state,
                ),
                _TabFilter(filter: FilterProductsByCreateAt(),
                isActivate: filter is FilterProductsByCreateAt,
                label: "Criação",
                state: state,
                ),
                _TabFilter(filter: FilterProductsByQuantity(),
                isActivate: filter is FilterProductsByQuantity,
                label: "Quantidade",
                state: state,
                ),
                _TabFilter(filter: FilterProductsByPrice(),
                isActivate: filter is FilterProductsByPrice,
                label: "Preço",
                state: state,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class _TabFilter extends StatelessWidget {
  final IFilterProducts filter;
  final bool isActivate;
  final String label;
  final FormFieldState state;
  const _TabFilter({ Key? key,required this.filter,required this.isActivate, required this.label, required this.state }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          if(isActivate) return state.didChange(null);
          state.didChange(filter);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius:const  BorderRadius.all(Radius.circular(30)),
            color: isActivate ? Colors.orange : Colors.transparent,
            border: isActivate ? const Border() : Border.all(color: Colors.black)
          ),
          child: Text(label,
          style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}