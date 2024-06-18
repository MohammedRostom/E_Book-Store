import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Methods/Navigator.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/core/utils/style/String.dart';
import 'package:flutter_application_2/features/featsures/data/models/single_booktModel.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/BodyOflayOutScreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/CustomAppbarAllscreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/CRUD_books/crud_books_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/detalis/widgets/InfoSection.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/detalis/widgets/viewBooksection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../generated/l10n.dart';

class DetalisBody extends StatelessWidget {
  const DetalisBody({
    super.key,
    required this.Model,
  });

  final single_booktModel Model;

  @override
  Widget build(BuildContext context) {
    return BodyOflayOutScreen(
      BodyOflayOutChild: BlocConsumer<CrudBooksCubit, CrudBooksState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  CustomAppbarAllscreen(
                      onTapLeftIcon: () => backFromContext(context),
                      visibleLeftIcon: true,
                      LeftIcon: Icons.arrow_back_ios,
                      CenterText: S.of(context).Detalis_E_book,
                      RightIcon: Assets.Favorite),
                  viewBooksection(Model: Model),
                  InfoSection(Model: Model),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
