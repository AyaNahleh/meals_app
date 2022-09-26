import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key, required this.saveFilters, required this.currentFilter}) : super(key: key);
  static const routeName = '/filters';
  final Function saveFilters;
  final Map currentFilter;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTitle(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }
  @override
  void initState() {
    _glutenFree=widget.currentFilter['gluten'];
    _vegetarian=widget.currentFilter['vegetarian'];
    _vegan=widget.currentFilter['vegan'];
    _lactoseFree=widget.currentFilter['lactose'];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            final selectedFilters={
              'gluten':_glutenFree,
              'lactose':_lactoseFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian,
            };
            widget.saveFilters(selectedFilters);
            }, icon: const Icon(Icons.save))
        ],
        title: const Text('Your Filter'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.headline1),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTitle(
                  'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTitle(
                  'Lactose-free', 'Only include lactose-free meals', _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
              _buildSwitchListTitle(
                  'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              _buildSwitchListTitle(
                  'Vegan', 'Only include vegan meals', _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
