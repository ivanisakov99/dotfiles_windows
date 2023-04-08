# dotfiles_windows

Dotfiles for Windows

## Prerequisites

There are a couple of things you need to do before running Dotbot's bootstrapping script.

### Execution Policy

Before you’re able to run PowerShell scripts on your machine, you need to set your local `ExecutionPolicy` to `RemoteSigned` (Basically anything except `Undefined` and `Restricted`).

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
```

### Enable Symlinking

In order for Dotbot to work, you need to be able to create symbolic links.

Here is a _rough_ way of how to do it:

* Enable `Windows Developer` mode to bypass UAC requirement:
    * Go to `Developer settings > Turn Developer Mode on`.

### Dependencies

* Git, and Python are needed for Dotbot to work. You can install them with [prerequisites.ps1](dependencies/prerequisites.ps1).

```powershell
iex ((new-object net.webclient).DownloadString('https://raw.github.com/ivanisakov99/dotfiles_windows/main/dependencies/prerequisites.ps1'))
```

## Installation

Install this repo with:

```powershell
cd ~\.dotfiles\; # Replace with the directory that you'd like to use
git clone https://github.com/ivanisakov99/dotfiles_windows.git .
```

## Execution

Now we are ready to bootstrap our environment using the following script:

```powershell
. \install.ps1
```

## References

* [Dotbot](https://github.com/anishathalye/dotbot)
