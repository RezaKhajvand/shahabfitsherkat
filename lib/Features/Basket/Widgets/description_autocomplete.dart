import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shahabfit/Features/Basket/Data/getDescriptionListDataSource.dart';
import 'package:shahabfit/Features/Basket/Models/description_model.dart';
import 'package:shahabfit/Features/Basket/Utils/descriptiontype.dart';

class DescriptionAutocomplete extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final void Function(DescriptionModel)? onSelected;

  const DescriptionAutocomplete({
    super.key,
    required this.controller,
    this.label = 'توضیحات برنامه',
    this.onSelected,
  });

  @override
  State<DescriptionAutocomplete> createState() =>
      _DescriptionAutocompleteState();
}

class _DescriptionAutocompleteState extends State<DescriptionAutocomplete> {
  final debounce = const Duration(milliseconds: 1000);
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;
  List<DescriptionModel> _options = [];

  @override
  void dispose() {
    _debounce?.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _fetch(String q) async {
    try {
      final list =
          descriptionFromJson(await getDescriptionList(DescriptionType.tamrin));
      final filtered = list.where((e) => e.text.contains(q)).toList();
      setState(() => _options = filtered);
    } catch (_) {
      setState(() => _options = []);
    }
  }

  void _handleTextChanged() {
    _debounce?.cancel();
    _debounce = Timer(debounce, () => _fetch(widget.controller.text));
  }

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<DescriptionModel>(
      textEditingController: widget.controller,
      focusNode: _focusNode,
      displayStringForOption: (o) => o.text,
      optionsBuilder: (TextEditingValue value) {
        return _options;
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return TextField(
          onChanged: (value) => _handleTextChanged(),
          controller: controller,
          focusNode: focusNode,
          maxLines: 3,
          textAlignVertical: TextAlignVertical.top,
          style: const TextStyle(fontSize: 14, color: Colors.white),
          decoration: InputDecoration(
            alignLabelWithHint: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            label: Text(widget.label),
            labelStyle: const TextStyle(fontSize: 14),
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                separatorBuilder: (_, __) => const Divider(height: 2),
                itemBuilder: (context, index) {
                  final item = options.elementAt(index);
                  return ListTile(
                    dense: true,
                    title: Text(item.text),
                    onTap: () => onSelected(item),
                  );
                },
              ),
            ),
          ),
        );
      },
      onSelected: (val) {
        widget.controller.text = val.text;
        widget.onSelected?.call(val);
      },
    );
  }
}
