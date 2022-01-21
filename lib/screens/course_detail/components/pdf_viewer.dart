import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfViewer extends StatefulWidget {
  final String fileUrl;

  const PdfViewer({Key? key, required this.fileUrl}) : super(key: key);

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  String urlPDFPath = '';
  bool exists = true;
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  late PDFViewController _pdfViewController;
  bool loaded = false;

  Future<File> getFileFromUrl(String url, {name}) async {
    var fileName = 'topicLesson';
    if (name != null) {
      fileName = name;
    }
    try {
      var data = await http.get(Uri.parse(url));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/' + fileName + '.pdf');
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception('Error opening url file');
    }
  }

  void requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    print(statuses);
  }

  @override
  void initState() {
    var fileUrl = widget.fileUrl;
    requestPermission();
    getFileFromUrl(fileUrl).then(
      (value) => {
        setState(() {
          if (value != null) {
            urlPDFPath = value.path;
            loaded = true;
            exists = true;
          } else {
            exists = false;
          }
        })
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loaded) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: PDFView(
            filePath: urlPDFPath,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {},
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages!;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              setState(() {
                _pdfViewController = vc;
              });
            },
            onPageChanged: (int? page, int? total) {
              setState(() {
                _currentPage = page!;
              });
            },
            onPageError: (page, e) {},
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.chevron_left),
                iconSize: 50,
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    if (_currentPage > 0) {
                      _currentPage--;
                      _pdfViewController.setPage(_currentPage);
                    }
                  });
                },
              ),
              Text(
                '${_currentPage + 1}/$_totalPages',
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                iconSize: 50,
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    if (_currentPage < _totalPages - 1) {
                      _currentPage++;
                      _pdfViewController.setPage(_currentPage);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      );
    } else {
      if (exists) {
        return const SafeArea(
          child: Scaffold(
            body: Center(
              child: Text(
                'Loading..',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      } else {
        //Replace Error UI
        return const SafeArea(
          child: Scaffold(
            body: Text(
              'PDF Not Available',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }
    }
  }
}
