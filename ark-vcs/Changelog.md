# Package changelog

## Version: 0.6.1 (07/02/2024)
### Features:
- License changes, now Indie and Business licenses include the free seat from the Free version

### Fixes:
- Bug with not using utf8 when trying to get the ws_file based on path
- Bug preventing opening shelf window when the workspace changelist it is tied to is empty
- Incorrect determination of common root changelist when trying to switch between branches if there's a non committed cl along the way

### Notes:
- If you open an older project, depending on the size, it may take a while before ark loads and becomes responsive, given that in this release we upgrade the servers in order to compress all files stored