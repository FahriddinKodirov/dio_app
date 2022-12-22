import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GooglPage extends StatefulWidget {
  const GooglPage({super.key});

  @override
  State<GooglPage> createState() => _GooglPageState();
}

class _GooglPageState extends State<GooglPage> {
  late WebViewController webViewController;

 @override
  void initState() {
    webViewController = WebViewController()
     ..setJavaScriptMode(JavaScriptMode.unrestricted)
     ..setBackgroundColor(const Color(0x00000000))
     ..setNavigationDelegate(NavigationDelegate(onProgress: (progress) {
       
     },
     onPageStarted: (url) {},
     onPageFinished: (url) {},
     onWebResourceError: (error) {},
      onNavigationRequest: (NavigationRequest request) {
      if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
      }
     ))..loadRequest(Uri.parse('https://google.com'));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
                          height: MediaQuery.of(context).size.height,
                          
                          width: MediaQuery.of(context).size.width,
                          child: WebViewWidget(controller: webViewController),
                        ),
      ),
    );
  }
}