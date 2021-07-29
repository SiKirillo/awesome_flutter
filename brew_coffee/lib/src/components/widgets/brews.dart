import 'package:brew_coffee/models/brew.dart';
import 'package:brew_coffee/models/user.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:provider/provider.dart' as provider;

class BrewsWidget extends cupertino.StatefulWidget {
  const BrewsWidget({cupertino.Key? key}) : super(key: key);

  @override
  _BrewsWidgetState createState() => _BrewsWidgetState();
}

class _BrewsWidgetState extends cupertino.State<BrewsWidget> {
  cupertino.Widget _transformToBrewTile(Brew brew, bool isCurrentUser) {
    return cupertino.Container(
      padding: cupertino.EdgeInsets.all(10.0),
      decoration: cupertino.BoxDecoration(
        color: cupertino.CupertinoColors.white,
        border: cupertino.Border.all(
            width: 2.0,
            color: isCurrentUser
                ? cupertino.CupertinoColors.systemRed.withOpacity(0.6)
                : cupertino.CupertinoColors.systemGrey.withOpacity(0.6)),
        borderRadius: cupertino.BorderRadius.circular(5.0),
      ),
      child: cupertino.Flex(
        direction: cupertino.Axis.horizontal,
        mainAxisSize: cupertino.MainAxisSize.min,
        children: <cupertino.Widget>[
          material.CircleAvatar(
            radius: 25.0,
            backgroundColor: material.Colors.brown[brew.strength],
            backgroundImage: cupertino.AssetImage('assets/coffee_icon.png'),
          ),
          cupertino.SizedBox(
            width: 10.0,
          ),
          cupertino.Flex(
            direction: cupertino.Axis.vertical,
            mainAxisSize: cupertino.MainAxisSize.min,
            crossAxisAlignment: cupertino.CrossAxisAlignment.start,
            children: <cupertino.Widget>[
              cupertino.Text(brew.name),
              cupertino.Text(
                'Takes ${brew.sugars.toString()} sugar(s)',
                style: cupertino.TextStyle(
                  color: cupertino.CupertinoColors.systemGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  cupertino.Widget build(cupertino.BuildContext context) {
    final brews = provider.Provider.of<List<Brew>>(context);

    return provider.Consumer<User?>(
      builder: (context, user, _) {
        return cupertino.Expanded(
          child: cupertino.ListView.separated(
              itemCount: brews.length,
              separatorBuilder: (context, _) {
                return cupertino.SizedBox(
                  height: 10.0,
                );
              },
              itemBuilder: (context, index) {
                var isCurrentUser = user?.uid == brews[index].uid;
                return _transformToBrewTile(brews[index], isCurrentUser);
              }),
        );
      },
    );
  }
}
