/* The Computer Language Benchmarks Game
   https://salsa.debian.org/benchmarksgame-team/benchmarksgame/
 *
 * Port of the Java port that uses native GMP to use native GMP with C#
 * contributed by Miguel de Icaza, based on the Java version, that was:
 * 	contributed by Mike Pall
 * 	java port by Stefan Krause
*/
using System;
using System.Text;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

[StructLayout(LayoutKind.Sequential)]
public struct PiDigits : IDisposable
{
	GmpInteger q;
	GmpInteger r;
	GmpInteger s;
	GmpInteger t;
	GmpInteger u;
	GmpInteger v;
	GmpInteger w;

	int i;
	int n;
	StringBuilder strBuf;

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	PiDigits(int initN)
	{
		q = new GmpInteger(1);
		r = new GmpInteger();
		s = new GmpInteger();
		t = new GmpInteger(1);
		u = new GmpInteger();
		v = new GmpInteger();
		w = new GmpInteger();
		strBuf = new StringBuilder(40);
		i = 0;
		n = initN;
	}


	public void Dispose()
	{
		q.Dispose();
		r.Dispose();
		s.Dispose();
		t.Dispose();
		u.Dispose();
		v.Dispose();
		w.Dispose();
	}

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	private void ComposeRight(int bq, int br, int bs, int bt)
	{
		u.Multiply(r, bs);
		r.Multiply(r, bq);
		v.Multiply(t, br);
		r.Add(r, v);
		t.Multiply(t, bt);
		t.Add(t, u);
		s.Multiply(s, bt);
		u.Multiply(q, bs);
		s.Add(s, u);
		q.Multiply(q, bq);
	}

	/* Compose matrix with numbers on the left. */
	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	private void ComposeLeft(int bq, int br, int bs, int bt)
	{
		r.Multiply(r, bt);
		u.Multiply(q, br);
		r.Add(r, u);
		u.Multiply(t, bs);
		t.Multiply(t, bt);
		v.Multiply(s, br);
		t.Add(t, v);
		s.Multiply(s, bq);
		s.Add(s, u);
		q.Multiply(q, bq);
	}

	/* Extract one digit. */
	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	private int ExtractPiDigit(int j)
	{
		u.Multiply(q, j);
		u.Add(u, r);
		v.Multiply(s, j);
		v.Add(v, t);
		w.Divide(u, v);
		return w.ToInt64Value();
	}

	/* Print one digit. Returns 1 for the last digit. */
	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	private bool PrintDigit(int y)
	{
		strBuf.Append(y);
		if (++i % 10 == 0 || i == n)
		{
			if (i % 10 != 0) for (int j = 10 - (i % 10); j > 0; j--) { strBuf.Append(" "); }
			strBuf.Append("\t:");
			strBuf.Append(i);
			Console.WriteLine(strBuf);
			strBuf = new StringBuilder(40);
		}
		return i == n;
	}

	/* Generate successive digits of PI. */
	void Run()
	{
		int k = 1;
		i = 0;
		for (; ; )
		{
			int y = ExtractPiDigit(3);
			if (y == ExtractPiDigit(4))
			{
				if (PrintDigit(y)) return;
				ComposeRight(10, -10 * y, 0, 1);
			}
			else
			{
				ComposeLeft(k, 4 * k + 2, 0, 2 * k + 1);
				k++;
			}
		}
	}

	public static void Main(String[] args)
	{
		if (GC.TryStartNoGCRegion(1 * 1024 * 1024))
		{
			PiDigits m = new PiDigits(Int32.Parse(args[0]));
			m.Run();
			GC.EndNoGCRegion();
		}

	}
}


[StructLayout(LayoutKind.Sequential)]
internal struct GmpInteger : IDisposable
{
	IntPtr pointer;

	//public static readonly int MpzSize = sizeof(int) * 2 + IntPtr.Size;

	public GmpInteger(int value)
	{
		pointer = Marshal.AllocHGlobal(8);
		mpz_init_set_si(pointer, value);
	}

	public void Dispose()
	{
		mpz_clear(pointer);
		Marshal.FreeHGlobal(pointer);
	}

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	public void Set(int value) { mpz_set_si(pointer, value); }

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	public void Multiply(GmpInteger src, int val) { mpz_mul_si(pointer, src.pointer, val); }

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	public void Add(GmpInteger op1, GmpInteger op2) { mpz_add(pointer, op1.pointer, op2.pointer); }

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	public void Divide(GmpInteger op1, GmpInteger op2) { mpz_tdiv_q(pointer, op1.pointer, op2.pointer); }

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	public int ToInt64Value() { return mpz_get_si(pointer); }

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	public double ToDoubleValue() { return mpz_get_d(pointer); }

	// Non public stuff

	[DllImport("gmp", EntryPoint = "__gmpz_init")]
	extern static void mpz_init(IntPtr value);

	[DllImport("gmp", EntryPoint = "__gmpz_init_set_si")]
	extern static void mpz_init_set_si(IntPtr mpzPointer, int value);

	[DllImport("gmp", EntryPoint = "__gmpz_clear")]
	extern static void mpz_clear(IntPtr value);

	[DllImport("gmp", EntryPoint = "__gmpz_mul_si")]
	extern static void mpz_mul_si(IntPtr dest, IntPtr src, int val);

	[DllImport("gmp", EntryPoint = "__gmpz_add")]
	extern static void mpz_add(IntPtr dest, IntPtr src, IntPtr src2);

	[DllImport("gmp", EntryPoint = "__gmpz_tdiv_q")]
	extern static void mpz_tdiv_q(IntPtr dest, IntPtr src, IntPtr src2);

	[DllImport("gmp", EntryPoint = "__gmpz_set_si")]
	extern static void mpz_set_si(IntPtr src, int value);

	[DllImport("gmp", EntryPoint = "__gmpz_get_si")]
	extern static int mpz_get_si(IntPtr src);

	[DllImport("gmp", EntryPoint = "__gmpz_get_d")]
	extern static double mpz_get_d(IntPtr src);
}
