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

### Step 3: Create the UI with dummy data
We'll use a simple Todo list UI design from Figma community, the link can be found here: https://www.figma.com/community/file/818969279430409745

There will be light and dark theme, but in this demo, we're going to use only light theme for now.

To easily test our widgets, I recommend to always move our widget out to a separate file.
1. totally remove MyHomePage from pre-created code
2. create a new package name 'features', this is where all actual feature implementation (both UI and bloc) will go into
3. inside 'features', create a new package name 'home'
4. create a new dart file with the name home_page
5. in this new dart file, create a StatelessWidget with name 'HomePage'
6. go back to main.dart, change the 'home' widget to point to our new HomePage, and update import

Preparation is done. Now we need to change the UI inside home_page.dart

Looking at above design, it's a list view with 3 parts: Date and summary, Incomplete tasks, and Completed tasks. It also has a floating action button, but there's no ordinary AppBar

In order to create this design, we'll use CustomScrollView. CustomScrollView is a ScrollView widget which allows custom scroll effects by using sliver widgets.

The 'Date and summary' part will be inside a 'SliverToBoxAdapter' widget. The 2 lists 'Incomplete tasks', and 'Completed tasks' will be 2 SliverList widgets.

This step also include writing Widget Test for the new UI we created.

### Step 4: Implement bloc and Hive
In step 4, we will work on integrating bloc and Hive in the same step. In this step, we'll create Hive Adapter, initialise Hive and register Hive Adapter in a global bloc, and access Hive database from a local cubit (light-weight bloc).

We will also include a bloc_test package to help writing unit test for the bloc/cubit.

Detail steps include:
1. Create global bloc which wraps outside of MaterialApp.
2. Create Hive Adapter to store details of tasks in a Todo list. Reference: https://docs.hivedb.dev/#/custom-objects/generate_adapter
3. Initialise and register Hive and Hive Adapter
4. Implement local cubit (a light-weight bloc) to read and write data to/from Hive database
