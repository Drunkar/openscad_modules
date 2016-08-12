#!/usr/bin/env python
# coding: utf-8
import invoke

CMD = "openscad -o ${CIRCLE_ARTIFACTS}/ArcOfCylinder.stl "
GREP = " | egrep -c 'ERROR|WARNING'"

@invoke.task
def test(ctx):
    assert invoke.run(CMD + "modules/ArcOfCylinder.scad" + GREP) == 0
    return