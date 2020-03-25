import 'package:flutter/material.dart';

class CaseContainer extends StatelessWidget {
  final String image;
  final String title;
  final String firstSpan;
  final String secondSpan;
  final String refreshButton;
  final bool useImage;
  final bool isRefreshable;
  final onTap;
  final TextStyle _spanStyle = TextStyle(fontSize: 16, color: Colors.black);

  CaseContainer(
      {@required this.title,
      @required this.useImage,
      @required this.isRefreshable,
      this.onTap,
      this.image,
      this.firstSpan,
      this.secondSpan,
      this.refreshButton = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            if (useImage) Image.asset(image),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                title,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text(
                    firstSpan,
                    style: _spanStyle,
                  ),
                  Text(
                    secondSpan,
                    style: _spanStyle,
                  )
                ],
              ),
            ),
            if (isRefreshable)
              Material(
                color: Colors.white,
                child: InkWell(
                    splashColor: Colors.grey,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.refresh,
                              color: Theme.of(context).primaryColor),
                          Text(
                            refreshButton,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    onTap: onTap),
              )
          ],
        ),
      ),
    );
  }
}
