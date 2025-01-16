# Terra Palus
A dark satellite locked in eternal twilight, Terra Palus is locked in orbit of the verdant world of Gleba; a peculiar dance that keeps it perpetually shrouded from direct sunlight. This dim, foreboding moon presents unique challenges to engineering operations, as conventional solar power systems prove useless in its perpetual gloom.

The surface of Terra Palus is dominated by vast swamplands where stagnant waters merge with solid ground in treacherous patterns. The atmosphere, thick with organic particulates and bioluminescent spores, creates an eerie twilight that persists regardless of its position relative to Gleba. This unique atmospheric composition interacts catastrophically with night vision equipment, producing harmful light wavelengths that can permanently damage the enhanced optical sensors (eyeballs) used by engineering personnel.

Curiously, the moon harbors an unprecedented convergence of hostile life forms. Both the chitinous Biters native to Nauvis and the tentacled Pentapods of Gleba have established thriving populations here, suggesting a complex geological history.  Terra Palus may have formed from fragments of both Nauvis and Gleba, torn away during a cataclysmic event in the solar system's early history.

## Visit Terra Palus if you...
- Love spiders
- Love biters
- Love the dark
- Have a burning desire to use light as a weapon

----

## "Features"
Terra Palus is a small swamp-moon that orbits Gleba; you can unlock access to Terra Palus on the tech tree after researching Gleba.
- Always night - Terra Palus gets no sun; solar panels and accumulators won't work here.
- Night vision equipment does not work here and will be moved back to your inventory if you have it on your armour.
- Biters and Pentapods have bonded over their united hatred of your pollution.
- Swampy, muddy, wet landscapes that require a lot of landfill are abundant.
- [IN PROGRESS] Light Defence Technology - use Palusium ore (NEW) to build inhibitor lamps that freeze enemies in place.

## Bugs
- Haven't quite worked out how the starmap/remote view interface works yet so it looks like the moon orbits the sun. Just ignore that for now.
- Pentapod eggs that are left over after deaths of some spider mobs seem to be auto-collected into your inventory as if you're holding F. I wonder if this planet is missing something Gleba does with these automatically, I have no idea why this is happening and haven't played Gleba to see if this is expected behaviour but it seems weird.
- Sometimes if you load a save then delete a light that had frozen enemies, they stay frozen forever. That may or may not be fixed already.
- Inhibitor lamp UV damage actually stacks - it's not supposed to stack, so I turned this off for now.
- In Factorio 1.0 when an inserter arm had hovered over an empty sprite and you placed a box down, the box would collect the item on the floor but in Factorio 2.0 (or my crystal items) they get stuck under the box you place.
- Rocket stacking is not scaled properly for some items (some items are missing a weight parameter), need to fix.
- In Factoriopedia, Palusium ore only appears once in the preview but the other ores appear richer. Might be a setting somewhere. Tried to fix this with a lua.
- Probably other things because I'm a noob.

## To do
- Make the lamps icons purple on the map
- Finish Light Defense tech tree (I need to add a ground-based crusher entity/item to crush the Palusium ore into Palusium crystal)
- Find out how to apply "ghost" animation/effect/sticker to frozen enemies for fun to show stasis/etc

# About
I really like Factorio and I wanted to learn a bit about how to build a mod in minimum viable product form. I thought learning how to mod a planet/moon would be the most fun place to start. It's not perfect or balanced, and is just to learn and have fun - I'm open to any feedback. Hope you enjoy it!

## Useful factorio commands/info:

https://github.com/tburrows13/factorio-2.0-mod-porting-guide/blob/master/utilising-2.0-features.md
### Force chunk generation:
From Factorio 0.13.0 apparently. Useful for viewing a map gen in an existing game.
/c game.player.force.chart(game.player.surface,{{x = -1024, y = -1024}, {x = 1024, y = 1024}})

### set surface daytime (1.0 = day, 0.5 = night)
/c game.player.surface.daytime = 0.5


# Terra Palus Soundtrack
- https://pixabay.com/music/mystery-mysterious-and-mystic-116127/ 
- https://pixabay.com/music/mystery-whispers-in-the-rain-255654/ 
- https://pixabay.com/music/trap-musique-suspence-mysterieux-199399/
- https://pixabay.com/music/crime-scene-mysterious-disappearances-245988/
- https://pixabay.com/music/mystery-mysterious-mystical-depressive-anxious-143163/
- 

Need to add the following:
- https://pixabay.com/music/crime-scene-turf-war-244492/
- https://pixabay.com/music/mystery-mysterious-celesta-114064/
- https://pixabay.com/music/ambient-mysterious-ambient-suspense-atmosphere-252023/
- https://pixabay.com/music/modern-classical-sad-violin-150146/
- https://pixabay.com/music/mystery-peaceful-eerie-piano-196706/
