import 'package:flutter/material.dart';

class SearchLeadsWidget extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final void Function(String) onSelected;
  final VoidCallback? onClearSearch;

  const SearchLeadsWidget({
    super.key,
    required this.hintText,
    required this.items,
    required this.onSelected,
    this.onClearSearch,
  });

  @override
  State<SearchLeadsWidget> createState() => _SearchLeadsWidgetState();
}

class _SearchLeadsWidgetState extends State<SearchLeadsWidget> {
  late final SearchController _controller;
  bool _hasSearchText = false;

  @override
  void initState() {
    super.initState();
    _controller = SearchController();
    _controller.addListener(() {
      final hasText = _controller.text.trim().isNotEmpty;
      if (_hasSearchText != hasText) {
        setState(() => _hasSearchText = hasText);
      }

      if (!hasText && widget.onClearSearch != null) {
        widget.onClearSearch!();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _resetSearch() {
    _controller.clear();
    widget.onClearSearch?.call();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      barBackgroundColor: WidgetStateProperty.all(Colors.grey.shade200),
      searchController: _controller,
      barHintText: widget.hintText,
      viewHintText: 'Search...',
      suggestionsBuilder: (context, controller) {
        final query = controller.text.toLowerCase();
        final filtered = widget.items
            .where((item) => item.toLowerCase().contains(query))
            .toList();

        if (widget.items.isEmpty) {
          return [
            const ListTile(
              title: Text('No items to search.',
                  style: TextStyle(color: Colors.grey)),
            )
          ];
        }

        if (filtered.isEmpty) {
          return [
            const ListTile(
              title: Text('No matches found.',
                  style: TextStyle(color: Colors.grey)),
            )
          ];
        }

        return filtered.map((item) {
          return ListTile(
            title: Text(item),
            onTap: () {
              _controller.text = item;
              FocusScope.of(context).unfocus();
              widget.onSelected(item);
              Navigator.pop(context);
            },
          );
        }).toList();
      },
      barLeading: const Icon(Icons.search),
      barTrailing: _hasSearchText
          ? [
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: _resetSearch,
              )
            ]
          : null,
    );
  }
}
