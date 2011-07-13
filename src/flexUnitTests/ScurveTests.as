package flexUnitTests
{
	import com.nodename.math.spaceFillingCurve.Hilbert;
	import com.nodename.math.spaceFillingCurve.Utils;
	
	import org.flexunit.assertThat;

	public class ScurveTests
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function grayCodeAndInverse():void
		{
			for (var i:uint = 0; i < 1024; i++)
			{
				assertThat(Utils.grayCodeInverse(Utils.grayCode(i)) == i);
			}
		}
		
		[Test]
		public function grayCodeIsSymmetric():void
		{
			const n:uint = 20;
			const twoToTheN:uint = uint(Math.pow(2, n));
			const twoToThe_NMinusOne:uint = uint(Math.pow(2, n - 1));
			for (var i:uint = 0; i < twoToThe_NMinusOne; i++)
			{
				assertThat(Utils.grayCode(twoToTheN - 1 - i) == (Utils.grayCode(i) ^ twoToThe_NMinusOne));
			}
		}
		
		[Test]
		public function trailingSetBitsIsSymmetric():void
		{
			const n:uint = 20;
			const twoToTheN:uint = uint(Math.pow(2, n));
			for (var i:uint = 0; i < twoToTheN - 1; i++)
			{
				assertThat(Utils.trailingSetBits(i) == Utils.trailingSetBits(twoToTheN - 2 - i));
			}
		}
		
		/*[Test]
		public function show2DPoints():void
		{
			const hilbert:Hilbert = new Hilbert(2, 3);
			const length:uint = hilbert.length;
			for (var i:uint = 0; i < length; i++)
			{
				trace(hilbert.point(i));
			}
			assertThat(true);
		}*/
		
		
	}
}