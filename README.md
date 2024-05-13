# Food Finder
Please not that this README file references many items in Part 2 of the project. Please refer to this [commit](https://gitlab.cs.washington.edu/cse340-24spring-students/5_journal-brian127/-/commit/9fbec897372c9cf51aff4a9df9c0f6e66a52cd18#9ae8895218a7d8776c13b520760ade759b4a9440) titled 'Completed initial submission.' Alternatively, the `journal_mocker.dart` file still exists in this most recent commit, but with the code commented out. 

## Student Information
Name: Brian Yu

CSE netid: brian127

email: brian127@uw.edu


## Design Vision

**Functionally:** I wanted to create a notes app, similar to the one I usually use on my phone: Samsung Notes. In terms of functionality, I included a search feature on the main page, the ability to delete entries, and editable title fields for each note entry. All other features are pretty standard, aside from the dark mode toggle.

**Aesthetically:** I particularly wanted to recreate the two-column grid in the app as it is my most favourite form factor for a notes app to date. I also wanted to add a dark mode for my app, since I know I always like taking notes on a dark background. Allowing the user to toggle back and forth satisfies more people!

**Data:** For this second submission, the focus was on preserving and encrypting user data, so that the user doesn't lose their notes every restart, but that their data is also securely stored to mitigate privacy concerns.

Initial app UI sketch can be found in the `assets` folder. File name is `sketch.jpg`.

For this second submission, I had more time to add the features I had wanted to incorporate in my first submission, such as a search tool, dark mode, and more. The app is now quite similar to what I had envisioned in that sketch!

**Robustness:** In the current implementation, uninstalling the app or accidentally deleting the Hive box the user's data is stored in would (obviously) wipe the data. One potential workaround is to connect the user's data to an online cloud service (e.g. onedrive, icloud).


## Resources Used
Comprehensive list of online resources used:
- https://api.flutter.dev/flutter/widgets/ListView-class.html
- https://medium.com/@taraparakj75/how-to-wrap-text-on-overflow-in-flutter-a5eade5ea97a
- https://api.flutter.dev/flutter/dart-core/DateTime-class.html
- https://stackoverflow.com/questions/44317188/flutter-ontap-method-for-containers
- https://stackoverflow.com/questions/65252663/flutter-gesturedetector-with-multiple-futures
- https://api.flutter.dev/flutter/material/AppBar-class.html
- https://api.flutter.dev/flutter/material/Icons-class.html
- https://api.flutter.dev/flutter/widgets/ListView-class.html
- https://api.flutter.dev/flutter/rendering/SliverGridDelegate-class.html
- https://stackoverflow.com/questions/59693441/how-do-i-convert-a-listview-to-a-gridview-flutter
- https://api.flutter.dev/flutter/widgets/GridView-class.html
- https://api.flutter.dev/flutter/widgets/AspectRatio-class.html
- https://api.flutter.dev/flutter/widgets/GridView/GridView.builder.html
- https://stackoverflow.com/questions/47823409/gridview-builder-creates-page-that-scrolls-endlessly
- https://stackoverflow.com/questions/62361558/bottom-overflowed-inside-column-while-listing-with-grid-count
- https://stackoverflow.com/questions/53612200/flutter-how-to-give-height-to-the-childrens-of-gridview-builder
- https://stackoverflow.com/questions/67901243/flutter-container-with-fade-out-left-effect
- https://stackoverflow.com/questions/51579546/how-to-format-datetime-in-flutter
- https://api.flutter.dev/flutter/material/TextFormField-class.html
- https://docs.flutter.dev/cookbook/forms/text-field-changes
- https://docs.flutter.dev/cookbook/forms/text-input
- https://www.youtube.com/watch?v=072iwE4_BZc
- https://stackoverflow.com/questions/54905388/incorrect-use-of-parent-data-widget-expanded-widgets-must-be-placed-inside-flex
- https://api.flutter.dev/flutter/widgets/PopScope-class.html
- https://stackoverflow.com/questions/57124258/could-not-find-the-correct-provider-above-this-widget
- https://stackoverflow.com/questions/63418224/is-it-okay-to-call-provider-functions-in-main-dart-flutter
- https://stackoverflow.com/questions/39958472/dart-numberformat
- https://stackoverflow.com/questions/54476588/flutter-textformfield-how-to-add-manual-onchange-property
- https://stackoverflow.com/questions/63631255/flutter-save-page-state-after-navigator-pop
- https://docs.flutter.dev/cookbook/navigation/navigation-basics
- https://docs.flutter.dev/cookbook/navigation/returning-data
- https://codewithandrea.com/tips/flutter-3.7-using-context-mounted/
- https://api.flutter.dev/flutter/material/TextField-class.html
- https://stackoverflow.com/questions/48927928/how-to-add-clear-button-to-textfield-widget
- https://stackoverflow.com/questions/52603494/how-to-change-textformfield-input-text-color-in-flutter
- https://stackoverflow.com/questions/49040679/flutter-how-to-make-a-textfield-with-hinttext-but-no-underline
- https://www.dhiwise.com/post/flutter-search-bar-tutorial-for-building-a-powerful-search-functionality
- https://medium.com/codechai/implementing-search-in-flutter-17dc5aa72018
- https://github.com/jesusrp98/search_page/blob/master/lib/search_page.dart
- https://stackoverflow.com/questions/74419344/flutter-text-field-appears-when-button-is-clicked-icons-buttons
- https://stackoverflow.com/questions/65431424/show-widget-when-button-is-clicked-dart-flutter
- https://api.flutter.dev/flutter/material/AppBar/leading.html
- https://stackoverflow.com/questions/46057353/controlling-state-from-outside-of-a-statefulwidget
- https://stackoverflow.com/questions/60510427/how-to-show-the-keyboard-automatically-for-a-textfield-in-flutter
- https://stackoverflow.com/questions/51182803/shrink-container-to-smaller-child-rather-than-expanding-to-fill-parent
- https://stackoverflow.com/questions/75434794/flutter-how-to-make-container-height-wrap-around-its-content
- https://api.flutter.dev/flutter/widgets/Wrap-class.html
- https://stackoverflow.com/questions/66285602/how-to-wrap-gesturedetector-with-another-gesturedetector-and-get-events-everywhe
- https://api.flutter.dev/flutter/material/PopupMenuButton-class.html
- https://api.flutter.dev/flutter/rendering/RelativeRect/RelativeRect.fromDirectional.html
- https://api.flutter.dev/flutter/dart-ui/TextDirection.html
- https://stackoverflow.com/questions/61756271/how-to-set-flutter-showmenu-starting-point
- https://stackoverflow.com/questions/51644300/scrollable-flutter-popup-menu
- https://stackoverflow.com/questions/77357991/flutter-how-to-understand-the-relativerect-positioning-in-the-showmenu
- https://stackoverflow.com/questions/43349013/how-to-open-a-popupmenubutton
- https://api.flutter.dev/flutter/gestures/LongPressGestureRecognizer/onLongPress.html
- https://api.flutter.dev/flutter/rendering/RelativeRect-class.html
- https://stackoverflow.com/questions/56927576/how-to-change-background-color-of-popupmenuitem-in-flutter
- https://api.flutter.dev/flutter/material/ThemeData-class.html
- https://docs.flutter.dev/cookbook/design/themes
- https://api.flutter.dev/flutter/material/ThemeData/ThemeData.dark.html
- https://stackoverflow.com/questions/67794181/how-to-change-theme-in-flutter
- https://docs.flutter.dev/cookbook/design/themes
- https://stackoverflow.com/questions/59577114/how-to-make-container-fix-positioned-even-after-keyboard-is-displayed
- https://stackoverflow.com/questions/73494409/how-to-remove-data-from-hive-box-without-leaving-null
- https://docs.flutter.dev/data-and-backend/state-mgmt/simple
- https://stackoverflow.com/questions/65852838/i-get-a-weird-error-when-trying-to-initialize-hive
- https://community.cloudera.com/t5/Support-Questions/Update-and-Delete-are-not-working-in-Hive/td-p/57358/page/2
- https://stackoverflow.com/questions/62882123/flutter-hive-deleteat-is-making-the-value-null-instead-of-deleting-it
- https://stackoverflow.com/questions/70719432/deletekey-function-in-hive-flutter-not-working
- https://stackoverflow.com/questions/71052857/hive-flutter-are-boxes-deleted-when-app-is-closed
- https://github.com/isar/hive/issues/620
- https://github.com/isar/hive/issues/236
- https://stackoverflow.com/questions/64108897/in-flutter-using-hive-how-would-you-add-a-custom-object-from-a-post-response-bod
- https://pub.dev/documentation/hive/latest/hive/HiveType-class.html
- https://stackoverflow.com/questions/56613875/datetime-comparison-in-dart
- https://api.flutter.dev/flutter/dart-core/List/sort.html
- https://pub.dev/documentation/flutter_secure_storage/latest/flutter_secure_storage/flutter_secure_storage-library.html
- https://www.dhiwise.com/post/guide-to-flutter-secure-storage-protect-your-dat

Thank you to Charyl Li for helping me figure out a silly bug. And thank you to Jacklyn Cui for helping me figure out an issue with my adapter.


## Reflection Prompts

### New Learnings (Part 2)

The one tool I thought was most important for this submission cycle was Hive. Being able to store and encrypt data is an absolute game changer for what apps I can now create. 


## Challenges

I had a lot of difficulty figuring out the constructor for my adapter. It was thanks to Jacklyn Cui that I managed to dig myself out of that rut!


### Mistakes

It was a silly mistake. I had a call for the original entry rather than the new entry when popping from navigator.
This was the source of a multiple-hour headache.


### Meta

As I spent a lot of time working on extra features during this cycle, I would say it took me well over 10 hours of work this week. The actual part 2 bit only took a couple hours though.


### Self Grade

I would give myself 100. I believe I have satisfied every criteria, and gone above and beyond with my app. I'm really happy with how it came out!