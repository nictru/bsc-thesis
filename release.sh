#!/bin/bash

# Fail if not on branch main
if [ "$(git rev-parse --abbrev-ref HEAD)" != "main" ]; then
    echo "You must be on the main branch to create a release."
    exit 1
fi

# Fail if the repository is not clean
if [ -n "$(git status --porcelain)" ]; then
    echo "The repository is not clean. Please commit or stash your changes."
    exit 1
fi

# Request the user to enter the version number
RELEASE_VERSION=""
while [ -z "$RELEASE_VERSION" ]; do
    read -p "Enter the version number: " RELEASE_VERSION
done

# Request the user to enter the release notes
RELEASE_NOTES=""
while [ -z "$RELEASE_NOTES" ]; do
    read -p "Enter the release notes: " RELEASE_NOTES
done

# Create a new release
git tag -a "$RELEASE_VERSION" -m "$RELEASE_NOTES"
git push origin "$RELEASE_VERSION"
