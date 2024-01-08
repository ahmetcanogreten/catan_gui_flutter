import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class SimplePaginatedTableHeader {
  final Widget child;
  final int flex;

  const SimplePaginatedTableHeader({
    required this.child,
    this.flex = 1,
  });
}

class SimplePaginatedTable extends StatelessWidget {
  final Widget title;
  final int itemCount;
  final int itemTotal;
  final int currentPage;
  final int pageSize;
  final Widget Function({required int rowIndex, required int columnIndex})
      itemBuilder;
  final void Function(int value)? onPageChanged;
  final void Function(int value)? onPageSizeChanged;
  final void Function({required int rowIndex})? onRowTap;

  final List<SimplePaginatedTableHeader> headers;

  const SimplePaginatedTable({
    super.key,
    required this.headers,
    this.title = const SizedBox.shrink(),
    required this.itemCount,
    required this.itemTotal,
    required this.itemBuilder,
    this.currentPage = 0,
    this.pageSize = 10,
    required this.onPageChanged,
    required this.onPageSizeChanged,
    this.onRowTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        title,
        const SizedBox(height: 48),
        Row(
          children: [
            ...headers
                .map((e) => Expanded(
                      flex: e.flex,
                      child: e.child,
                    ))
                .toList(),
          ],
        ),
        Divider(color: Colors.orange.shade100),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < itemCount; i++)
              Column(
                children: [
                  InkWell(
                    onTap: onRowTap == null
                        ? null
                        : () {
                            onRowTap!(rowIndex: i);
                          },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          ...headers
                              .mapIndexed((columnIndex, e) => Expanded(
                                    flex: e.flex,
                                    child: itemBuilder(
                                        rowIndex: i, columnIndex: columnIndex),
                                  ))
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            onPageChanged == null || onPageSizeChanged == null
                ? const SizedBox.shrink()
                : Row(
                    children: [
                      Row(
                        children: [
                          Text('Sayfa başına',
                              style: TextStyle(color: Colors.orange.shade100)),
                          const SizedBox(width: 16),
                          DropdownButton(
                              // focusColor: Colors.orange.shade100,
                              dropdownColor: Colors.black,
                              value: pageSize,
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text('1',
                                      style: TextStyle(
                                          color: Colors.orange.shade100)),
                                ),
                                DropdownMenuItem(
                                  value: 10,
                                  child: Text('10',
                                      style: TextStyle(
                                          color: Colors.orange.shade100)),
                                ),
                                DropdownMenuItem(
                                  value: 20,
                                  child: Text('20',
                                      style: TextStyle(
                                          color: Colors.orange.shade100)),
                                ),
                                DropdownMenuItem(
                                  value: 50,
                                  child: Text('50',
                                      style: TextStyle(
                                          color: Colors.orange.shade100)),
                                ),
                                DropdownMenuItem(
                                  value: 100,
                                  child: Text('100',
                                      style: TextStyle(
                                          color: Colors.orange.shade100)),
                                ),
                              ],
                              onChanged: ((value) =>
                                  onPageSizeChanged!(value as int))),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Row(
                        children: [
                          Text('Sayfa: ${currentPage + 1}',
                              style: TextStyle(color: Colors.orange.shade100)),
                          IconButton(
                            color: Colors.orange.shade100,
                            onPressed: currentPage == 0
                                ? null
                                : () {
                                    onPageChanged!(currentPage - 1);
                                  },
                            icon: const Icon(Icons.keyboard_arrow_left_rounded),
                          ),
                          IconButton(
                            color: Colors.orange.shade100,
                            onPressed:
                                currentPage * pageSize + itemCount == itemTotal
                                    ? null
                                    : () {
                                        onPageChanged!(currentPage + 1);
                                      },
                            icon: const Icon(
                              Icons.keyboard_arrow_right_rounded,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
            Text('Toplam: ${itemTotal}',
                style: TextStyle(color: Colors.orange.shade100)),
          ],
        ),
      ],
    );
  }
}
