

# Homebrew-Timeplus

This guide provides an experimental method for installing [Proton](https://github.com/timeplus-io/proton/) using Homebrew.

Please follow the steps carefully.

Note that all actions can be performed without `sudo` privileges, and the data will be stored in the current path.

## Preparation

**Step 1: Set Up a Data Directory**

Proton will store its data in the current directory.
**For better organization and to prevent any data mishap, we recommend creating a dedicated directory:**

```bash
mkdir proton_data
cd proton_data
```

## Installation

**Step 2: Add Homebrew Tap and Install Proton**

```bash
brew tap timeplus-io/timeplus
brew install proton
```

## Starting the Server and Client

**Step 3: Launch the Proton Server**

In the current terminal, enter:

```bash
proton server start
```

**Step 4: Connect to the Proton Server**

Open another terminal and enter:

```bash
proton client
```

*Note:* If you encounter a "connection refused" error, try using:

```bash
proton client -h 127.0.0.1
```

## Running Queries

**Step 5: Execute Streaming SQL**

For SQL queries and examples, refer to the [official documentation](https://docs.timeplus.com/). For more intricate use cases and demonstrations, visit the [showcases section](https://docs.timeplus.com/showcases).

## Shutting Down

**Step 6: Terminate the Proton Server**

To stop the server, use `CTRL+C` in the server terminal.
