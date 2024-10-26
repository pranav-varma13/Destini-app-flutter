import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

// Create a new StoryBrain object from the StoryBrain class.
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/background.png'), // Ensure this image exists in your assets.
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain
                        .getStory(), // Use the storyBrain to get the first story title.
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  // Use TextButton instead of FlatButton as FlatButton is deprecated.
                  onPressed: () {
                    // Choice 1 made by user.
                    setState(() {
                      storyBrain
                          .nextStory(1); // Call nextStory method with choice 1.
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    storyBrain
                        .getChoice1(), // Use the storyBrain to get the text for choice 1.
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain
                      .buttonShouldBeVisible(), // Set visibility based on the logic in storyBrain.
                  child: TextButton(
                    // Use TextButton instead of FlatButton as FlatButton is deprecated.
                    onPressed: () {
                      // Choice 2 made by user.
                      setState(() {
                        storyBrain.nextStory(
                            2); // Call nextStory method with choice 2.
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      storyBrain
                          .getChoice2(), // Use the storyBrain to get the text for choice 2.
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
