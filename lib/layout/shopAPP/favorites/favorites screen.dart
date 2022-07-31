import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutcubit.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutstates.dart';
import 'package:untitled/layout/shopAPP/homelayout/shopplayout.dart';
import 'package:untitled/layout/shopAPP/homemodel/Getfavmodel.dart';


class favoritesscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<homelayoutcubit>(context)..getfavoritedata(),
      child: BlocConsumer<homelayoutcubit, homelayoutstates>(
        listener: (BuildContext context, state) {},
        builder: (context, state) {
          var cubit = homelayoutcubit.get(context);
          return homelayoutcubit.get(context).favomodel == null
              ? const Center(child: CircularProgressIndicator())
              : cubit.favomodel!.data.data.isEmpty
              ? const Center(
              child: Text(
                'Wishlist is empty 🙁',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ))
              : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildFavoriteItem(
                  cubit.favomodel!.data.data[index], context),
              separatorBuilder: (context, index) =>Center(child: Divider()),
              itemCount: cubit.favomodel!.data.data.length);
        },
      ),
    );
  }
}

Widget buildFavoriteItem(FavouriteData model, context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: SizedBox(
    height: 120.0,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image(
              image: NetworkImage(
                '${model.product.image}',
              ),
              width: 120.0,
              height: 120.0,
            ),
            if (model.product.discount != 0)
              Container(
                color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  'DISCOUNT',
                  style: TextStyle(color: Colors.white, fontSize: 10.0),
                ),
              )
          ],
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.product.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 14.0, color: Colors.black, height: 1.0),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    '${model.product.price}',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  if (model.product.discount != 0)
                    Text(
                      '${model.product.oldPrice}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        height: 1.0,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      homelayoutcubit.get(context)
                          .changefav(model.product.id);
                      homelayoutcubit.get(context).getfavoritedata();

                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);