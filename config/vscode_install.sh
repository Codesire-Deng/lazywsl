#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension llvm-vs-code-extensions.vscode-clangd
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.cmake-tools
code --install-extension twxs.cmake
code --install-extension yzhang.markdown-all-in-one
code --install-extension usernamehw.errorlens
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension gruntfuggly.todo-tree
code --install-extension alefragnani.project-manager
code --install-extension zhuangtongfa.material-theme # One Dark Pro
cp $SCRIPT_DIR/settings.json $HOME/.vscode-server/data/Machine/settings.json
