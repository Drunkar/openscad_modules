# OpenSCAD modules

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/Drunkar/openscad_modules/blob/master/LICENSE.txt)
![build status](https://circleci.com/gh/Drunkar/openscad_modules.svg?style=shield&circle-token=479a14ac21de4b994b8f90dee2d97d85964884c1)


<!-- TOC depthFrom:2 depthTo:3 withLinks:1 updateOnSave:0 orderedList:0 -->

- [ArcOfCylinder](#arcofcylinder)
- [BananaJackMounter](#bananajackmounter)
- [CoverForBox](#coverforbox)
- [CylinderCircle](#cylindercircle)
-[CylinderCircleHorizontal](#cylindercirclehorizonta)
- [DiamondColumns](#diamondcolumns)
- [ExtendablePipe](#extendablepipe)
-[HexaCylinderCircleHorizontal](#hexacylindercirclehrizontal)
- [HoneyCombCylinder](#honeycombcylinder)
-[HoneyCombCylinderConvex](#honeycombcylinderconvex)
- [HoneyCombPlate](#honeycombplate)
- [Pipe](#pipe)
- [PipeCircle](#pipecircle)
- [Prism](#prism)
- [RoundedCube](#roundedcube)
- [RoundedRectangle](#roundedrectangle)
- [SnapCap](#snapcap)
- [SnapHook](#snaphook)
- [SpaceFrameTrussBeam](#spaceframetrussbeam)
- [TrussBeamTwoDimensions](#trussbeamtwodimensions)

<!-- /TOC -->


### ArcOfCylinder

```
ArcOfCylinder(r_outer=5, r_inner=4, height=10, angle=280);
```

![ArcOfCylinder.png](https://github.com/Drunkar/openscad_modules/blob/images/ArcOfCylinder.png)


### BananaJackMounter

```
BananaJackMounter($fn=50);
```

![BananaJackMounter.png](https://github.com/Drunkar/openscad_modules/blob/images/BananaJackMounter.png)


### CoverForBox

```
CoverForBox(
    x_outer=20,
    y_outer=10,
    x_inner=18,
    y_inner=8,
    top_plate_thickness=3,
    wall_thickness=2,
    wall_height=10
);
```

![CoverForBox.png](https://github.com/Drunkar/openscad_modules/blob/images/CoverForBox.png)


### CylinderCircle

```
CylinderCircle(num_cylinder=6, r_circle=14, r_cylinder=1, h_cylinder=5);
```

![CylinderCircle.png](https://github.com/Drunkar/openscad_modules/blob/images/CylinderCircle.png)


### CylinderCircleHorizontal

```
CylinderCircleHorizontal(num_cylinder=6, r_circle=14, r_cylinder=1, h_cylinder=5);
```

![CylinderCircleHorizontal.png](https://github.com/Drunkar/openscad_modules/blob/images/CylinderCircleHorizontal.png)


### DiamondColumns

```
DiamondColumns(num_x=4, num_y=6, h=3, r_hole_max=3);
```

![DiamondColumns.png](https://github.com/Drunkar/openscad_modules/blob/images/DiamondColumns.png)


### ExtendablePipe

```
ExtendablePipe(
    h=100,
    h_joint=20,
    r_outer=30,
    r_inner=28,
    num_groove=20,
    depth_of_groove=1,
    width_of_groove=2
);
```

![ExtendablePipe.png](https://github.com/Drunkar/openscad_modules/blob/images/ExtendablePipe.png)


### HexaCylinderCircleHorizontal

```
HexaCylinderCircleHorizontal(num_cylinder=6, r_circle=14, r_honeycomb=1, h_honeycomb=5);
```

![HexaCylinderCircleHorizontal.png](https://github.com/Drunkar/openscad_modules/blob/images/HexaCylinderCircleHorizontal.png)


### HoneyCombCylinder

```
HoneyCombCylinder(
    num_row_of_hex=8,
    num_hex_in_row=8,
    r_cylinder=10,
    h_cylinder=30,
    thickness=1,
    r_honeycomb=3,
    h_honeycomb=5,
    offset_top=3,
    offset_bottom=3
);
```

![HoneyCombCylinder.png](https://github.com/Drunkar/openscad_modules/blob/images/HoneyCombCylinder.png)


### HoneyCombCylinderConvex

```
HoneyCombCylinderConvex(
    num_row_of_hex=8,
    num_hex_in_row=8,
    r_cylinder=10,
    h_cylinder=30,
    r_honeycomb=3,
    h_honeycomb=5,
    offset_top=3,
    offset_bottom=5
);
```

![HoneyCombCylinderConvex.png](https://github.com/Drunkar/openscad_modules/blob/images/HoneyCombCylinderConvex.png)


### HoneyCombPlate

```
HoneyCombPlate(
    x=70,
    y=50,
    thickness=2,
    padding=3,
    r_honeycomb=3,
    margin_honeycomb=0.5
);
```

![HoneyCombPlate.png](https://github.com/Drunkar/openscad_modules/blob/images/HoneyCombPlate.png)


### Pipe

```
Pipe(r_outer=8, r_inner=6, h=10);
```

![Pipe.png](https://github.com/Drunkar/openscad_modules/blob/images/Pipe.png)


### PipeCircle

```
PipeCircle(
    num_cylinder=6,
    r_circle=14,
    r_pipe_outer=2,
    r_pipe_inner=1,
    h_pipe=5
);
```

![PipeCircle.png](https://github.com/Drunkar/openscad_modules/blob/images/PipeCircle.png)


### Prism

```
Prism(x=10, y=5, h=30);
```

![Prism.png](https://github.com/Drunkar/openscad_modules/blob/images/Prism.png)


### RoundedCube

```
RoundedCube(x=10, y=10, z=10, r=2, $fn=50);
```

![RoundedCube.png](https://github.com/Drunkar/openscad_modules/blob/images/RoundedCube.png)


### RoundedRectangle

```
RoundedRectangle(x=50, y=30, thickness=THICKNESS, r=2, thickness=2, $fn=50);
```

![RoundedRectangle.png](https://github.com/Drunkar/openscad_modules/blob/images/RoundedRectangle.png)


### SnapCap

```
SnapCap(x=20, y=20, z_box=10, z_cap=5, thickness=1, h_mount=0.6, type="both");
```

* Type can take "both", "bottom" or "cap".

![SnapCap.png](https://github.com/Drunkar/openscad_modules/blob/images/SnapCap.png)


### SnapHook

```
SnapHook(x=20, y=20, z_box=10, z_cap=5, thickness=1, type="both");
```

- Type can take "both", "bottom" or "cap".

![SnapHook.png](https://github.com/Drunkar/openscad_modules/blob/images/SnapHook.png)


### SpaceFrameTrussBeam

```
SpaceFrameTrussBeam(
    x=320,
    y=50,
    thickness=3,
    rod_height=5,
    truss_width=2,
    truss_angle=70
);
```

![SpaceFrameTrussBeam.png](https://github.com/Drunkar/openscad_modules/blob/images/SpaceFrameTrussBeam.png)


### TrussBeamTwoDimensions

```
TrussBeamTwoDimensions(
    x=320,
    y=50,
    thickness=3,
    rod_height=5,
    truss_width=2,
    truss_angle=70
);
```

![TrussBeamTwoDimensions.png](https://github.com/Drunkar/openscad_modules/blob/images/TrussBeamTwoDimensions.png)
