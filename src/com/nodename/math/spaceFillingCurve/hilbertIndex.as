package com.nodename.math.spaceFillingCurve
{
	public function hilbertIndex(dimension:uint, order:uint, point:Vector.<Number>):uint
	{
		var h:uint = 0;
		var entry:uint = 0;
		var direction:uint = 0;
		for (var i:uint = 0; i < order; i++)
		{
			var l:uint = 0;
			for (var x:uint = 0; x < dimension; x++)
			{
				var bit:uint = Utils.bitrange(point[dimension - x - 1], order, i, i + 1);
				l |= bit << x;
			}
			l = transform(entry, direction, dimension, l);
			var w:uint = Utils.grayCodeInverse(l);
			entry = entry ^ Utils.lrot(getEntry(w), direction + 1, dimension);
			direction = (direction + getDirection(w, dimension) + 1) % dimension;
			h = (h << dimension) | w;
		}
		return h;
	}
}
import com.nodename.math.spaceFillingCurve.Utils;

function transform(entry:uint, direction:uint, width:uint, x:uint):uint
{
	//assert x < 2**width
	//assert entry < 2**width
	return Utils.rrot(x ^ entry, direction + 1, width);
}