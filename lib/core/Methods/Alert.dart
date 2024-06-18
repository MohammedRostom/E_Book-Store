import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

Alert({required context, Text, required QuickAlertType State, title}) =>
    QuickAlert.show(
      title: title,
      context: context,
      type: State,
      text: Text,
      autoCloseDuration: Duration(seconds: 2),
      showConfirmBtn: false,
    );
