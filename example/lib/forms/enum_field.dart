import 'package:flutter/material.dart';

import 'field.dart';
import 'field_wrapper.dart';

class EnumField<T extends Enum> extends Field<T> {
  final List<T> values;

  const EnumField({
    super.key,
    super.enabled,
    required super.title,
    required super.value,
    required super.setValue,
    required this.values,
  });

  @override
  EnumFieldState<T> createState() => EnumFieldState<T>();
}

class EnumFieldState<T extends Enum> extends State<EnumField<T>> {
  @override
  Widget build(BuildContext context) {
    return FieldWrapper(
      title: widget.title,
      child: DropdownButton<T>(
        isExpanded: true,
        value: widget.value,
        items: widget.values
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e.toString()),
              ),
            )
            .toList(),
        onChanged: widget.enabled ? (v) => widget.setValue(v!) : null,
      ),
    );
  }
}
