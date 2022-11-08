# Battery-Mon.

This is a very simple Hammerspoon that will report your battery percentage through text-to-speech every 10%.

## Instillation.

If you have Hammerspoon installed, simply open the .spoon file, and it should automatically go in the right spot.

To actually use the spoon, add the following two lines to your init.lua:

```lua
hs.loadSpoon("BatteryMon")
spoon.BatteryMon:start()
```

Once done, your system voice will announce your battery in 10% intervals.

## Todo.

* Make the interval configurable. This is already doable if you change the `interval` variable in the .lua file, but it needs to be much more user-friendly (especially for less technical users).
