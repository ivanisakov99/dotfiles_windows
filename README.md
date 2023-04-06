# dotfiles_windows

Dotfiles for Windows

## Installation

* TODO


## Execution

There are a couple of things you need to check/enable before bootstrapping

### Execution Policy

Before you’re able to run PowerShell scripts on your machine, you need to set your local `ExecutionPolicy` to `RemoteSigned` (Basically anything except `Undefined` and `Restricted`).

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
```

### Enable Symlinking

In order for Dotbot to work, this user needs to be allowed to create symbolic links.

Here is a _rough_ way of how to do it:

* Enable `Windows Developer` mode to bypass UAC requirement:
    * Go to `Developer settings > Turn Developer Mode on`.

## References

* [Dotbot](https://github.com/anishathalye/dotbot)
