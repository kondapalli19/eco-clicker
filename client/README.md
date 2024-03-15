# Eco Clicker

<!-- table of contents -->

- [Project Setup](#running-the-project)
- [Workflow](#project-workflow)

<!-- development instructions -->

## Running the project

Start by following the [get started guide](https://docs.flutter.dev/get-started/install) for installing Flutter to your machine.
Choosing the _Desktop_ option is recommended, as it has the simplest setup process.

Install git for your respective platform.

### Installing project dependencies

Run the following to clone the repo and install the basic Flutter library dependencies.

```
git clone https://bitbucket.org/made-by-humanz/client
cd client
flutter packages get
flutter packages upgrade
```

### Instructions for VS Code (recommended)

Install the Flutter extension for VS Code

Open the settings dialog (`Ctrl/Cmd`-`Shift`-`P` on most platforms) and search for `Flutter: Select Device`.
Select your browser of choice.

Open `/lib/main.dart`, and press `Run > Run without debugging`

### Emulating Android (optional)

Run `flutter doctor` to see what dependencies you're missing.
Follow the installation instructions for each one.
When selecting the target device VS Code, you should now see an option for running an Android emulator.
Select this option.

Then run the project as usual.

## Project workflow

To start work on a ticket, create a new branch from `dev` with the ticket number.
This can be done from the command line.

```
git switch dev
git pull
git switch -c ECO-123
```

Alternatively, you can create the branch from the JIRA interface, and then:

```
git fetch
git switch ECO-123-add-new-feature
```

Try to prefix commits with the ticket number (e.g. `ECO-123: Resized button on home screen`).
This will help with tracking changes in the future.

When you're ready to merge your changes, push your branch to Bitbucket and create a merge request.

```
git push origin ECO-123
```

### Merge conflicts

If new changes have been made to `dev` since you started your branch, you'll need to _rebase_ your branch to include these changes.

```
git pull --rebase origin dev
```

This will pull the latest version of `dev`, and apply your changes _on top_ of it.
Ideally, this will result in a clean merge and no further action is required.
Occasionally, you may need to resolve merge conflicts.
VS Code has some tools to help with this, but also feel free to ask in the dev channel.
