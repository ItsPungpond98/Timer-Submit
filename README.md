# Timer Submit Data Pack
This is ItsPungpond98's datapack for handling timers and generating time submission links.

## How to use it
### Reserved Objectives:
Please do not use these objectives in your maps.<br>
`timer, hscalc, big_multiply, big_add`

### Reserved Storage:
Please do not modify these storages in your maps.<br>
`timer:timesub, timer:timervalue`

## Timer
1. The `timer` objective is reserved
2. Run the following command on repeat when you want to use the timer.
```
function time:time/timer
```
3. Use the data from the storage `timer:timervalue` to do stuff. The digits are provided individually in the storage as json.

> [!WARNING]
> You can't modify the world border when using the timer!

## Time Submission Link
1. The `hscalc, big_multiply, big_add` objectives are reserved
2. Run the following command:
```
function timesub/gen {"v": #version, "map_id": #map_id}
```
- `#version` is the time submission link version
- `#map_id` is the unique number id of a map.

| Version | Example Time Code |
|---------|-------------------|
| 1 | 2195740065245 |
| 2 | 2219574200123456789 |

3. Receive your link!
