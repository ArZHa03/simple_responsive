# Simple Responsive

A Flutter package to make your app responsive according to a reference resolution device or size percentage from the real device.

## Initialization

Add this to your package's `pubspec.yaml` file and then run `pub get`:

```yaml
dependencies:
  responsive: 
    git: https://github.com/ArZHa03/simple_responsive.git
```

## Usage

To use the `SimpleResponsive` class, you need to provide the `BuildContext` and the reference width and height of your design.

```dart
@override
void initState() {
  SimpleResponsive.init(context, referenceWidth: 1080, referenceHeight: 1920);
  super.initState();
}
```

### Getting Responsive Sizes Using Instance Methods

You can get responsive sizes for width and height using the `w` and `h` methods respectively.

```dart
double responsiveWidth = SimpleResponsive.w(100); // Get responsive width for 100 units
double responsiveHeight = SimpleResponsive.h(100); // Get responsive height for 100 units
```

### Getting Responsive Sizes Using Extensions

You can also use the provided extensions on `num` to get responsive sizes more conveniently.

```dart
double responsiveWidth = 100.w; // Get responsive width for 100 units
double responsiveHeight = 100.h; // Get responsive height for 100 units
```

### Getting Screen Dimensions (Percentage) Using Instance Methods

You can get the screen width and height using the `screenWidth` and `screenHeight` methods respectively.

```dart
double screenWidth = SimpleResponsive.wp; // Get screen width 100% from the real device
double screenHeight = SimpleResponsive.hp; // Get screen height 100% from the real device
```

### Getting Screen Dimensions (Percentage) Using Extensions 

You can get the screen width and height using the `wp` and `hp` properties respectively.

```dart
double screenWidth = 100.wp; // Get screen width 100% from the real device
double screenHeight = 100.hp; // Get screen height 100% from the real device
```

### Example

Here is a complete example of how to use the `SimpleResponsive` package in your Flutter app:

```dart
import 'package:flutter/material.dart';
import 'package:simple_responsive/simple_responsive.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SimpleResponsive.init(context, referenceWidth: 1080, referenceHeight: 1920);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Simple Responsive Example')),
        body: Center(
          child: Container(
            width: 100.w, // Responsive width
            height: 100.h, // Responsive height
            color: Colors.blue,
            child: Center(child: Text('Simple Responsive Box')),
          ),
        ),
      ),
    );
  }
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
