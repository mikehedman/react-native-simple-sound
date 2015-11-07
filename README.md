# react-native-simple-sound

React Native module for playing, pausing, and stopping sound clips.

Derived from Derived from [react-native-sound](https://github.com/zmxv/react-native-sound), which allows multiple sound files to be played at once, but does not offer pause or stop.

## Installation

```javascript
npm install react-native-simple-sound --save
```

In XCode, right click **Libraries**.
Click **Add Files to "[Your project]"**.
Navigate to **node_modules/react-native-simple-sound**.
Add the file **RNSimpleSound.xcodeproj**.

In the project navigator, select your project.
Click the build target.
Click **Build Phases**.
Expand **Link Binary With Libraries**.
Click the plus button and add **libRNSimpleSound.a** under **Workspace**.

Run your project (⌘+R).

## Example

```js
var Sound = require('react-native-simple-sound');
Sound.enable(true); // Enable sound
Sound.prepare('tap.aac'); // Preload the sound file 'tap.aac' in the app bundle
Sound.play(); // Play the sound 'tap.aac'
Sound.pause(); // Pause the sound
Sound.play(); // Resume playing the sound
Sound.stop(); // Stop and reset the sound.
```

## Notes
- Sound.enable(true) must be called before playing any sound.
- Sound.prepare(...) must be called before playing - preloads a sound file and prepares it for playback.
- To change sounds, stop() the current sound and call prepare() with the new sound.
- The module wraps AVAudioPlayer which supports aac, aiff, mp3, wav etc. The full list of supported formats can be found [here](https://developer.apple.com/library/ios/documentation/AudioVideo/Conceptual/MultimediaPG/UsingAudio/UsingAudio.html).
- The stop() function resets the sound back to the beginning, this is different from the standard behavior of AVAudioPlayer
- Sound files must be in the bundle (in your app's main folder in Xcode)
