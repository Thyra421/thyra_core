import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// Affiche du HTML dans une webview. La taille de ce widget s'adapte a son contenu.
class HtmlViewer extends HookWidget {
  const HtmlViewer(this.content, {super.key, this.cookies});

  final String content;
  final Map<String, String>? cookies;

  String get _htmlContent => '''
          <html lang="fr">
              <meta name="viewport" content="width=device-width user-scalable=no zoom=1.1">
              <style>img {max-width: 100%; height: auto}</style>
              <body>
              <div class="container" id="_flutter_target_do_not_delete">$content</div>
              <script>
              function outputsize() {
                  if (typeof window.flutter_inappwebview !== "undefined" && typeof window.flutter_inappwebview.callHandler !== "undefined")
                      window.flutter_inappwebview.callHandler('newHeight', document.getElementById("_flutter_target_do_not_delete").offsetHeight);
                  }
                new ResizeObserver(outputsize).observe(_flutter_target_do_not_delete)
              </script>
            </body>
          </html>
        ''';

  @override
  Widget build(BuildContext context) {
    final height = useState<double>(0);

    return SizedBox(
      height: height.value + (height.value == 0 ? 0 : 50),
      child: InAppWebView(
        initialData: InAppWebViewInitialData(data: _htmlContent),
        initialSettings: InAppWebViewSettings(
          mixedContentMode: MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
          supportZoom: false,
          javaScriptEnabled: true,
          disableHorizontalScroll: true,
          disableVerticalScroll: true,
        ),
        onReceivedServerTrustAuthRequest: (controller, challenge) async =>
            ServerTrustAuthResponse(
          action: ServerTrustAuthResponseAction.PROCEED,
        ),
        onLoadStart: (controller, url) async {
          if (url != null && url.toString() != 'about:blank') {
            await controller.stopLoading();
          }
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          final uri = navigationAction.request.url;

          if (uri != null && uri.toString() != 'about:blank') {
            return NavigationActionPolicy.CANCEL;
          }
          return NavigationActionPolicy.ALLOW;
        },
        onWebViewCreated: (controller) {
          controller.addJavaScriptHandler(
            handlerName: 'newHeight',
            callback: (arguments) async {
              final int? h = arguments.isNotEmpty
                  ? arguments[0]
                  : await controller.getContentHeight();
              height.value = h?.toDouble() ?? 0;
            },
          );
        },
      ),
    );
  }
}
