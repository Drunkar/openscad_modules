# OpenSCAD modules

![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

![build status](https://circleci.com/gh/a-know/awesome_events.svg?style=shield&circle-token=479a14ac21de4b994b8f90dee2d97d85964884c1)

<!-- MarkdownTOC -->

- [ArcOfCylinder](#arcofcylinder)
- [CylinderCircle](#cylindercircle)
- [CylinderCircleHorizontal](#cylindercirclehorizontal)
- [ExtendablePipe](#extendablepipe)
- [HexaCylinderCircleHorizontal](#hexacylindercirclehorizontal)
- [HoneyCombCylinder](#honeycombcylinder)
- [HoneyCombCylinderConvex](#honeycombcylinderconvex)
- [Pipe](#pipe)
- [SpaceFrameTrussBeam](#spaceframetrussbeam)
- [TrussBeamTwoDimensions](#trussbeamtwodimensions)

<!-- /MarkdownTOC -->

### ArcOfCylinder

```
ArcOfCylinder(r_outer=5, r_inner=4, height=10, angle=280);
```

![ArcOfCylinder.png](https://github.com/Drunkar/openscad_modules/blob/images/ArcOfCylinder.png)

* CoverForBox

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

### Pipe

```
Pipe(r_outer=8, r_inner=6, h=10);
```

![Pipe.png](https://github.com/Drunkar/openscad_modules/blob/images/Pipe.png)

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