#!/bin/bash
export FLYCTL_INSTALL="$HOME/.fly"
test -d "$FLYCTL_INSTALL" && export PATH="$FLYCTL_INSTALL/bin:$PATH";