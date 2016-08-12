#!/usr/bin/env python
# coding: utf-8

import invoke


@invoke.task
def test(ctx):
    invoke.run("openscad -o ${CIRCLE_ARTIFACTS}/ArcOfCylinder.stl modules/ArcOfCylinder.scad | egrep -c 'ERROR|WARNING'")