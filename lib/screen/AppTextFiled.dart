
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String title;
  final String hint;
  final bool isCitySelected;
  final TextEditingController textEditingController;

  final List<SelectedListItem>? cities;

  const AppTextField({
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
    required this.textEditingController,

    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final TextEditingController _searchTextEditingController =
  TextEditingController();

  var selectecity;







  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "Catégories",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),


        data: widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {
          for (var item in selectedList) {


            showSnackBar(item.name);
            setState(() {
              selectecity=item.name;
              widget.textEditingController.text =item.name;
            });
          }

        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(

          onTap: widget.isCitySelected ? () {
            FocusScope.of(context).unfocus();
            onTextFieldTap();

          } : null,
          cursorColor: Colors.black,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding:
            const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

