import 'package:flutter/material.dart';
import 'package:resume/config/core/base_model.dart';
import 'package:resume/config/core/dependency_injection/locator.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  final Function(T)? onDispose;

  const BaseView({
    super.key,
    required this.builder,
    this.onModelReady,
    this.onDispose,
  });

  @override
  createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    var onModelReady = widget.onModelReady;
    if (onModelReady != null) {
      onModelReady(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    var onDispose = widget.onDispose;
    if (onDispose != null) {
      onDispose(model);
    }
    super.dispose();
  }

  @override
  Widget build(context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
