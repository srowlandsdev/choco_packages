# Package changelog
## Version: 0.9.10 (16/01/2025)
### Features:
- Copying files after a get is now time sliced, not making Ark unresponsive when getting big quantities of data
- Ark now displays the progress of copying files so you can get an idea of how long it will take
- Improved Diff context menus
- Refactored states of getting files to be more streamlined
- Shelf window will now allow you to diff the current revision's assets with any other revisions / history of that asset
- Diff in changelist history can now diff with local file too (either choosing Local or Alt+Double Click)
- Diff in changelist history now displays the versions of the asset on that branch, not the versions on the current branch we're at
- Resolve conflicts window now has a default size on opening
- Open With preference entries now display Application first and hint that the Name is optional (if it isn't present now displays executable name instead of path)
- Preferences now allows you to set the framerate for the GUI version (if 'auto' is selected - it is by default -, it will get the framerate from the current primary monitor)
- Reverting operations that would cause for the deletion of directories will now delete these directories if they have ignored files inside
- Fixed when having a workspace already populated with the data we're getting not triggering the files to be reconciled after getting latest, which meant they stay showing as being added until they were reconciled

## Version: 0.8.0 (13/05/2024)
### Features:
- MacOS server / cli / gui!
- Reworked how notifications get sent, they now are sent based on connection id and not user id (this means that if the same user is connected from 2 machines, he's up to date with notifications)
- Tooltips now have a delay before showing
- Moved Open App Folder from Debug to File menu
- Changed font to be 18pt by default, this way if somebody thinks font is too small they can scale it down and look better than scaling smaller font up

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