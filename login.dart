import 'package:chitterchatter/Screens/otp.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumLogin extends StatefulWidget {
  const PhoneNumLogin({Key? key}) : super(key: key);

  @override
  _PhoneNumLoginState createState() => _PhoneNumLoginState();
}

class _PhoneNumLoginState extends State<PhoneNumLogin> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  var phone;
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'IN');

    setState(() {
      this.number = number;
    });
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(30),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    phone = number.phoneNumber;
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controller,
                  formatInput: true,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.purple.shade900, width: 5.0),
                  ),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade900,
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: () {
                formKey.currentState?.save();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Otp(
                              phone: phone,
                            )));
              },
              child: Text('Send OTP'),
            ),
          ],
        ),
      ),
    ));
  }
}
