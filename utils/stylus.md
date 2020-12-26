```
x-scale |    0    | x-trans
----------------------------
   0    | y-scale | y-trans
----------------------------
   0    |    0    | divisor

 1.5 |  0  |  0
------------------
  0  | 0.5 |  1
------------------
  0  |  0  |  1.5
```

For controlling bottom screen
```bash
xinput set-prop 21 --type=float "Coordinate Transformation Matrix" 1.5 0 0 0 0.5 1 0 0 1.5
```

For controlling top screen
```bash
xinput set-prop 21 --type=float "Coordinate Transformation Matrix" 1.5 0 0 0 0.5 0 0 0 1.5
```


21 is Pen(0)


https://github.com/linuxwacom/xf86-input-wacom/wiki/Dual-and-Multi-Monitor-Set-Up
