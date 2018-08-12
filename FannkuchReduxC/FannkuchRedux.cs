// The Computer Language Benchmarks Game
// https://salsa.debian.org/benchmarksgame-team/benchmarksgame/
//
// Contributed by Jeremy Zerfas
// Based on the Ada program by Jonathan Parker and Georg Bauhaus which in turn
// was based on code by Dave Fladebo, Eckehard Berns, Heiner Marxen, Hongwei Xi,
// and The Anh Tran and also the Java program by Oleg Mazurov.

// This value controls how many blocks the workload is broken up into (as long
// as the value is less than or equal to the factorial of the argument to this
// program) in order to allow the blocks to be processed in parallel if
// possible. PREFERRED_NUMBER_OF_BLOCKS_TO_USE should be some number which
// divides evenly into all factorials larger than it. It should also be around
// 2-8 times the amount of threads you want to use in order to create enough
// blocks to more evenly distribute the workload amongst the threads.


using System;
using System.Threading.Tasks;

namespace FannkuchReduxC
{
	public class FannkuchRedux
	{
		public const int PrefferedBlockCount = 12;

		public static void Main(string[] argv)
		{
			int n = int.Parse(argv[0]);

			// Create and initialize factorial_Lookup_Table.
			int[] factorialLUT = new int[n + 1];
			factorialLUT[0] = 1;
			for (int i = 0; ++i <= n;)
			{
				factorialLUT[i] = i * factorialLUT[i - 1];
			}

			// Determine the block_Size to use. If n! is less than
			// PrefferedBlockCount then just use a single block to prevent
			// block_Size from being set to 0. This also causes smaller values of n to
			// be computed serially which is faster and uses less resources for small
			// values of n.
			int blockSize = factorialLUT[n] / (factorialLUT[n] < PrefferedBlockCount ? 1 : PrefferedBlockCount);

			int maxFlipCount = 0, checksum = 0;

			// Iterate over each block.
			//#pragma omp parallel for \
			//			reduction(max: maximum_Flip_Count) reduction(+:checksum)
			for (int initialBlockIndex = 0; initialBlockIndex < factorialLUT[n]; initialBlockIndex += blockSize)
			{

				int[] count = new int[n];
				sbyte[] tmpPermute = new sbyte[n], currentPermute = new sbyte[n];


				// Initialize count and current_Permutation.
				count[0] = 0;
				for (int i = 0; i < n; ++i)
				{
					currentPermute[i] = unchecked((sbyte)i);
				}

				for (int i = n - 1, permutation_Index = initialBlockIndex; i > 0; --i)
				{
					int d = permutation_Index / factorialLUT[i];
					permutation_Index = permutation_Index % factorialLUT[i];
					count[i] = d;

					for (int j = 0; j < n; ++j)
					{
						tmpPermute[j] = currentPermute[j];
					}

					for (int j = 0; j <= i; ++j)
					{
						currentPermute[j] = (j + d <= i ? tmpPermute[j + d] : tmpPermute[j + d - i - 1]);
					}
				}


				// Iterate over each permutation in the block.
				int lastPermuteBlockIndex = initialBlockIndex + blockSize - 1;

				for (int permuteIndex = initialBlockIndex; ; ++permuteIndex)
				{

					// If the first value in the current_Permutation is not 1 (0) then
					// we will need to do at least one flip for the current_Permutation.
					if (currentPermute[0] > 0)
					{

						// Make a copy of current_Permutation[] to work on. Note that we
						// don't need to copy the first value since that will be stored
						// in a separate variable since it gets used a lot.
						for (int i = 0; ++i < n;)
						{
							tmpPermute[i] = currentPermute[i];
						}

						int flipCount = 1;

						// Flip temp_Permutation until the element at the first_Value
						// index is 1 (0).
						for (int value1 = currentPermute[0]; tmpPermute[value1] > 0; ++flipCount)
						{

							// Record the new_first_Value2 and restore the old
							// first_Value2 at its new flipped position.
							sbyte value2 = tmpPermute[value1];
							tmpPermute[value1] = unchecked((sbyte)value1);

							// If first_Value2 is greater than 3 (2) then we are flipping
							// a series of four or more values so we will also need to
							// flip additional elements in the middle of the
							// temp_Permutation.
							if (value1 > 2)
							{
								int lowIndex = 1, highIndex = value1 - 1;
								// Note that this loop is written so that it will run at
								// most 16 times so that compilers will be more willing
								// to unroll it. Consequently this won't work right when
								// n is greater than 35. This would probably be the
								// least of your concerns since 21! won't fit into 64
								// bit integers and even if it did you probably wouldn't
								// want to run this program with a value that large
								// since it would take thousands of years to do on a
								// modern desktop computer. ;-)
								do
								{
									sbyte temp = tmpPermute[highIndex];
									tmpPermute[highIndex] = tmpPermute[lowIndex];
									tmpPermute[lowIndex] = temp;
								} while (lowIndex++ + 3 <= highIndex-- && lowIndex < 16);
							}

							// Update first_Value2 to new_first_Value2 that we recorded
							// earlier.
							value1 = value2;
						}


						// Update the checksum.
						if (permuteIndex % 2 == 0)
						{
							checksum += flipCount;
						}
						else
						{
							checksum -= flipCount;
						}

						// Update maximum_Flip_Count if necessary.
						if (flipCount > maxFlipCount)
						{
							maxFlipCount = flipCount;
						}
					}


					// Break out of the loop when we get to the
					// last_Permutation_Index_In_Block.
					if (permuteIndex >= lastPermuteBlockIndex)
					{
						break;
					}

					// Generate the next permutation.
					sbyte value = currentPermute[1];
					currentPermute[1] = currentPermute[0];
					currentPermute[0] = value;

					for (int i = 1; ++count[i] > i;)
					{
						count[i++] = 0;
						sbyte newValue1 = currentPermute[0] = currentPermute[1];

						for (int j = 0; ++j < i;)
							currentPermute[j] = currentPermute[j + 1];

						currentPermute[i] = value;
						value = newValue1;
					}
				}
			}


			// Output the results to stdout.
			Console.Out.WriteLineAsync($"{checksum}\nPfannkuchen({n}) = {maxFlipCount}\n");

		}
	}
}
