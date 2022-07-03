## OctoPrint Windows Installer

This repository uses a github action to generate a bundled installer that contains [WinPython](https://github.com/winpython/winpython), [winsw](https://github.com/winsw/winsw), and automates the process of creating a venv, installing OctoPrint in it, and adding an OctoPrint service in windows. 

To manually build you will need to pass `/DMyAppVersion="x.x.x"` to InnsoSetup compile command. This is automatically handled by the GitHub Action.  