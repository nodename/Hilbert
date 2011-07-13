package com.nodename.math.spaceFillingCurve
{
	// intra Subhypercube Direction: the direction from entry to exit points of the subhypercube,
	// i.e. the unique bit position where the entry and exit points differ
	public function getDirection(x:uint, n:uint):uint
	{
		//assert x < 2**n
		if (x == 0)
		{
			return 0;
		}
		else if (x % 2 == 0)
		{
			return Utils.trailingSetBits(x - 1) % n;
		}
		else
		{
			return Utils.trailingSetBits(x) % n;
		}
	}
}