// Autosplitter for Rayman Redemption v.1.1.4 Any% category.


state("Rayman Redemption")
{
    /*
    Current Scene ID. Every Screen, including some menus and cutscenes,
    has a unique ID. There are no duplicates shared between levels (e.g.
    Pink Plant Woods 1 and Anguish Lagoon 1 don't have the same ID).

    ID's mostly increment in the playing order, with some exceptions
    such as Betilla's Garden and The Shop, as well as the Eat At Joe's
    Shortcut. The Bzzit bonus levels are also excluded; those are the
    gaps of one ID between most worlds.

    "Full" List (for Any%):

    Scene/Level                   | Scene IDs
    ------------------------------------------
    Copyright Disclaimer          |   0
    Main Menu                     |   1
    Intro Cutscene                |   2
    Overmap                       |   3

    The Dream Forest
      Pink Plant Woods            |   6 -   9
      Anguish Lagoon              |  10 -  13
      The Swamps of Forgetfulness |  14 -  16
      Moskito's Nest              |  17 -  22

    Band Land
      Bongo Hills                 |  23 -  27
      Allegro Presto              |  28 -  31
      Gong Heights                |  32 -  34
      Mr Sax's Hullaballoo        |  35 -  38

    Blue Mountains
      Twilight Gulch              |  40 -  41
      The Hard Rocks              |  42 -  44
      Mr Stone's Peaks            |  45 -  49
      Tempest Terror              |  50 -  53

    Picture City
      Eraser Plains               |  54 -  58
      (Art Block)                 |  59 -  61  (Only entered; not finished in Any% to skip Trojan Mama.)
      Pencil Pentathlon           |  62 -  64
      (Trojan Mama Boss)          |  65        (After 61 or 64; locked to first-entered level.)
      Space Mama's Crater         |  66 -  69

    The Caves of Skops
      Crystal Palace              |  71 -  73
      Eat at Joe's                |  74 -  79
      Eat at Joe's Shortcut       |  91
      Molten Depths               |  80 -  85
      Mr Skops' Stalactites       |  86 -  89

    Playtopia
      Child's Play                |  92 -  94
      The Playhouse               |  95 -  97
      The Lair of the Chessmaster |  98 - 100
      Brain Games                 | 101 - 103

    Candy Chateau
      Tasty Reception             | 105 - 107
      Choco Chambers              | 108 - 111
      The Sweet Spot              | 112 - 114
      Mr Dark's Dare              | 115 - 119

    The Final Showdown
      The Lonely Cliff*           | 121
      The End of the World        | 122 - 127

    *Note: The Lonely Cliff is shown as a separate
    level on the map, but the game effectively treats
    The Final Showdown as one combined level.

    Extra
      The Shop                    | 129
      Betilla's Garden            | 131
    */

	int sceneID : 0x063AA848;
}

startup
{
    /*
    List of Scene IDs which are the final scene of a level.
    You don't need to modify these unless you find a mistake.
    (Please open a GitHub Issue or DM me on Discord in that case.)
    */
    vars.quitScenes = new int[29]
    {
          9, // Pink Plant Woods - Darktoon Boss
         13, // Anguish Lagoon - 4
         16, // The Swamps of Forgetfulness - 3
         22, // Moskito's Nest - Pink Helpers

         27, // Bongo Hills - Mad Drummer Boss
         31, // Allegro Presto - 4
         34, // Gong Heights - 3
         38, // Mr Sax's Hullaballoo - Mr Sax Boss

         41, // Twilight Gulch - Mr Stone Chase
         44, // The Hard Rocks - 3
         49, // Mr Stone's Peaks - Mr Stone Boss
         53, // Tempest Terror - Pink Helpers

         58, // Eraser Plains - Viking Mama Boss
         61, // Art Block - 3
         64, // Pencil Pentathlon - 3
         65, // Trojan Mama Boss (Skipped in Any%)
         69, // Space Mama Boss

         73, // Crystal Palace - 3
         79, // Eat At Joe's - 6
         85, // Molten Depths - Pink Helpers
         89, // Mr Skops' Stalactites - Mr Skops Boss

         94, // Child's Play - 3
         97, // The Playhouse - 3
         100, // The Lair of the Chessmaster - Chessmaster Boss
         103, // Brain Games - The Menace Boss

         107, // Tasty Reception - 3
         111, // Choco Chambers - Choco Monster Boss
         114, // The Sweet Spot - 3
         119, // Mr Dark's Dare - Henchmen & Mr Dark Boss

         /*
         Note: 127 (Final Escape) not included. As per the rules,
         the final split and overall run time is set when landing on
         Bzzit. You have to do that part manually.
         */
    };

    settings.Add("subSplits", false, "Split between level parts (Subsplits)");
    settings.Add("betilla", false, "Split when leaving Betilla's Garden");
    settings.Add("shop", false, "Split when leaving The Shop");
    settings.Add("resetMenu", false, "Reset timer in Main Menu");

}

split
{
    if (settings["subSplits"])
    {
        if (current.sceneID > 3 && old.sceneID == current.sceneID - 1 // Regular Case
        ||  old.sceneID == 77 && current.sceneID == 91 // Eat At Joe's Shortcut Start
        ||  old.sceneID == 91 && current.sceneID == 78 // Eat At Joe's Shortcut End
        )
        {
            return true;
        }


    }
    return current.sceneID == 3 &&
        (old.sceneID > 3 && old.sceneID != 131 && old.sceneID != 129 && Array.IndexOf(vars.quitScenes, old.sceneID) != -1)
    ||  (settings["betilla"] && old.sceneID == 131 && current.sceneID == 3)
    ||  (settings["shop"] && old.sceneID == 129 && current.sceneID == 3);

}

reset
{
    return (settings["resetMenu"]) && old.sceneID == 0 && current.sceneID == 1;
}
