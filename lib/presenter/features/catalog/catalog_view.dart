import 'package:app_anit_flutter/app/locator.dart';
import 'package:app_anit_flutter/data/api/api_data_source.dart';
import 'package:app_anit_flutter/domain/services/get_catalog_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';

import 'catalog_viewmodel.dart';

class CatalogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel  = locator<CatalogViewModel>();
    //final viewModel  = CatalogViewModel();

    return ViewModelBuilder<CatalogViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.hasError
            ? Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text(
                  'An error has occered while running the future',
                  style: TextStyle(color: Colors.white),
                ),
              )
            : Center(
                child: model.isBusy
                    ? const CircularProgressIndicator()
                    : Text(model.getCreate()),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {}
          //     model.getCatalog(
          //   catalog: 'Номенклатура',
          //   count: 10,
          //   offset: 0,
          //   search: '1C',
          // )
          ,
        ),
      ),
      viewModelBuilder: () => viewModel,
    );
  }
}
