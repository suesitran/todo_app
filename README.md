# todo_app

A simple Todo app to demonstrate how to create Flutter project for newbie.

## The UI
The UI design is from Figma community design. Here is the link to the original design: https://www.figma.com/community/file/818969279430409745

## Getting Started

Clone this project to your local machine, and follow the branches from step 1 until finish.

### Step 1: Change theme color and clean up pre-created code
In this step, we're going to create MaterialColor to easily use Material design in our app, without the need to create a complex ThemeData or ColorScheme 

Steps by steps instruction
1. we create a package name 'theme' inside /lib folder. This will be where all Theme related files reside.
Next
2. we create a dart file inside this package, and name it 'color.dart'.
3. in this file, we'll create a new MaterialColor and name it 'primarySwatch'
```
const MaterialColor primarySwatch = MaterialColor(
  0xff3F4EA0, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: Color(0x193F4EA0),//10%
    100: Color(0x333F4EA0),//20%
    200: Color(0x4C3F4EA0),//30%
    300: Color(0x663F4EA0),//40%
    400: Color(0x7f3F4EA0),//50%
    500: Color(0x993F4EA0),//60%
    600: Color(0xB23F4EA0),//70%
    700: Color(0xCC3F4EA0),//80%
    800: Color(0xE53F4EA0),//90%
    900: Color(0xff3F4EA0),//100%
  },
);
```
And that's it. We finish step 1.

### Step 2: Add dependencies
We're going to use flutter_bloc as our main state management, and hive_flutter as our main database, therefore we'll need to add them to our project.

1. We need to add flutter_bloc and bloc packages to our project, by running command line
```
flutter pub add bloc flutter_bloc
```
in the root of the project, where the pubspec.yaml is. After this command is run, notice that the file pubspec.yaml is updated with 2 new packages under dependencies
2. We also need to add hive and hive_flutter to our project, so similarly, we run the same command with different param now
```
flutter pub add hive hive_flutter
```
3. Hive will need hive_generator and build_runner packages in order to generate TypeAdapter it needs. We only need these packages during development, therefore we'll add them into dev_dependencies using this command
```
flutter pub add --dev hive_generator build_runner
```
And we've finished step 2.


