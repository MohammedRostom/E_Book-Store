import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/profile/widget/Cust_ProfileSlide.dart';

import '../../../../../../generated/l10n.dart';

class Section2 extends StatelessWidget {
  const Section2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Row(
          children: [
            Expanded(
              child: Cust_ProfileSlide(
                removeBRightBorder: false,
                TopText:
                    " ${CrudBooks_controller(context).getTotalPrice(CrudBooks_controller(context).CartBooks).toStringAsFixed(2)} \$",
                undertext: S.of(context).Total_Price,
              ),
            ),
            Expanded(
              child: Cust_ProfileSlide(
                removeBRightBorder: true,
                TopText:
                    CrudBooks_controller(context).CartBooks.length.toString(),
                undertext: S.of(context).Orders,
              ),
            ),
          ],
        ));
  }
}
