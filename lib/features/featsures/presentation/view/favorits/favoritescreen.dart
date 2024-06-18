import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/core/Methods/Navigator.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';
import 'package:flutter_application_2/core/utils/style/String.dart';
import 'package:flutter_application_2/features/featsures/data/data_sources/local/databsesTables.dart';
import 'package:flutter_application_2/features/featsures/data/models/single_booktModel.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/BodyOflayOutScreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/CustomAppbarAllscreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/IteamFavOrCart.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/NotificWidget.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/CRUD_books/crud_books_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../detalis/widgets/InfoSection.dart';

class favoriteS extends StatelessWidget {
  const favoriteS({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyOflayOutScreen(
        BodyOflayOutChild: BlocConsumer<CrudBooksCubit, CrudBooksState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          CustomAppbarAllscreen(
            MakeSpacerBetweenTwoElement: true,
            visibleLeftIcon: false,
            onTapLeftIcon: () => backFromContext(context),
            CenterText: S.of(context).FavoriteT,
            RightIcon: Assets.Favorite,
            Notific: CrudBooks_controller(context).FavBooks.isEmpty
                ? null
                : NotificWidget(
                    num: CrudBooks_controller(context).FavBooks.length,
                  ),
          ),
          Expanded(
            flex: 50,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    CrudBooks_controller(context).FavBooks.length,
                    (index) => IteamFavOrCart(
                          model: CrudBooks_controller(context).FavBooks[index]!,
                          onDismissed: (Arg) => CrudBooks_controller(context)
                              .RemoveItem(
                                  Id: CrudBooks_controller(context)
                                      .FavBooks[index]!
                                      .toJson()["id"],
                                  TableName: FavoriteTable),
                          IsCart: false,
                        )),
              ),
            ),
          ),
          Spacer(),
          CustBtn(
              onTap: () => AddAlltoCart(context),
              textBtn: S.of(context).Add_to_Cart,
              width: widthOfScreen(context))
        ]);
      },
    ));
  }
}

void AddAlltoCart(
  context,
) async {
  CrudBooks_controller(context).FavBooks.forEach((element) {
    CrudBooks_controller(context).CartBooks.add((element as single_booktModel));
  });
}
