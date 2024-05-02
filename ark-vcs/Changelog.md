# Package changelog
## Version: 0.7.2 (02/05/2024)
### Features:
- Added support for defining default app to launch for file / extension
- Double-Click now launches default app for that file (if defined)
- Alt + Double-Click now launches diff app depending on context (i.e. in history it launches with that version and the previous one, with other panels it uses local version with previous)
- Refactored how history diff menu is handled, now when in the history it will compare the version from that cl and not the local version
- Added support for shift + click in changes to select ranges within same changelist
- Ipv6 address input support in format [ip]:port
- Upgraded jai to 0.1.089
- Upgraded glfw to 3.4
- Upgraded imgui to 1.90.5
- Upgraded OpenGL to be 4.1 to match between Windows and upcoming MacOS version

### Fixes:
- Server not clearing auth token when it was expired and the user logged in with password
- Server not loading the license
- Horizontal scrollbars now always visible to prevent flickering edge case

## Version: 0.7.1 (20/04/2024)
### Fixes:
- Fixed branch creation when we wouldn't immediately switch to it
- Fixed branch graph being broken after new branch was created until ark was relaunched
- Fixed reconcile not handled correctly when files with the same start had to be reconciled (e.g. deleting folder/file.txt and folder/file.txt_old)

## Version: 0.7.0 (10/04/2024)
### Features:
- Communication encryption, via TLS. Servers create their own certificate / private key on launch for convenience, but also supports dropping one there
- Login refactored so that the server now tells you if you're setting password or not, and if so you're now presented with confirm password field
- Changed logging to be tied to connection
- Started changing how logging is handled so that in the future we can more easily get bug reports that hide any important data
- Reworked how the whole network was setup. Now memory usage is far more under control when pushing huge shelves

### Fixes:
- Fixed cli clients not saving logs

## Version: 0.6.6 (17/03/2024)
### Fixes:
- Changed how listen sockets are setup in order to allow immediate reconnect if crashed
- Fixed deserializing corrupt network messages (e.g. random ips connecting to server)
- Fixed current selected workspace not being properly saved / loaded
- Fixed crash from right click on cl -> download changes when there wasn't already a version of the file locally
- Fixed adding new project
- Fixed bug that would cause to never reload .ark_ignore when it didn't have any entries
- Fixed when OS discards file system events inside a child folder also discarding events from files in upper levels that we'd never know were changed
- Fixed launching server without -port parameter would use the default 9000 port instead of the port saved in the server config file

### Notes:
- If you open an older project, depending on the size, it may take a while before ark loads and becomes responsive, given that in this release we upgrade the servers in order to compress all files stored

## Version: 0.6.5 (13/03/2024)
### Features:
- New ignore / lock file semantics. Please check documentation for more information (tl;dr: * supported in the middle and ! at the start of entries for exclusion)
- New Ignore Inspector panel (Views->Ignore Inspector), to help you understand why something is or isn't ignored in your project
- Refactored how ws_files are created, including caching of relative paths

### Fixes:
- .ark_ignore file incorrectly reloaded when we couldn't open the file (e.g. text editor had a hold on it). We now will keep retrying until we achieve success
- Client crash when opening a workspace that is in a changelist that doesn't exist in this project
- When the server receives Ctrl+C or crashes we try to close the listen socket in order to be able to bind to it straight away

### Notes:
- If you open an older project, depending on the size, it may take a while before ark loads and becomes responsive, given that in this release we upgrade the servers in order to compress all files stored

## Version: 0.6.4 (26/02/2024)
### Features:
- Windows version now has an icon, making it more distinguisable in the taskbar

### Fixes:
- Bug that would disconnect new users without password with unknown user error
- Bug adding / editing connection that wouldn't properly set default host / port

### Notes:
- If you open an older project, depending on the size, it may take a while before ark loads and becomes responsive, given that in this release we upgrade the servers in order to compress all files stored

## Version: 0.6.3 (19/02/2024)
### Fixes:
- Improved performance building the branch merges in changelist history when multiple branches are involved
- Fixed horizontal scrollbars in log, changes and changelist details panels
- Changed diff context menu to show the last 10 entries and place older ones under a sub-menu

### Notes:
- If you open an older project, depending on the size, it may take a while before ark loads and becomes responsive, given that in this release we upgrade the servers in order to compress all files stored

## Version: 0.6.2 (16/02/2024)
### Fixes:
- Fixed bug introduced with utf8 fix from 0.6.1 that would make committing a lot of files extremely sluggish at the start
- Refactored network packet strategy in order to be more friendly for remote connections and Linux
- Limited the amount of requests handled, to limit the amount of memory allocated when pushing very big changelists

### Notes:
- If you open an older project, depending on the size, it may take a while before ark loads and becomes responsive, given that in this release we upgrade the servers in order to compress all files stored

## Version: 0.6.1 (07/02/2024)
### Features:
- License changes, now Indie and Business licenses include the free seat from the Free version

### Fixes:
- Bug with not using utf8 when trying to get the ws_file based on path
- Bug preventing opening shelf window when the workspace changelist it is tied to is empty
- Incorrect determination of common root changelist when trying to switch between branches if there's a non committed cl along the way

### Notes:
- If you open an older project, depending on the size, it may take a while before ark loads and becomes responsive, given that in this release we upgrade the servers in order to compress all files stored