

# Homebrew-Timeplus

This guide provides an experimental method for installing [Proton](https://github.com/timeplus-io/proton/) using Homebrew.

Please follow the steps carefully.

Note that all actions can be performed without `sudo` privileges, and the data will be stored in the current path `./proton-data/`.

## Installation

**Step 1: Add Homebrew Tap and Install Proton**

```bash
brew tap timeplus-io/timeplus
brew install proton
```

## Starting the Server and Client

**Step 2: Launch the Proton Server**

In the current terminal, enter:

```bash
proton server start
```

**Step 3: Connect to the Proton Server**

Open another terminal and enter:

```bash
proton client
```

*Note:* If you encounter a "connection refused" error, try using:

```bash
proton client -h 127.0.0.1
```

## Running Queries

**Step 4: Execute Streaming SQL**

For SQL queries and examples, refer to the [official documentation](https://docs.timeplus.com/). For more intricate use cases and demonstrations, visit the [showcases section](https://docs.timeplus.com/showcases).

## Shutting Down

**Step 5: Terminate the Proton Server**

To stop the server, use `CTRL+C` in the server terminal.

## Upgrade/Delete

**Step 6: Upgrade to latest version**

To upgrade to new version of Proton, first make sure the proton server is stopped.
Then run
```shell
brew update
brew upgrade proton
```
**Step 7: Uninstall Proton**

We are sorry to see you go. Please share your feedback in [our community slack](https://timeplus.com/slack).

To uninstall Proton, first make sure the proton server is stopped.
Then run
```shell
brew remove proton
```
