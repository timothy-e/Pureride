import 'package:flutter/material.dart';
import 'package:pureride/ui/widgets/buttons.dart';

class FullScreenInfoCard extends StatelessWidget {
  final int id;
  final BuildContext context;
  final String destinationName;
  final String address;
  final DateTime departureTime;
  final String driver;
  final List taggerAlongers;
  final int type;
  final Widget buttonBar;

  const FullScreenInfoCard(
      {Key key,
      this.id,
      this.context,
      this.destinationName,
      this.address,
      this.departureTime,
      this.driver,
      this.taggerAlongers,
      this.type,
      this.buttonBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar appBar = new AppBar(
      primary: true,
      leading: IconTheme(
          data: IconThemeData(color: Colors.white), child: CloseButton()),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.1),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Hero(
        tag: 'hero$id-card',
        child: Material(
          child: ListView(
            children: <Widget>[
              Container(height: appBar.preferredSize.height),
              Container(
                margin: EdgeInsets.only(top: mediaQuery.padding.top),
                child: createText(context, destinationName, departureTime,
                    driver, type, taggerAlongers, 18, 14),
              ),
              ConstrainedBox(
                  constraints: BoxConstraints.loose(Size(
                      mediaQuery.size.width * 0.8,
                      mediaQuery.size.height * 0.8)),
                  // margin: EdgeInsets.only(top: 100, left: 50),
                  child: Container(
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Text("Riders"),
                            subtitle: Text(
                                "Willa Kong\nMarc Xu\nOlivia Zhou\nBoris Chan\nTimothy Elgersma"),
                            isThreeLine: true,
                          ),
                          ListTile(
                            title: Text("Duration"),
                            subtitle: Text("15 minutes"),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(top: 80))),
              buttonBar
            ],
          ),
        ));
  }
}
