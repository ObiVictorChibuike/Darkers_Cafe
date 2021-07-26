import 'package:amat_foodies/Models/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//A class collecting two parameter and customizing the Switch button
class customSwitchButton extends StatelessWidget {
  IconData icon;
  String text;

  customSwitchButton(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) => Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
        child: InkWell(
          splashColor: Colors.red,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.red,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Switch(
                  onChanged: (value) {
                    notifier.toggleTheme();
                  },
                  value: notifier.darkTheme,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
