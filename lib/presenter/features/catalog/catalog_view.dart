import 'package:app_anit_flutter/app/locator.dart';
import 'package:chopper_api_anit/swagger_generated_code/swagger.models.swagger.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'catalog_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = locator<CatalogViewModel>();

    void _onClick() {
      // viewModel.getCatalog(
      //     catalog: 'Номенклатура', count: 30, offset: 0, search: '1C');
    }

    return ViewModelBuilder<CatalogViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 32, 8, 0),
              child: _StringForm(),
            ),
            Expanded(
              child: getData(model),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onClick,
        ),
      ),
      viewModelBuilder: () => viewModel,
    );
  }
}

Widget getData(CatalogViewModel model) {
  return model.hasError
      ? _getError(model)
      : Center(
          child: model.isBusy
              ? const CircularProgressIndicator()
              : _getList(model.listCatalogItem));
}

Widget _getError(CatalogViewModel model) {
  return Container(
    color: Colors.red,
    alignment: Alignment.center,
    child:  Text(
      model.error(model),
      style: const TextStyle(color: Colors.white),
    ),
  );
}

Widget _getList(List<CatalogItem> data) {
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
      title: Text(data[index].name ?? ''),
    ),
    itemCount: data.length,
  );
}

class _StringForm extends HookViewModelWidget<CatalogViewModel> {
  const _StringForm({Key? key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, CatalogViewModel model) {
    print('_StringForm rebuild');

    // return SearchTextField(
    //   searchFunctionCall: (text) => model.query(text),
    //   debounce: const Duration(seconds: 3),
    // );

    var text = useTextEditingController();

    return TextField(
      controller: text,
      onChanged: (str) {
        EasyDebounce.debounce(
          'search_field_debounce', // <-- An ID for this particular debouncer
          const Duration(milliseconds: 500), // <-- The debounce duration
          () => {model.query(str)}, // <-- The target method
        );
      },
    );
  }
}
