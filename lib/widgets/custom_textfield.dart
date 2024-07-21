import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:ya9in/shared/colors.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  bool noIcon;
  Function(String)? onChanged;
  bool phoneNumber;

  CustomTextfield({
    super.key,
    required this.controller,
    required this.labelText,
    this.noIcon = true,
    this.onChanged,
    this.phoneNumber = false,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isObsecure = false;

  Country selectedCountry = Country(
    phoneCode: '213',
    countryCode: 'DZ',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Algeria',
    example: 'Algeria',
    displayName: 'Algeria',
    displayNameNoCountryCode: 'DZ',
    e164Key: '',
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecure,
      onChanged: widget.onChanged,
      controller: widget.controller,
      keyboardType:
          widget.phoneNumber ? TextInputType.phone : TextInputType.text,
      style: widget.phoneNumber
          ? TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
          : null,
      decoration: InputDecoration(
        prefix: widget.phoneNumber
            ? Container(
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    '${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : null,
        suffixIconColor: appPrimary,
        suffixIcon: widget.noIcon
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  setState(() {
                    isObsecure = !isObsecure;
                  });
                },
                icon: isObsecure
                    ? const Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              ),
        labelText: widget.labelText,
        contentPadding: EdgeInsets.all(15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
      ),
    );
  }
}
