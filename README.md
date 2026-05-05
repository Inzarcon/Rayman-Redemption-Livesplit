# Rayman Redemption LiveSplit
Livesplit Auto Splitter Script and Split Table Templates for Rayman Redemption Speedrunning.

## Installing
### Auto Splitter Script
- Edit the downloaded layout (or your own).
- Select or create the `Scriptable Auto Splitter`.
- Under `Script Path`, select the downloaded `rayman_redemption.asl` file.
- Select the `Advanced` section you want (see below).

### Layout
<img width="200" alt="rr_layout" src="https://github.com/user-attachments/assets/9cc208dd-5d20-43d8-a9a9-8f48decfd780" />

- There two layout variants:
  - `with_subsplits`: For level splits and subsplits between the parts of a level (a.k.a "Screens", "Phases", or "Sublevels").
  - `no_subsplits`: For only the level splits.

- If you want to use the Rayman 1 style font by Droolie, you need to download and install it first.
  - Download link: https://raytunes.raymanpc.com/rayman_fonts/Rayman%201.ttf 
  - Also see https://raymanpc.com/forum/viewtopic.php?t=7345
  - You may need to restart LiveSplit and select the font again in the layout settings.
 
### Splits
- Split files also come in variants, with the file name containing the combination:
  - `with_subsplits` and `no_subsplits` with the same meaning as for the layouts.
  - `blank` containing a blank table without any preset times.
  - `with_wr` containing accurate splits of the current world record for comparison. (As of 2026/05/06)
- Make sure you are using the correct layout for the splits!

### Configuration
There are four checkboxes for the Auto Splitter behavior you can customize in the `Scriptable Auto Splitter` -> `Advanced` section:
- `Split between level parts (Subsplits)`. Whether to auto split between level parts. Should align with your layout and splits.
- `Split when leaving Betilla's Garden/The Shop`. Whether to also auto split when leaving these two levels, i.e. for acquiring upgrades. You'll need to edit the splits table if using these options as the exact location in the list depends on your personal route.
- `Reset timer in Main Menu`. Whether to automatically reset the timer when on the main menu. Use with care; accidental quits or game crashes may cause unwanted resets.

Note that there is currently no auto splitting for starting the game and the final (run finishing) split. This is due to the run rules:

- The timer starts immediately when confirming the difficulty, not on the scene change to the intro cutscene. I recommend binding spacebar to `Start/Split` in the LiveSplit settings. This automatically starts the run both in game and LiveSplit in sync.
- The same applies to the final split. It happens when landing on Bzzit without a scene change. You need to do this one manually.

### License
The files in this repository are licensed under the MIT License.
See [LICENSE](LICENSE)
