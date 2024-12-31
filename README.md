# Responsive

A Flutter package to make your app responsive according to a reference resolution device or size percentage from the real device.

## Initialization

Add this to your package's `pubspec.yaml` file and then run `pub get`:

```yaml
dependencies:
  responsive: 
    git: https://github.com/ArZHa03/responsive.git
```

## Usage

To use the `Responsive` class, you need to provide the `BuildContext` and the reference width and height of your design.

```dart
@override
void initState() {
  Responsive.init(context, referenceWidth: 1080, referenceHeight: 1920);
  super.initState();
}
```

### Getting Responsive Sizes

You can get responsive sizes for width and height using the `w` and `h` methods respectively.

```dart
double responsiveWidth = Responsive.w(100); // Get responsive width for 100 units
double responsiveHeight = Responsive.h(100); // Get responsive height for 100 units
```

### Using Extensions

You can also use the provided extensions on `num` to get responsive sizes more conveniently.

```dart
double responsiveWidth = 100.w; // Get responsive width for 100 units
double responsiveHeight = 100.h; // Get responsive height for 100 units
```

### Getting Screen Dimensions

You can get the screen width and height using the `wp` and `hp` properties respectively.

```dart
double screenWidth = Responsive.wp; // Get screen width
double screenHeight = Responsive.hp; // Get screen height
```

### Example

Here is a complete example of how to use the `Responsive` package in your Flutter app:

```dart
import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive.init(context, referenceWidth: 1080, referenceHeight: 1920);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Responsive Example')),
        body: Center(
          child: Container(
            width: 100.w, // Responsive width
            height: 100.h, // Responsive height
            color: Colors.blue,
            child: Center(child: Text('Responsive Box')),
          ),
        ),
      ),
    );
  }
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
