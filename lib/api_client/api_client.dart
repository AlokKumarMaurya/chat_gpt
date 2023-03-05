import 'package:chat_gpt/api_client/responseModals/chatResponseModal.dart';
import 'package:chat_gpt/controller/all_list_controller/all_list_controller.dart';
import 'package:chat_gpt/controller/firebaseController/firebaseController.dart';
import 'package:chat_gpt/utils/helper_function.dart';
import 'package:get/get.dart';

import '../controller/networkManager.dart';
import '../utils/app_constants.dart';

class ApiClient extends GetConnect {
  Future<ChatResponsemodal?> getChatAnswer({required String question}) async {
    print("this is the user question $question");
    var bodyy = {
      "model": "text-davinci-003",
      "prompt": question,
      "temperature": 0,
      "max_tokens": 100,
      "top_p": 1,
      "frequency_penalty": 0.0,
      "presence_penalty": 0.0
    };
    var headerr = {
      "Content-Type": "application/json",
      "Authorization":
          //"Bearer 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"
          "Bearer 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"
    };

    if (await Get.put(NetWorkManager().getConnectivityType() )) {
      try {
        Get.find<AllListController>().addToList(value: {0:""});
        var response =
            await post(AppConstants.chatResponseUrl, bodyy, headers: headerr);
        AppHelperFunction().appPrint(val: response.statusCode.toString());
        AppHelperFunction().appPrint(val: response.body.toString());
        print(response.body.toString());
        if (response.statusCode == 200) {
          ChatResponsemodal modal = ChatResponsemodal.fromJson(response.body);
          String temp=modal.choices[0].text.replaceAll("\n", "");
          Get.find<AllListController>().removeFromList();
          Get.find<FireBaseController>().writeToFireBase();
          Get.find<AllListController>().addToList(value: {0:temp});
          print("this is the data that we are adding to the list" +temp+   "   8888888");
          return modal;
        }
      } catch (e) {
        AppHelperFunction().appPrint(val: e.toString());
      }
    } else {
      AppHelperFunction().showErrorSnackBar(
          text: "Not connected to internet please try again later");
    }
    return null;
  }
}
