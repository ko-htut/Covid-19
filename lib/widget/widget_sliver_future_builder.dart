import 'package:corona/widget/widget_net_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ValueWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

class CustomSliverFutureBuilder<T> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final Function futureFunc;
  final Map<String, dynamic> params;

  CustomSliverFutureBuilder({
    @required this.futureFunc,
    @required this.builder,
    this.params,
  });

  @override
  _CustomFutureBuilderState<T> createState() => _CustomFutureBuilderState<T>();
}

class _CustomFutureBuilderState<T> extends State<CustomSliverFutureBuilder<T>> {
  Future<T> _future;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      _request();
    });
  }

  void _request() {
    setState(() {
      if (widget.params == null)
        _future = widget.futureFunc(context);
      else
        _future = widget.futureFunc(context, params: widget.params);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _future == null
        ? SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              height: 100,
              child: CupertinoActivityIndicator(),
            ),
          )
        : FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      child: CupertinoActivityIndicator(),
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return widget.builder(context, snapshot.data);
                  } else if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                      child: NetErrorWidget(
                        callback: () {
                          _request();
                        },
                      ),
                    );
                  }
              }
              return Container();
            },
          );
  }
}
