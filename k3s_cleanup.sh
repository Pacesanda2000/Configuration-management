#!/bin/bash

function uninstall_k3s {
    if command -v k3s &> /dev/null; then
        echo "k3s is installed."

        if [[ "$(hostname)" == master* ]]; then
            echo "This is a k3s server node."
            echo "Uninstalling k3s server..."
            /usr/local/bin/k3s-killall.sh
            /usr/local/bin/k3s-uninstall.sh
            echo ""
            echo "k3s server node has been sucesfully uninstalled."

        elif [[ "$(hostname)" == worker* ]]; then
            echo "This is a k3s agent node."
            echo "Uninstalling k3s agent..."
            /usr/local/bin/k3s-killall.sh
            /usr/local/bin/k3s-agent-uninstall.sh
            echo ""
            echo "k3s agent node has been sucesfully uninstalled."

        else
            echo "Unknown node type. Cannot uninstall k3s."
        fi
    else
        echo "k3s is not installed."
    fi
}

uninstall_k3s
