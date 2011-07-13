package com.nodename.math.spaceFillingCurve
{
	public function hilbertPoint(dimension:uint, order:uint, hilbertIndex:uint):Vector.<Number>
	{
		// Convert an index on the Hilbert curve of the specified dimension and
		// order to a set of point coordinates.
		//    The bit widths in this function are:
		//        point[*]  - order
		//        hilbertIndex     - order*dimension
		//        l     - dimension
		//        entry     - dimension
		
		// This function is cyclic. if hilbertIndex is greater than the number of points on the curve,
		// the result is the same as that for hilbertIndex % length.
		
		var hwidth:uint = order * dimension;
		var entry:uint = 0;
		var direction:uint = 0;
		
		var i:uint;
		
		var point:Vector.<Number> = new Vector.<Number>(dimension);
		for (i = 0; i < dimension; i++)
		{
			point[i] = 0;
		}
		
		for (i = 0; i < order; i++)
		{
			var w:uint = Utils.bitrange(hilbertIndex, hwidth, i * dimension, i * dimension + dimension);
			var l:uint = Utils.grayCode(w);
			l = itransform(entry, direction, dimension, l);
			for (var j:uint = 0; j < dimension; j++)
			{
				var bit:uint = Utils.bitrange(l, dimension, j, j + 1);
				point[j] = Utils.setbit(point[j], order, i, bit);
			}
			entry = entry ^ Utils.lrot(getEntry(w), direction + 1, dimension);
			direction = (direction + getDirection(w, dimension) + 1) % dimension;
		}
		return point;
	}
}
import com.nodename.math.spaceFillingCurve.Utils;


function itransform(entry:uint, direction:uint, width:uint, x:uint):uint
{
	// Inverse transform - we simply reverse the operations in transform.
	// assert x < 2**width
	// assert entry < 2**width
	return Utils.lrot(x, direction + 1, width) ^ entry;
	/*
	# There is an error in the Hamilton paper's formulation of the inverse
	# transform in Lemma 2.12. The correct restatement as a transform is as follows: 
	# return transform(rrot(entry, direction+1, width), width-direction-2, width, x)
	*/
}

