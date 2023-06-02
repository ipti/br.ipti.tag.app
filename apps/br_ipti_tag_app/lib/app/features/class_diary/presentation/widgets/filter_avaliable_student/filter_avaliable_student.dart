import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class FilterAvaliableStudent extends StatefulWidget {
  const FilterAvaliableStudent({super.key});

  @override
  State<FilterAvaliableStudent> createState() => _FilterAvaliableStudentState();
}

class _FilterAvaliableStudentState extends State<FilterAvaliableStudent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: SizedBox(
                  width: size.width * 0.4,
                  child: TagDropdownField(
                    onChanged: (e) => {},
                    label: 'Data',
                    padding: const EdgeInsets.all(5),
                    items: Map.fromEntries(
                      ["d", "e", "s", "p", "a", "c", "i", "t", "o"].map(
                        (e) => MapEntry(e, e),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: size.width * 0.4,
                  child: TagDropdownField(
                    onChanged: (e) => {},
                    label: 'Diciplina',
                    padding: const EdgeInsets.all(5),
                    items: Map.fromEntries(
                      ["d", "e", "s", "p", "a", "c", "i", "t", "o"].map(
                        (e) => MapEntry(e, e),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: size.width * 0.4,
                child: TagDropdownField(
                  onChanged: (e) => {},
                  label: 'Turma',
                  padding: const EdgeInsets.all(5),
                  items: Map.fromEntries(
                    ["d", "e", "s", "p", "a", "c", "i", "t", "o"].map(
                      (e) => MapEntry(e, e),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: TagColors.colorBaseProductNormal,
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.search, size: 24.0, color: TagColors.colorBaseProductLight),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
