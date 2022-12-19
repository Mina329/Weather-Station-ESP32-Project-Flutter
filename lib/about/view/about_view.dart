import 'package:avatar_glow/avatar_glow.dart';
import 'package:esp_app/common/common.dart';
import 'package:flutter/material.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ESP2 tMonitor'),
        backgroundColor: Constants.primaryColor,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Team Members',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              ...Constants.members.map(
                (member) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AvatarGlow(
                      glowColor: Colors.blue,
                      endRadius: 90.0,
                      duration: const Duration(milliseconds: 2000),
                      repeat: true,
                      showTwoGlows: true,
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      child: Material(
                        // Replace this child with your own
                        elevation: 8.0,
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          radius: 50.0,
                          child: member.image ??
                              const Icon(
                                Icons.person_outline,
                                size: 50,
                              ),
                        ),
                      ),
                    ),
                    Text(
                      member.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      member.id,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
