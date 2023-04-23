# kib_task

A new Flutter project.

## Getting Started

### Build:
- this is assuming you already have flutter installed on the current device if not please refer to [flutter.dev](https://flutter.dev)
```bash
./build.sh
flutter run
```
#### Building android :
 ```bash
flutter build apk
```
#### Testing :
 ```bash
flutter test
```

***
## Project Structure:
### What is used in this project?

- Flutter bloc To implement the BLoC (Business Logic Component) design pattern.
- Freezed Code generation for data classes
- Riverpod for dependency injection
- Dio Http client for dart. Supports interceptors and global configurations
- Hive database
- mocktail for testing
- cached_network_image for caching country flags images
- flutter_native_splash for native splash screen generation

### File structure:
```
|-- lib
`----- core - contains core classes and extensions
`----- features - contains all features
|      `---- feature_name
|            `------- data - contains feature data related classes
|            |        `-- datasources - contains feature data sources
|            |        `-- models - contains feature data models
|            |        `-- repositories - contains feature repositories
|            `-------  domain - contains feature domain related classes
|            |        `-- entities - contains feature entities
|            |        `-- repositories - contains feature repositories
|            |        `-- usecases - contains feature usecases
|            `------- presentation - contains feature presentation related classes
|                     `-- bloc - contains feature blocs
|                     `-- screens - contains feature pages
|                     `-- widgets - contains feature widgets
`------ gen - contains generated files
`------ routes - contains app routes
|-- test - contains all tests
```

### why use riverpod instead of other dependency injection libraries?:
- Riverpod is a state management library that uses the Provider pattern.
- Easy to test and mock.
- Easy to override dependencies in tests and different parts of the app tree.
- Object dependencies easy to manage and override.
- Provider package was created by Remi Rousselet, the creator of Riverpod.
- The author decided to create Riverpod to overcome Provider's limitations.
- flutter_bloc by default uses Provider for dependency injection under the hood.
- get_it heavily depends on static variables and is not easy to override in the app tree. 


### Some of the design patterns used in this project:
- BLoC (Business Logic Component) design pattern.
- Repository pattern 
  - The repository pattern is a design pattern that provides a layer of abstraction between the data layer and the domain layer of an application. It is also known as the "data access layer" pattern.
  - improves the separation of concerns between the business logic and data access layers of an application.
  - easier to maintain and test.
- Factory Abstract pattern
  - used with freezed to generate data classes and app states
- Prototype pattern
  - used on api layer to create different api clients
  - ApiMethod class is the prototype to easily manage api calls across multiple api clients
  - used with freezed to generate data classes and app states
- Proxy pattern
  - used on api layer to proxy api calls to dio client
  - to easily manage api calls across multiple api clients and to easily mock api calls in tests
  - easier to handle exceptions and errors
  - used with mocks , dart `noSuchMethod` and `invocation` to mock method calls in tests, by default proxies all unimplemented methods 
- Factory pattern
  - used to create models from json data
- Provider pattern
  - used with riverpod to provide dependencies
***
### Hive database:
- Hive is a lightweight and blazing fast key-value database written in pure Dart.
- Being written in pure Dart, Hive doesn't need any native dependencies.
- Fast and easy to use.
- Offers encryption options for security.

