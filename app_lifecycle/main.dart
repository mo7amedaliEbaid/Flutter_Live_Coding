// Flutter does not have direct equivalents to Android's `onCreate()`, `onStart()`, `onResume()`, `onPause()`, `onStop()`, and `onDestroy()` because Flutter abstracts away platform-specific lifecycles to provide a consistent development experience across iOS, Android, and other platforms.
//
// However, Flutter offers lifecycle-related concepts and tools that serve similar purposes. Here’s how Flutter handles activity lifecycles:
//
// ---
//
// ### 1. **`StatefulWidget` Lifecycle**
// In Flutter, the lifecycle of a `StatefulWidget` is managed through the `State` class, which provides the following lifecycle methods:
//
// - **`initState()`**: Similar to `onCreate()` in Android. Called once when the widget is inserted into the widget tree. Use it for one-time initialization.
// - **`didChangeDependencies()`**: Called after `initState()` and whenever the widget’s dependencies change. It’s somewhat similar to `onStart()`.
// - **`build()`**: Called whenever the widget needs to be rebuilt.
// - **`didUpdateWidget()`**: Called when the parent widget is rebuilt, and the widget’s configuration changes.
// - **`deactivate()`**: Called when the widget is removed from the widget tree but might still be reused later.
// - **`dispose()`**: Similar to `onDestroy()` in Android. Called when the widget is permanently removed from the widget tree. Use it to clean up resources like streams or controllers.
//
// ---
//
// ### 2. **`WidgetsBindingObserver`**
// Flutter provides `WidgetsBindingObserver` to monitor app lifecycle events. You can listen for changes like when the app goes into the background (similar to `onPause()`/`onStop()`) or returns to the foreground (similar to `onResume()`).
//
// ```dart
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// class LifecycleAwareWidget extends StatefulWidget {
//   @override
//   _LifecycleAwareWidgetState createState() => _LifecycleAwareWidgetState();
// }
//
// class _LifecycleAwareWidgetState extends State<LifecycleAwareWidget>
//     with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this); // Register observer
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     // Handle lifecycle changes
//     if (state == AppLifecycleState.resumed) {
//       print('App is in foreground (resumed)');
//     } else if (state == AppLifecycleState.paused) {
//       print('App is in background (paused)');
//     }
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this); // Unregister observer
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Lifecycle Example')),
//       body: Center(child: Text('Observe lifecycle events in console')),
//     );
//   }
// }
// ```
//
// - **`AppLifecycleState` values**:
//   - `resumed`: App is visible and in the foreground.
//   - `inactive`: App is inactive (e.g., during an incoming call).
//   - `paused`: App is in the background but still running.
//   - `detached`: App is still hosted on a flutter engine but detached from any host view.
//
// ---
//
// ### Comparison of Android Lifecycle Methods and Flutter Lifecycle Methods
//
// | Android Method     | Flutter Equivalent             | Purpose                                   |
// |--------------------|--------------------------------|-------------------------------------------|
// | `onCreate()`       | `initState()`                 | Widget initialization.                   |
// | `onStart()`        | `didChangeDependencies()`     | Initial dependencies setup.              |
// | `onResume()`       | `AppLifecycleState.resumed`   | App becomes visible and interactive.     |
// | `onPause()`        | `AppLifecycleState.paused`    | App goes to the background.              |
// | `onStop()`         | Combination of `deactivate()` and `AppLifecycleState.paused` | App is no longer visible.               |
// | `onDestroy()`      | `dispose()`                  | Cleanup resources when the widget is destroyed. |
//
// ---
//
// ### Summary
// While Flutter doesn't directly mirror Android's activity lifecycle, it provides a flexible, widget-based lifecycle and global app lifecycle observers to handle equivalent scenarios. This abstraction simplifies cross-platform development while still allowing developers to manage transitions effectively.

// In iOS, the **`UIViewController`** class handles the lifecycle of views in an app. The lifecycle methods of `UIViewController` are conceptually similar to Android’s lifecycle callbacks, but their names and purposes differ slightly. Here's a comparison of Android lifecycle methods with their iOS counterparts:
//
// ---
//
// ### **Comparison of Android and iOS Lifecycle Methods**
//
// | Android Lifecycle Method | iOS Lifecycle Method                   | Description |
// |---------------------------|----------------------------------------|-------------|
// | **`onCreate()`**          | **`viewDidLoad()`**                   | Called after the view controller has loaded its view hierarchy into memory. Use it for one-time setup (e.g., initializing views or loading data). |
// | **`onStart()`**           | **`viewWillAppear(_:)`**              | Called just before the view becomes visible. Use it to make UI updates or refresh data. |
// | **`onResume()`**          | **`viewDidAppear(_:)`**               | Called after the view has become visible. Use it for animations or tasks that need the view to be on screen. |
// | **`onPause()`**           | **`viewWillDisappear(_:)`**           | Called just before the view disappears. Use it to save state or stop ongoing tasks. |
// | **`onStop()`**            | **`viewDidDisappear(_:)`**            | Called after the view has disappeared. Use it to release resources or stop intensive operations. |
// | **`onDestroy()`**         | **`deinit`** (deinitializer)          | Called when the view controller is deallocated. Use it to clean up resources and listeners. |
//
// ---
//
// ### **Key iOS Lifecycle Methods**
//
// 1. **`viewDidLoad()`**
//    - Called once after the view controller's view is loaded into memory.
//    - Equivalent to Android’s `onCreate()`.
//    - Use for setup that needs to happen only once (e.g., initializing UI elements, setting up observers).
//
//    ```swift
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("viewDidLoad: View loaded into memory")
//    }
//    ```
//
// 2. **`viewWillAppear(_:)`**
//    - Called each time the view is about to appear.
//    - Equivalent to Android’s `onStart()`.
//    - Use for updating the UI or refreshing data.
//
//    ```swift
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("viewWillAppear: View will appear")
//    }
//    ```
//
// 3. **`viewDidAppear(_:)`**
//    - Called each time the view becomes visible.
//    - Equivalent to Android’s `onResume()`.
//    - Use for animations or starting tasks that require the view to be fully visible.
//
//    ```swift
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("viewDidAppear: View appeared")
//    }
//    ```
//
// 4. **`viewWillDisappear(_:)`**
//    - Called just before the view is removed from the screen.
//    - Equivalent to Android’s `onPause()`.
//    - Use for pausing tasks or saving user data.
//
//    ```swift
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("viewWillDisappear: View will disappear")
//    }
//    ```
//
// 5. **`viewDidDisappear(_:)`**
//    - Called after the view is no longer visible.
//    - Equivalent to Android’s `onStop()`.
//    - Use for stopping animations, saving state, or releasing resources.
//
//    ```swift
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print("viewDidDisappear: View disappeared")
//    }
//    ```
//
// 6. **`deinit`**
//    - Called when the view controller is deallocated from memory.
//    - Equivalent to Android’s `onDestroy()`.
//    - Use for cleanup tasks like removing observers or invalidating timers.
//
//    ```swift
//    deinit {
//        print("deinit: View controller is being deallocated")
//    }
//    ```
//
// ---
//
// ### **iOS Application Lifecycle**
//
// If you need to handle application-wide lifecycle events (like `onPause()` or `onResume()` for the entire app), you can use the **`AppDelegate`** or **`SceneDelegate`** classes:
//
// - **`application(_:didFinishLaunchingWithOptions:)`**: Equivalent to `onCreate()` for the app.
// - **`applicationDidBecomeActive(_:)`**: Equivalent to `onResume()` for the app.
// - **`applicationWillResignActive(_:)`**: Equivalent to `onPause()` for the app.
// - **`applicationDidEnterBackground(_:)`**: Equivalent to `onStop()` for the app.
// - **`applicationWillTerminate(_:)`**: Equivalent to `onDestroy()` for the app.
//
// ---
//
// ### Summary
//
// While iOS and Android have different naming conventions and structures, their lifecycle concepts are fundamentally similar. Both platforms provide methods for handling different stages of an activity or view's lifecycle, allowing developers to manage transitions and resources effectively.