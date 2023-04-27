import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content)),
  );
}

Future<void> showQuickAlert(
    BuildContext context, void Function() onLogOut) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 6,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                  ),
                  color: HexColor('#32cdbb'),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/confirm.gif',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Are You Sure?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Do you want to logout'),
                ],
              ),
            ],
          ),
        ),
        actionsPadding: const EdgeInsets.only(bottom: 20, top: 20),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              InkWell(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Ink(
                  decoration: BoxDecoration(
                    color: HexColor('#44564a'),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  height: 40,
                  width: 100,
                  child: const Center(
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  onLogOut();
                },
              ),
            ],
          )
        ],
      );
    },
  );
}
