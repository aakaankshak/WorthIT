import 'package:flutter/material.dart';
import '../../core/widgets/logo_widget.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/responsive.dart';
import '../../navigation/app_routes.dart';

class ProductAnalysisScreen extends StatefulWidget {
  const ProductAnalysisScreen({super.key});

  @override
  State<ProductAnalysisScreen> createState() => _ProductAnalysisScreenState();
}

class _ProductAnalysisScreenState extends State<ProductAnalysisScreen> {
  // Controller to capture the input text
  final TextEditingController _linkController = TextEditingController();
  double _usageValue = 1.0;
  final Set<String> _selectedPriorities = {'Value'};
  final List<String> _priorities = [
    'Durability',
    'Value',
    'Performance',
    'Design',
  ];

  @override
  void dispose() {
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resp = Responsive(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: resp.scale(24),
                vertical: resp.scale(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Center(child: LogoWidget(size: 40, fontSize: 20)),
                  SizedBox(height: resp.scale(16)),
                  TextField(
                    controller: _linkController,
                    decoration: InputDecoration(
                      hintText: 'Paste product link here...',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: resp.scale(16)),
                  const Text(
                    'Usage',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 0,
                    color: Colors.grey.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          Slider(
                            value: _usageValue,
                            min: 0,
                            max: 2,
                            divisions: 2,
                            activeColor: Colors.purple,
                            onChanged: (newValue) =>
                                setState(() => _usageValue = newValue),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Light'),
                                Text('Moderate'),
                                Text('Heavy'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: resp.scale(16)),
                  const Text(
                    'Priority',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: _priorities.map((priority) {
                      final isSelected = _selectedPriorities.contains(priority);
                      return FilterChip(
                        label: Text(priority),
                        selected: isSelected,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedPriorities.add(priority);
                            } else if (_selectedPriorities.length > 1) {
                              _selectedPriorities.remove(priority);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: resp.scale(24)),
                  
                  PrimaryButton(
                    label: 'Analyze Product',
                    onPressed: () {
                      final productName = _linkController.text.trim();

                      Navigator.pushNamed(
                        context,
                        AppRoutes.loading,
                        arguments: productName.isEmpty ? "New Product" : productName,
                      );
                    },
                  ),
                  PrimaryButton(
                    label: 'Analyze Product',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.loading,
                        arguments: _linkController.text.isEmpty
                            ? "New Product"
                            : _linkController.text,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
