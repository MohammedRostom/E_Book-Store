// import 'package:ebook/core/Api%20helper/api.dart';

import '../../../../../core/Api helper/api.dart';
import '../../../../../core/utils/const.dart';

class GetDataFromApi {
  final KeyOfbooks = "books";

  Future<dynamic> GetAllbooks({String? Query}) async {
    try {
      Map<String, dynamic> response = await ApiHelper().get(
        url: "https://api.itbook.store/1.0/new",
      );
      print("========================>>>>>>>>>>> ${response[KeyOfbooks]}");
      return response[KeyOfbooks];
    } catch (e) {}
  }

  var Mongo = "mongodb";
  Future<dynamic> Getbooks({String? Query}) async {
    try {
      Map<String, dynamic> response = await ApiHelper().get(
        url: URls.PaseUrl + URls.pathSearchKooks + "${Query ?? Mongo}",
      );

      return response[KeyOfbooks];
    } catch (e) {}
  }

  Future<dynamic> GetSingleBook({required String isbn13}) async {
    try {
      Map<String, dynamic> response = await ApiHelper().get(
        url: URls.PaseUrl + URls.pathSingleBook + isbn13,
      );
      return response;
    } catch (e) {
      Exception(e.toString());
    }
  }

  // Future<void> Addproduct(
  //   Model,
  // ) async {
  //   try {
  //     await ApiHelper().Post(Model, Url: "$Purl/product");
  //   } catch (e) {
  //     // Handle errors
  //     throw Exception('Failed to add product: $e');
  //   }
  // }
}


//   Future<void> UpdateProduct(
//     ProductModel Model,
//   ) async {
//     try {
//       await ApiHelper().update(Model, url: "$Purl/product/${Model.id}");
//     } catch (e) {
//       // Handle errors
//       throw Exception('Failed to add product: $e');
//     }
//   }



//   Future<void> DeleteProduct(
//     ProductModel product,
//   ) async {
//     try {
//       await ApiHelper().delete(
//         Url: "$Purl/product/${product.id}",
//       );
//     } catch (e) {
//       // Handle errors
//       throw Exception('Failed to add product: $e');
//     }
//   }



// //   Get all users
//   Future<dynamic> GetAllusers() async {
//     var response = await ApiHelper().get(
//       url: "$Purl/users",
//     );

//     return response["data"]["users"];
//   }



//   Future<dynamic> adduser(Model, endPoint) async {
//     try {
//       var user = await ApiHelper().post(Model, Url: "$Purl/users/$endPoint");
//       print("============================>$user");
//       if (user.containsKey("token")) {
//         return user;
//       } else {
//         return user["message"];
//       }
//     } catch (e) {}
//   }
// }