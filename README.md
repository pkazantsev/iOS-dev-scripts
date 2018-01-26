# iOS-dev-scripts
A set of shell scripts useful for an iOS developer

* `convert_coredata_error.sh` – takes a file with localized Core Data error containing `\U` characters, splits by lines if there are multiple errors and then replaces unicode characters with readable text. 
* `remove_sim_app.sh` – uninstalls an app with a given bundleID from an iOS simulator, giving a choice of device is there're multiple simulators currently open.
* `xcode_todo.sh` – should be called from _Build Phases / Run Script_ of an Xcode project for `TODO`s and `FIXME`s from source code be displayed as warnings in Xcode _Issue Navigator_.
