/*
Translated from the original Python at https://github.com/cortesi/scurve
Based on Compact Hilbert Indices by Chris Hamilton http://www.cs.dal.ca/research/techreports/cs-2006-07
*/

package com.nodename.math.spaceFillingCurve
{
	import com.nodename.math.logBase2;

	public class Hilbert
	{
		private var _dimension:uint;
		private var _order:uint;
		private var _length:uint;
		
		public static function fromSize(dimension:uint, size:uint):Hilbert
		{
			// Size is the total number of points in the curve.
			
			var x:Number = logBase2(size);
			
			if (x/dimension != int(x)/dimension)
			{
				throw new Error("Size does not fit Hilbert curve of dimension " + dimension);
			}
			return new Hilbert(dimension, int(x/dimension));
		}
		
		public function Hilbert(dimension:uint, order:uint)
		{
			_dimension = dimension;
			_order = order;
			_length = Math.pow(2, _dimension * _order);
		}
		
		public function get length():uint
		{
			return _length;
		}
		
		/*public function getItem(index:uint):Vector.<Number>
		{
			if (index > _length)
			{
				throw new Error("index out of bounds");
			}
			return point(index);
		}*/
		
		/*public function dimensions():uint
		{
			// Size of this curve in each dimension.
			return [int(     Math.pow(_length, 1/_dimension)     )] * _dimension;
		}*/
		
		public function index(p:Vector.<Number>):uint
		{
			return hilbertIndex(_dimension, _order, p);
		}
		
		public function point(index:uint):Vector.<Number>
		{
			return hilbertPoint(_dimension, _order, index);
		}
	}
}
