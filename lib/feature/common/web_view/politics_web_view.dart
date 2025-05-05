import 'package:fkn/feature/common/web_view/politics_web_view_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PoliticsWebView extends StatefulWidget {
  const PoliticsWebView({
    super.key,
  });

  @override
  State<PoliticsWebView> createState() => _PoliticsWebViewState();
}

class _PoliticsWebViewState extends State<PoliticsWebView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<PoliticWebViewScreenPresenter>();
    return Scaffold(
      backgroundColor: AppColor.white,
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(controller: presenter.controller!),
              Container(
                height: 1000,
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: SizedBox(
                  width: double.infinity,
                  child: StreamBuilder<bool>(
                      stream: presenter.isLoading,
                    builder: (context, snapshot) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          foregroundColor: Theme.of(context).colorScheme.primary,
                          disabledBackgroundColor: Theme.of(context).colorScheme.secondary,
                          disabledForegroundColor: Theme.of(context).colorScheme.primary,
                          side: BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: snapshot.data == true ? null :  () {
                          presenter.goNext();
                        },
                        child: snapshot.data == true
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: CircularProgressIndicator(
                                    color: AppColor.newBlue,
                                  ),
                                ),
                              )
                            : const Text('Продолжить'),
                      );
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
