package com.nodename.math.spaceFillingCurve
{
	public function getEntry(x:uint):uint
	{
		if (x == 0)
		{
			return 0;
		}
		else
		{
			return Utils.grayCode(2 * uint(Math.floor((x - 1)/2)));
		}
	}
}