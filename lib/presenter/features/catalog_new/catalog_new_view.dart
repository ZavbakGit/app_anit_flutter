import 'package:chopper_api_anit/swagger_generated_code/swagger.models.swagger.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'catalog_new_state.dart';
import 'catalog_new_viewmodel.dart';

class CatalogNewView extends StatelessWidget {
  CatalogNewView({Key? key}) : super(key: key);

  final TextEditingController _seachController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CatalogNewViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: _buildChildren(model),
          ),
        ),
      ),
      viewModelBuilder: () =>
          MockCatalogViewModel(), //locator<CatalogNewViewModel>(),
    );
  }

  List<Widget> _buildChildren(CatalogNewViewModel model) {
    return [
      const SizedBox(height: 16.0),
      const Center(child: Text('Каталог')),
      _getSearchField(_seachController, model.query),
      Expanded(
        child: _getDataArea(model),
      ),
    ];
  }

  Widget _getDataArea(CatalogNewViewModel model) {
    if (model.getState is LoadCatalogNewState) {
      return const Center(child:  CircularProgressIndicator(),);
    } else if (model.getState is DataCatalogNewState) {
      return _getListCatalog((model.getState as DataCatalogNewState).list);
    } else if (model.getState is ErrorCatalogNewState) {
      return _getErrorArea(
          (model.getState as ErrorCatalogNewState).errorMessage ?? '');
    } else {
      return _getErrorArea('Unknown state!');
    }
  }

  Widget _getErrorArea(String mess) {
    return Center(
      child: Text(
        mess,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _getSearchField(
    TextEditingController controller,
    void Function(String searchStr) callSearch,
  ) {
    return TextField(
      controller: controller,
      onChanged: (str) {
        EasyDebounce.debounce(
          'search_field_debounce', // <-- An ID for this particular debouncer
          const Duration(milliseconds: 500), // <-- The debounce duration
          () => callSearch(str), // <-- The target method
        );
      },
    );
  }

  Widget _getListCatalog(List<CatalogItem> list) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Divider(
          color: Colors.black,
        ),
      ),
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text(list[index].name ?? ''),
      ),
      itemCount: list.length,
    );
  }
}
