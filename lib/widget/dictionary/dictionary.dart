import 'dart:convert';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:dictionary/models/clssavetransaction.dart';
import 'package:dictionary/services/savetransaction.dart';
import 'package:dictionary/widget/dictionary/body/body.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dictionary extends StatefulWidget {
  const Dictionary({Key? key}) : super(key: key);

  @override
  State<Dictionary> createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  var presponse = "";
  // var didReceiveResponse = true;
  responseReceived() {
    setState(() {});
  }

  var objmemberId;
  var objmemdetails;
  var details;
  var gtokendata = '';
  var getorderid = DateTime.now().millisecondsSinceEpoch.toString();

  saveTransaction({orderNo, amount, memberId, apiUrl}) {
    var data = {'OrderNo': orderNo, 'Amount': amount, 'MemberId': memberId};
    SaveTransaction().postData(data, apiUrl);
  }

  payment() async {
    setState(() {});
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    objmemdetails = sharedPreferences.getString('MemberDetails');
    objmemberId = sharedPreferences.getString('memberId');
    details = jsonDecode(objmemdetails);

    String orderId = getorderid;
    String stage = "TEST";
    // String stage = "PROD";
    String orderAmount = "100";
    // String tokenData = gtokendata;
    // String customerName = details['fullName'];
    String customerName = 'Shivraj Tiwaskar';
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "132204cc7dd132c098dcddc7d02231";
    String customerPhone = '7720067330';
    String customerEmail = 'shivrajtiwaskar@gmail.com';
    // String customerPhone = details['mobile'];
    // String customerEmail = details['email'];
    String notifyUrl = "https://test.gocashfree.com/notify";
    var dataTransaction = {
      'OrderNo': getorderid,
      'Amount': '100',
      'MemberId': objmemberId
    };
    http.Response res = await http.post(
        Uri.parse(
          'https://test.cashfree.com/api/v2/cftoken/order',
        ),
        headers: {
          'x-client-id': '132204cc7dd132c098dcddc7d02231',
          'x-client-secret': '54fa18ee43ab4bef15cf005c32f49bb1de19a828',
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode({
          'orderId': getorderid,
          'orderAmount': '100',
          'orderCurrency': 'INR'
        }));
    // #saveTransactionResponsive
    var saveTransactionResponsive = await SaveTransaction()
        .postData(dataTransaction, 'api/transaction/SaveTransaction');

    //##########saveTransactionResponsive
    if (res.statusCode == 200) {
      Map<String, dynamic> map = json.decode(res.body);
      //  String token = ["cftoken"].toString();
      Map<String, dynamic> inputs = {
        "orderId": orderId,
        "orderAmount": orderAmount,
        "customerName": customerName,
        "orderNote": orderNote,
        "orderCurrency": orderCurrency,
        "appId": appId,
        "hideOrderId": false,
        "customerPhone": customerPhone,
        "customerEmail": customerEmail,
        "stage": stage,
        "tokenData": map["cftoken"],
        "notifyUrl": notifyUrl
      };

      CashfreePGSDK.doPayment(inputs)
          .then((value) => value?.forEach((key, value) {
                // responseReceived();
                debugPrint("$key : $value");
                presponse += "\"$key\":\"$value\"\n";

                saveTransaction(
                    amount: '100',
                    memberId: objmemberId,
                    orderNo: getorderid,
                    apiUrl: 'api/transaction/UpdateTransaction');
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        payment();
      }),
      body: const SingleChildScrollView(child: DBody()),
    );
  }
}
