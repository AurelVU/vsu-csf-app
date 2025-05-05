import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'debug_screen_presenter.dart';
import 'url_value.dart';

class DebugScreenView extends StatelessWidget {
  const DebugScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<DebugScreenPresenter>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 44,
        centerTitle: true,
        title: const Text(
          'Debug screen',
        ),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: presenter.configController,
        builder: (context, snapshot) {
          final config = snapshot.data ?? presenter.environment.config;
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 10),
              const Text(
                'Server url',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              RadioGroup(
                urlStream: presenter.urlController,
                prodUrl: config.prodUrl,
                stageUrl: config.stageUrl,
                testUrl: config.testUrl,
                customUrlController: presenter.urlCustomController,
                onChange: presenter.changeUrl,
              ),
              const SizedBox(height: 10),
              const Text(
                'Server proxy url',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              RadioGroup(
                urlStream: presenter.proxyController,
                prodUrl: config.proxyProdUrl,
                stageUrl: config.proxyStageUrl,
                testUrl: config.proxyTestUrl,
                customUrlController: presenter.proxyCustomController,
                onChange: presenter.changeProxy,
              ),

              const SizedBox(height: 10),
              const Text(
                'Debug config',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              TileSwitch(
                title: 'debugShowCheckedModeBanner',
                value: config.config.debugShowCheckedModeBanner,
                onChanged: presenter.switchDebugShowCheckedModeBanner,
              ),
              TileSwitch(
                title: 'showSemanticsDebugger',
                value: config.config.showSemanticsDebugger,
                onChanged: presenter.switchShowSemanticsDebugger,
              ),
              TileSwitch(
                title: 'checkerboardRasterCacheImages',
                value: config.config.checkerboardRasterCacheImages,
                onChanged: presenter.switchCheckerboardRasterCacheImages,
              ),
              TileSwitch(
                title: 'checkerboardOffscreenLayers',
                value: config.config.checkerboardOffscreenLayers,
                onChanged: presenter.switchCheckerboardOffscreenLayers,
              ),
              TileSwitch(
                title: 'showPerformanceOverlay',
                value: config.config.showPerformanceOverlay,
                onChanged: presenter.switchShowPerformanceOverlay,
              ),
              TileSwitch(
                title: 'debugShowMaterialGrid',
                value: config.config.debugShowMaterialGrid,
                onChanged: presenter.switchDebugShowMaterialGrid,
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: OutlinedButton(
            onPressed: presenter.save,
            child: const Text('SAVE'),
          ),
        ),
      ),
    );
  }
}

class TileSwitch extends StatelessWidget {
  const TileSwitch({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueSetter<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

class RadioGroup extends StatelessWidget {
  const RadioGroup({
    super.key,
    required this.urlStream,
    required this.prodUrl,
    required this.stageUrl,
    required this.testUrl,
    required this.customUrlController,
    required this.onChange,
  });

  final ValueSetter<UrlValue?> onChange;
  final BehaviorSubject<UrlValue> urlStream;
  final String prodUrl;
  final String stageUrl;
  final String testUrl;
  final TextEditingController customUrlController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: urlStream,
      builder: (context, snapshot) {
        final groupValue = snapshot.data ?? UrlValue.prod;
        final prodUrl = this.prodUrl.isNotEmpty ? this.prodUrl : 'blank';
        final stageUrl = this.stageUrl.isNotEmpty ? this.stageUrl : 'blank';
        final testUrl = this.testUrl.isNotEmpty ? this.testUrl : 'blank';
        return Column(
          children: [
            RadioListTile(
              title: Text(prodUrl),
              value: UrlValue.prod,
              groupValue: groupValue,
              onChanged: onChange,
            ),
            RadioListTile(
              title: Text(stageUrl),
              value: UrlValue.stage,
              groupValue: groupValue,
              onChanged: onChange,
            ),
            RadioListTile(
              title: Text(testUrl),
              value: UrlValue.test,
              groupValue: groupValue,
              onChanged: onChange,
            ),
            RadioListTile(
              value: UrlValue.custom,
              title: TextField(
                controller: customUrlController,
                decoration: const InputDecoration(hintText: 'custom url'),
              ),
              groupValue: groupValue,
              onChanged: onChange,
            ),
          ],
        );
      },
    );
  }
}
