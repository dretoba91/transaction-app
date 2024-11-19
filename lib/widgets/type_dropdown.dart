import 'package:flutter/material.dart';
import 'package:transaction_app/models/types.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/size_calculator.dart';

class TypeDropdown extends StatefulWidget {
  final TextEditingController? textController;
  const TypeDropdown({
    super.key,
    this.textController,
  });

  @override
  State<TypeDropdown> createState() => _TypeDropdownState();
}

class _TypeDropdownState extends State<TypeDropdown> {
  Types? selectedValue;
  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.textController,
          cursorHeight: sizer(true, 20.0, context),
          autofocus: false,
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            labelText: 'Income/Expense',
            contentPadding: EdgeInsets.only(
              top: sizer(false, 10, context),
              bottom: sizer(false, 12.5, context),
              left: sizer(true, 20, context),
              right: sizer(true, 20, context),
            ),
            fillColor: AppColors.primaryWhite,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(sizer(true, 12, context)),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.lightGreenColor,
              ),
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(sizer(true, 12, context)),
              borderSide: const BorderSide(
                width: 0.5, color: AppColors.lightGrey,
                //  style: BorderStyle.none,
              ),
            ),
            suffixIcon: DropdownButton<Types>(
              // value: selectedValue,
              icon: const Icon(
                Icons.arrow_drop_down,
              ),
              dropdownColor: AppColors.primaryWhite,
              onChanged: (Types? value) {
                setState(() {
                  selectedValue = value;
                  widget.textController?.text = value?.toName ?? '';
                });
              },
              items: Types.values.map<DropdownMenuItem<Types>>((Types value) {
                return DropdownMenuItem<Types>(
                  value: value,
                  child: Text(
                    value.name,
                    style: TextStyle(
                      height: sizer(true, 1.4, context),
                      color: AppColors.textDark2,
                      fontSize: sizer(true, 13, context),
                    ),
                  ),
                );
              }).toList(),
              underline: const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
