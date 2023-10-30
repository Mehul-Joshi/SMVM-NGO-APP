import 'package:flutter/material.dart';
import 'package:smvm/Donation.dart';
import 'package:smvm/Education.dart';
import 'package:smvm/MentalHealth.dart';
import 'package:smvm/AR.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMVM NGO'),
        backgroundColor: Colors.cyan[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.cyan,
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Welcome to SMVM NGO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Help us make a difference!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Donation(),
                        ),
                      );
                    },
                    child: const Text('Donate'),
                  ),
                ],
              ),
            ),
            Container(
              height: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CurvedIconButton(
                    icon: Icons.home,
                    text: 'All',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 5),
                  CurvedIconButton(
                    icon: Icons.school,
                    text: 'E',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Education(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 5),
                  CurvedIconButton(
                    icon: Icons.favorite,
                    text: 'M',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MentalHealth(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 5),
                  CurvedIconButton(
                    icon: Icons.vrpano,
                    text: 'info',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ARPAGE(),
                        ),
                      );
                      // Navigate to 'AR/VR' page
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            CurvedSection(),
          ],
        ),
      ),
    );
  }
}

class CurvedIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onPressed;

  CurvedIconButton(
      {required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(50.0),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 8.0),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          CurvedCardWithImage(
            image: 'assets/images/ic_logo.jpeg',
            text: 'Supporting Education',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ARPAGE(),
                ),
              );
            },
          ),
          CurvedCardWithImage(
            image: 'assets/images/ic_logo.jpeg',
            text: 'Awarness campaign',
            onPressed: () {
              // Add action for "Learn More" on this card
              // For example, navigate to a specific page for this card
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ARPAGE(),
                ),
              );
            },
          ),
          CurvedCardWithImage(
            image: 'assets/images/ic_logo.jpeg',
            text: 'Healthcare Outreach',
            onPressed: () {
              // Add action for "Learn More" on this card
              // For example, navigate to a specific page for this card
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ARPAGE(),
                ),
              );
            },
          ),
          CurvedCardWithImage(
            image: 'assets/images/ic_logo.jpeg',
            text: 'Community Building',
            onPressed: () {
              // Add action for "Learn More" on this card
              // For example, navigate to a specific page for this card
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ARPAGE(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CurvedCardWithImage extends StatelessWidget {
  final String image;
  final String text;
  final Function()? onPressed;

  CurvedCardWithImage({
    required this.image,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4.0,
      margin: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20.0)),
                child: Image.asset(
                  image,
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (onPressed != null)
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onPressed,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0), // Added padding
                          child: Text(
                            'Learn More',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// }

// class ARPAGE extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AR/VR Page'),
//         backgroundColor: Colors.cyan[600],
//       ),
//       body: Center(
//         child: Text('This is the AR/VR Page'),
//       ),
//     );
//   }
// }
