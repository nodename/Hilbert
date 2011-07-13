package com.nodename.math.spaceFillingCurve
{
	import com.nodename.math.logBase2;

	public class Utils
	{
		public static function grayCode(i:uint):uint
		{
			return i ^ (i >> 1);
		}
		
		public static function grayCodeInverse(grayCode:uint):uint
		{
			const bits:uint = Math.ceil(logBase2(grayCode + 1));
			
			var binary:uint = grayCode;
			var shift:uint = 1;
			while (shift < bits)
			{
				binary ^= grayCode >> shift;
				shift++;
			}
			return binary;
		}
		
		public static function bitrange(x:uint, width:uint, start:uint, end:uint):uint
		{
			// Extract the bit range of x from start (inclusive) to just before end
			return x >> (width - end) & ((1 << (end - start)) - 1);
		}
		
		public static function rrot(x:uint, i:uint, width:uint):uint
		{
			//Right bit-rotation.
			
			//width: the bit width of x.
			//assert x < 2**width
			i = i % width;
			x = (x >> i) | (x << width - i);
			return x & ((1 << width) - 1);
		}
		
		public static function lrot(x:uint, i:uint, width:uint):uint
		{
			// Left bit-rotation.
			
			// width: the bit width of x.
			//assert x < 2**width
			i = i % width;
			x = (x << i) | (x >> width - i);
			return x & ((1 << width) - 1);
		}
		
		public static function setbit(x:uint, w:uint, i:uint, bit:uint):uint
		{
			// Sets bit i in an integer x of width w to bit. 
			// bit must be 1 or 0
			//assert bit in [1, 0]
			//assert i < w
			if (bit)
			{
				return x | (1 << w - i - 1);
			}
			else
			{
				return x & ~ (1 << w - i - 1);
			}
		}
		
		public static function trailingSetBits(x:uint):uint
		{
			//const bits:uint = Math.ceil(logBase2(x + 1));
			var setBits:uint = 0;
			while (x & 1 /*&& setBits <= bits*/)
			{
				x >>= 1;
				setBits++;
			}
			return setBits;
		}
		
		public function Utils()
		{
			throw new Error("Utils: no constructor");
		}
	}
}
