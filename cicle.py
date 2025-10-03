"""
This module demonstrates a simple circle class and a function to calculate
the area of a circle in all of Jac's glory.
"""
from __future__ import annotations
from jaclang.runtimelib.builtin import *
from jaclang import JacMachineInterface as _
from enum import Enum, auto
import math
RAD = 5

def calculate_area(radius: float) -> float:
    """Function to calculate the area of a circle."""
    return math.pi * radius * radius

@_.sem('', {'CIRCLE': '', 'UNKNOWN': ''})
class ShapeType(Enum):
    """Enum for shape types"""
    CIRCLE = 'Circle'
    UNKNOWN = 'Unknown'

class Shape(_.Obj):
    """Base class for a shape."""
    shape_type: ShapeType

    @abstractmethod
    def area(self) -> float:
        """Abstract method to calculate the area of a shape."""
        pass

class Circle(Shape, _.Obj):
    """Circle class inherits from Shape."""

    def __init__(self, radius: float) -> None:
        super().__init__(ShapeType.CIRCLE)
        self.radius = radius

    @override
    def area(self) -> float:
        """Overridden method to calculate the area of the circle."""
        return math.pi * self.radius * self.radius
c = Circle(RAD)
if __name__ == '__main__':
    print(f'Area of a circle with radius {RAD} using function: {calculate_area(RAD)}')
    print(f'Area of a {c.shape_type.value} with radius {RAD} using class: {c.area()}')
expected_area = 78.53981633974483

@_.jac_test
def test_calc_area(_check) -> None:
    _check.assertAlmostEqual(calculate_area(RAD), expected_area)

@_.jac_test
def test_circle_area(_check) -> None:
    c = Circle(RAD)
    _check.assertAlmostEqual(c.area(), expected_area)

@_.jac_test
def test_circle_type(_check) -> None:
    c = Circle(RAD)
    _check.assertEqual(c.shape_type, ShapeType.CIRCLE)
