import 'package:flutter/material.dart';
import 'package:cordes/core/viewmodels/base_view_model.dart';
import 'package:cordes/locator.dart';
import 'package:provider/provider.dart';

import '../../core/enum/viewstate.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  final T? viewModel;
  final VoidCallback? onDispose;
  BaseView({
    required this.builder,
    this.onModelReady,
    this.viewModel,
    this.onDispose,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => model,
      child: model.viewState == ViewState.Busy
          ? CircularProgressIndicator()
          : Consumer<T>(builder: widget.builder),
    );
  }
}
