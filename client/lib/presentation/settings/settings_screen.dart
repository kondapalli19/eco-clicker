import 'package:flutter/material.dart';
import '/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSoundOn = true; // Set the initial sound state, you can manage this state accordingly

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0), // Add top padding of 20
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Settings',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 40,
            ),
          ),
          SizedBox(height: 20), // Add some space between "Settings" and the sound toggle button
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Sound',
              style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
              ),
              Switch(
                value: isSoundOn,
                onChanged: (value) {
                  setState(() {
                    isSoundOn = value;
                    // Add logic here to handle sound on/off
                    // For now, I'm just printing the state
                    print('Sound is ${isSoundOn ? 'on' : 'off'}');
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
