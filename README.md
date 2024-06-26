# Notes App

**App developed by Brian Yu for CSE 340 class at University of Washington**

This is an android notes app (iOS not tested) visually similar in design to Samsung's notes app. This project uses [Hive](https://docs.hivedb.dev/#/) to securely store user data (notes files) locally. Some files in this project are redundant or useless and were only included as part of my class's dev cycle submission requirements. There may be padding issues on certain elements depending on your device's screen ratio and OS font size.

**Features**
- Main page: allows access to all written notes; displays note titles, contents, last updated time, and more.
- Note page: allows editing of note's title and content.
- Secure storage: encrypts and stores notes locally.
- Search: allows user to search through notes.
- Theme: toggles between dark and light mode; not persistent (i.e. does not remember last used theme on close; does not query user's OS theme).
- Accessibility: screen reader semantics, contrast, font size support (limited).

<p float="left">
  <img src="./assets/main_light.jpg" alt="Screenshot of app's main page in light mode" width="200"/>
  <img src="./assets/note_light.jpg" alt="Screenshot of app's note editing page in light mode" width="200"/>
  <img src="./assets/main_dark.jpg" alt="Screenshot of app's main page in dark mode" width="200"/>
  <img src="./assets/search_dark.jpg" alt="Screenshot of app's search page in dark mode" width="200"/>
</p>

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


### Additional Notes

**JournalEntry Constructors:** There were three provided constructors for journal entry (not including the additional constructor for Hive). The first is a factory function; a default constructor that is useful for creating an empty or new journal entry. This calls the next constructor: `JournalEntry.withTextUUIDUpdatedAtCreatedAt`, whose purpose is mainly to generate a journal entry with a unique UUID. Finally, `JournalEntry.withUpdatedText` is used to update journal entries that have been edited or renamed.

**Copying Lists:** It is not necessary to make a copy of every entry in Journal's `entries` getter because its `_entries` field is final (and therefore immutable).
