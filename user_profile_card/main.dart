import 'package:flutter/material.dart';
//Create a custom reusable widget that displays a user profile card.
// The card should include an avatar, name, and an expandable description.
main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: ProfileCard(
        avatarUrl: 'https://avatars.githubusercontent.com/u/139426',
        name: 'John Doe',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
            'nisi ut aliquip ex ea commodo consequat.',
      ),
    ),
  ));
}

class ProfileCard extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String description;

  const ProfileCard({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 600,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 40,
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ExpandableDescription(description: description),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandableDescription extends StatefulWidget {
  final String description;

  const ExpandableDescription({Key? key, required this.description})
      : super(key: key);

  @override
  _ExpandableDescriptionState createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.description,
          maxLines: _isExpanded ? null : 5,
          overflow: TextOverflow.ellipsis,
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(_isExpanded ? 'Show Less' : 'Show More'),
        ),
      ],
    );
  }
}
