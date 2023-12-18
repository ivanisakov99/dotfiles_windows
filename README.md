# dotfiles_windows

Dotfiles for Windows

## Prerequisites

There are a couple of things you need to do before running Dotbot's bootstrapping script.

### Execution Policy

Before you’re able to run PowerShell scripts on your machine, you need to set your local `ExecutionPolicy` to `RemoteSigned` (Basically anything except `Undefined` and `Restricted`).

You can check this value using the command below:

```powershell
Get-ExecutionPolicy -Scope CurrentUser
```

Use the script below, to change that value to `RemoteSigned`:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
```

### Enable Symlinking

In order for Dotbot to work, you need to be able to create symbolic links. You can do so by enabling `Windows Developer` mode.

There are 2 ways to enable it:

1. Go to `Settings` > `Developer Settings` > Turn `Developer Mode` __on__.

2. Run the below command:

```powershell

```

> If you executed option 2, you will need

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
.\install.ps1
```

## References

* [Dotbot](https://github.com/anishathalye/dotbot)
