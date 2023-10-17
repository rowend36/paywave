# Paywave Flutter Project

## Project Structure

The project is organized into the following folders:

### `lib`

Inside the `lib` folder, you will find three main subfolders:

#### 1. `data`

The `data` folder contains models and states of our application. This is where you'll find data-related components such as data models, state management classes, and data processing logic.

#### 2. `presentation`

The `presentation` folder is responsible for visual screens and user interfaces (UI). Within the `presentation` folder, you will find four subfolders:

- `bloc`: This folder contains complex functions and logic, such as API data fetching, and is often related to state management.

- `pages`: The `pages` folder contains our main UI pages, which represent the primary screens of the application.

- `screens`: Inside the `screens` folder, you'll find sub-pages or secondary screens. These screens might include dialog screens, pop-ups, or other UI components that are not the main focus of the application.

- `theme`: The `theme` folder holds application-specific theme colors and styling. You can configure the visual appearance of your app here.

- `widget`: This folder contains reusable UI components or widgets that can be used across different states or sections of the application. These widgets can help maintain consistency in your UI.

#### 3. `utils`

The `utils` folder contains utility functions, helper functions, and other miscellaneous code that doesn't fall into the categories of data or presentation. These utilities can include helper functions for data processing, formatting, or any other code snippets that are reused throughout the application.

This project structure helps organize your Flutter codebase efficiently, making it easier to navigate and maintain as your project grows.
