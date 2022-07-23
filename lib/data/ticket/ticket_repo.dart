import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ekub/data/api/api_endpoint.dart';
import 'package:ekub/data/api/api_helper.dart';
import 'package:ekub/data/api/baserepository/api.dart';
import 'package:ekub/data/auth/model/auth_response.dart';
import 'package:ekub/data/ticket/model/drop_ticket_model.dart';
import 'package:ekub/data/ticket/model/ticekt_model.dart';

class TicketRepo {
  dropTicket(DropTicketModel data) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      AuthResponse.withError(success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.Customeurl + ApiEndPoints.createDropTickets;

    final response = await apiUtils.post(url: url, data: data.toMap());
    return response.data;
  }

  dropTicketForClint(DropTicketModel data) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      AuthResponse.withError(success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.Customeurl + ApiEndPoints.dropTicketForClient;

    final response = await apiUtils.post(url: url, data: data.toMap());
    return response.data;
  }

  Future<List<TicketModel>> getMyLotto(String id) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      AuthResponse.withError(success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.Customeurl + ApiEndPoints.getCreatedTickets + id;

    final response = await apiUtils.get(url: url);

    List<TicketModel> res = List<TicketModel>.from(
        response.data.map((x) => TicketModel.fromMap(x)));

    return res;
  }
}
