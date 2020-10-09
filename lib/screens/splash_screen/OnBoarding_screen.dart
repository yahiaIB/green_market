import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  final Function skip;

  OnBoardingScreen({this.skip});
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          color: Colors.white,
          child: Container(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                _currentPage = page;
                setState(() {});
              },
              children: <Widget>[
                _buildPageContent(
                    image: 'res/assets/images/firstOpenApp.png',
                    body: Column(
                      children: <Widget>[
                        CheckItem(
                          textContent: AppLocalizations.of(context)
                              .translate('save_your_time'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CheckItem(
                          textContent: AppLocalizations.of(context)
                              .translate('keep_comfort'),
                        ),
                      ],
                    ),
                    index: 1),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: new BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: <Widget>[
              Image.asset(
                "res/assets/images/wave.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                alignment: Alignment.topLeft,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => widget.skip(),
                        splashColor: Colors.white,
                        child: Text(
                          AppLocalizations.of(context).translate("SKIP"),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          if (_currentPage == 0) {
                            widget.skip();
                            return;
                          }
                          _pageController.animateToPage(_currentPage + 1,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.linear);
                          setState(() {});
                        },
                        splashColor: Colors.white,
                        child: Text(
                          AppLocalizations.of(context).translate('NEXT'),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildPageContent({
    String image,
    Widget body,
    int index,
  }) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
//        mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                image,
                height: 300,
              ),
              SizedBox(height: 20),
              Text(AppLocalizations.of(context).translate("next_heath_station"),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff4177fb),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(height: 20),
              body,
              SizedBox(height: 40),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: index == 1 ? 15 : 12,
                  height: index == 1 ? 15 : 12,
                  decoration: BoxDecoration(
                      color:
                          index == 1 ? null : Color.fromRGBO(110, 120, 233, .6),
                      gradient: index == 1
                          ? LinearGradient(
                              colors: [
                                CustomColors.primaryColor,
                                CustomColors.buttonColor
                              ],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                            )
                          : null,
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 7,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: index == 2 ? 15 : 12,
                  height: index == 2 ? 15 : 12,
                  decoration: BoxDecoration(
                      color:
                          index == 2 ? null : Color.fromRGBO(110, 120, 233, .6),
                      gradient: index == 2
                          ? LinearGradient(
                              colors: [
                                CustomColors.primaryColor,
                                CustomColors.buttonColor
                              ],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                            )
                          : null,
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 7,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: index == 3 ? 15 : 12,
                  height: index == 3 ? 15 : 12,
                  decoration: BoxDecoration(
                      color:
                          index == 3 ? null : Color.fromRGBO(110, 120, 233, .6),
                      gradient: index == 3
                          ? LinearGradient(
                              colors: [
                                CustomColors.primaryColor,
                                CustomColors.buttonColor
                              ],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                            )
                          : null,
                      shape: BoxShape.circle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckItem extends StatelessWidget {
  const CheckItem({@required this.textContent});
  final String textContent;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          "res/assets/images/check.png",
          width: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            textContent,
            maxLines: 4,
//              style: contentTextStyle
          ),
        ),
      ],
    );
  }
}
