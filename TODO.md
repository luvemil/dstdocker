- Add hooks in the Dockerfile to change cluster.ini settings
- Make the aforementioned change at runtime (so without the need to build a new image)
- Remove the update from the entrypoint and make it a separate action
