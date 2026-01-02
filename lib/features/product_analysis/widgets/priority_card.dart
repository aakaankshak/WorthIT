import 'package:flutter/material.dart';

class PriorityCard extends StatefulWidget {
  const PriorityCard({super.key});

  @override
  State<PriorityCard> createState() => _PriorityCardState();
}

class _PriorityCardState extends State<PriorityCard> {
  // Track multiple selected items in a Set
  final Set<String> _selectedFilters = {'Value'};
  final List<String> _options = [
    'Durability',
    'Value',
    'Performance',
    'Design',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: _options.map((String option) {
        final isSelected = _selectedFilters.contains(option);
        return FilterChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _selectedFilters.add(option);
              } else {
                // Prevent unselecting everything if you want at least one choice
                if (_selectedFilters.length > 1) {
                  _selectedFilters.remove(option);
                }
              }
            });
          },
          selectedColor: Colors.purple.shade400,
          checkmarkColor: Colors.white,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        );
      }).toList(),
    );
  }
}
