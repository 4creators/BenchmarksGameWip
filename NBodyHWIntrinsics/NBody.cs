using System;
using System.Diagnostics;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;
using System.Threading.Tasks;

namespace NBodyHWIntrinsics
{
    [StructLayout(LayoutKind.Explicit)]
    public unsafe struct NBody
    {
        private const int Length      = 8;
        private const int XOffset     = 0;
        private const int YOffset     = 1 * Length * sizeof(double);
        private const int ZOffset     = 2 * Length * sizeof(double);
        private const int VXOffset    = 3 * Length * sizeof(double);
        private const int VYOffset    = 4 * Length * sizeof(double);
        private const int VZOffset    = 5 * Length * sizeof(double);
        private const int MOffset     = 6 * Length * sizeof(double);
        private const int XPtrOffset  = 7 * Length * sizeof(double);
        private const int YPtrOffset  = XPtrOffset + sizeof(double);
        private const int ZPtrOffset  = YPtrOffset + sizeof(double);
        private const int VxPtrOffset = ZPtrOffset + sizeof(double);
        private const int VyPtrOffset = VxPtrOffset + sizeof(double);
        private const int VzPtrOffset = VyPtrOffset + sizeof(double);
        private const int MPtrOffset  = VzPtrOffset + sizeof(double);

        public const int NBodySize = MPtrOffset + 8;

        private const double Pi = 3.141592653589793;
        private const double Solarmass = 4 * Pi * Pi;
        private const double DaysPerYear = 365.24;

        private static readonly string format = "0,0";

        [FieldOffset(XOffset)]
        public fixed double x[Length];

        [FieldOffset(YOffset)]
        public fixed double y[Length];

        [FieldOffset(ZOffset)]
        public fixed double z[Length];

        [FieldOffset(VXOffset)]
        public fixed double vx[Length];

        [FieldOffset(VYOffset)]
        public fixed double vy[Length];

        [FieldOffset(VZOffset)]
        public fixed double vz[Length];

        [FieldOffset(MOffset)]
        public fixed double m[Length];

        [FieldOffset(XPtrOffset)]
        public double* XPtr;

        [FieldOffset(YPtrOffset)]
        public double* YPtr;

        [FieldOffset(ZPtrOffset)]
        public double* ZPtr;

        [FieldOffset(VxPtrOffset)]
        public double* VxPtr;

        [FieldOffset(VyPtrOffset)]
        public double* VyPtr;

        [FieldOffset(VzPtrOffset)]
        public double* VzPtr;

        [FieldOffset(MPtrOffset)]
        public double* MPtr;

        public static void Main(string[] args)
        {
            var stopWatch = Stopwatch.StartNew();
#if FEATURE_TIMING
            Console.WriteLine($"Running on .NETCoreApp: {GetNetCoreVersion()}");
            long ticks = Stopwatch.GetTimestamp();
#endif
            NBody* nBodyPtr = stackalloc NBody[1];
#if FEATURE_TIMING

            var stopWatch = Stopwatch.StartNew();

            stopWatch.Restart();
#endif

            nBodyPtr->Initialize(nBodyPtr);

#if FEATURE_TIMING
            stopWatch.Stop();
            Console.WriteLine($"Elapsed Initialize: {stopWatch.ElapsedTicks.ToString(format)}");

            stopWatch.Restart();
#endif

            Console.Out.WriteLineAsync(nBodyPtr->Energy().ToString("F9"));

#if FEATURE_TIMING
            stopWatch.Stop();
            Console.WriteLine($"Elapsed Enenrgy origin: {stopWatch.ElapsedTicks.ToString(format)}");
#endif

            int iterations = args.Length > 0 ? Int32.Parse(args[0]) : 50000000;

#if FEATURE_TIMING
            stopWatch.Restart();
#endif
            while (iterations-- > 0)
            {
                nBodyPtr->Advance();
            }

#if FEATURE_TIMING

            stopWatch.Stop();
            Console.WriteLine($"Elapsed Advance: {stopWatch.ElapsedTicks.ToString(format)}");

            stopWatch.Restart();
#endif

            Console.Out.WriteLine(nBodyPtr->Energy().ToString("F9"));

#if FEATURE_TIMING
            stopWatch.Stop();
            Console.WriteLine($"Elapsed Enenrgy target: {stopWatch.ElapsedTicks.ToString(format)}");


            long endTicks = Stopwatch.GetTimestamp();
            Console.WriteLine($"Elapsed total time: {(endTicks - ticks).ToString(format)}");
#endif
            stopWatch.Stop();
            Console.WriteLine($"NBodyHWIntrinsics C# Elapsed Time: {stopWatch.Elapsed}");
        }

        public void Initialize(NBody* ptr)
        {
            // Align fixed Array to 16 bytes
            ulong alignOffset = (ulong)ptr % 16;
            ulong dataAddr = alignOffset == 0 ? (ulong)ptr : (ulong)ptr + (16 - alignOffset);
            double* dataPtr = (double*)(dataAddr);

            XPtr = dataPtr;
            YPtr = (double*)(dataAddr + YOffset);
            ZPtr = (double*)(dataAddr + ZOffset);
            VxPtr = (double*)(dataAddr + VXOffset);
            VyPtr = (double*)(dataAddr + VYOffset);
            VzPtr = (double*)(dataAddr + VZOffset);
            MPtr = (double*)(dataAddr + MOffset);

            XPtr[2] = 4.84143144246472090e+00;
            XPtr[3] = 8.34336671824457987e+00;
            XPtr[4] = 1.28943695621391310e+01;
            XPtr[5] = 1.53796971148509165e+01;

            YPtr[2] = -1.16032004402742839e+00;
            YPtr[3] = 4.12479856412430479e+00;
            YPtr[4] = -1.51111514016986312e+01;
            YPtr[5] = -2.59193146099879641e+01;

            ZPtr[2] = -1.03622044471123109e-01;
            ZPtr[3] = -4.03523417114321381e-01;
            ZPtr[4] = -2.23307578892655734e-01;
            ZPtr[5] = 1.79258772950371181e-01;

            VxPtr[2] = 1.66007664274403694e-03;
            VxPtr[3] = -2.76742510726862411e-03;
            VxPtr[4] = 2.96460137564761618e-03;
            VxPtr[5] = 2.68067772490389322e-03;

            VyPtr[2] = 7.69901118419740425e-03;
            VyPtr[3] = 4.99852801234917238e-03;
            VyPtr[4] = 2.37847173959480950e-03;
            VyPtr[5] = 1.62824170038242295e-03;

            VzPtr[2] = -6.90460016972063023e-05;
            VzPtr[3] = 2.30417297573763929e-05;
            VzPtr[4] = -2.96589568540237556e-05;
            VzPtr[5] = -9.51592254519715870e-05;

            MPtr[0] = Solarmass;

            if (Sse3.IsSupported)
            {

                Vector128<double> vx = Sse2.SetZeroVector128<double>();
                Vector128<double> vy = Sse2.SetZeroVector128<double>();
                Vector128<double> vz = Sse2.SetZeroVector128<double>();
                Vector128<double> yearInDays = Sse2.SetAllVector128(DaysPerYear);
                Vector128<double> mSol = Sse2.SetAllVector128(Solarmass);

                double* mInitData = stackalloc double[] { 9.54791938424326609e-04, 2.85885980666130812e-04, 4.36624404335156298e-05, 5.15138902046611451e-05 };

                for (int i = 2; i < 6; i += 2)
                {
                    Vector128<double> vxV = Sse2.LoadAlignedVector128(VxPtr + i);
                    Vector128<double> vyV = Sse2.LoadAlignedVector128(VyPtr + i);
                    Vector128<double> vzV = Sse2.LoadAlignedVector128(VzPtr + i);

                    // Initialize v(xyz) vectors
                    vxV = Sse2.Multiply(vxV, yearInDays);
                    vyV = Sse2.Multiply(vyV, yearInDays);
                    vzV = Sse2.Multiply(vzV, yearInDays);

                    // Initialize mV vector
                    Vector128<double> mV = Unsafe.Read<Vector128<double>>(mInitData + i - 2);
                    mV = Sse2.Multiply(mV, mSol);

                    // Try to use RM second op overload
                    vx = Sse2.Add(vx, Sse2.Multiply(mV, vxV));
                    vy = Sse2.Add(vy, Sse2.Multiply(mV, vyV));
                    vz = Sse2.Add(vz, Sse2.Multiply(mV, vzV));

                    // Save mV vector
                    Unsafe.Write(MPtr + i, mV);

                    // Save initialized v(xyz) vectors
                    Sse2.StoreAligned(VxPtr + i, vxV);
                    Sse2.StoreAligned(VyPtr + i, vyV);
                    Sse2.StoreAligned(VzPtr + i, vzV);

                }

                vx = Sse3.HorizontalAdd(vx, vy);
                vx = Sse2.Divide(vx, mSol);
                vz = Sse3.HorizontalAdd(vz, vz);
                vz = Sse2.Divide(vz, mSol);

                VxPtr[0] = Sse2.ConvertToDouble(vx);
                vx = Sse.StaticCast<byte, double>(Sse2.ShiftRightLogical128BitLane(Sse.StaticCast<double, byte>(vx), 8));
                VyPtr[0] = Sse2.ConvertToDouble(vx);
                VzPtr[0] = Sse2.ConvertToDouble(vz);
            }
        }

        public static string GetNetCoreVersion()
        {
            var assembly = typeof(System.Runtime.GCSettings).GetTypeInfo().Assembly;
            var assemblyPath = assembly.CodeBase.Split(new[] { '/', '\\' }, StringSplitOptions.RemoveEmptyEntries);
            int netCoreAppIndex = Array.IndexOf(assemblyPath, "Microsoft.NETCore.App");
            if (netCoreAppIndex > 0 && netCoreAppIndex < assemblyPath.Length - 2)
                return assemblyPath[netCoreAppIndex + 1];
            return null;
        }

        public double Energy()
        {
            double result = 0.0;
            double*
                xPtr  = XPtr,
                yPtr  = YPtr,
                zPtr  = ZPtr,
                vxPtr = VxPtr,
                vyPtr = VyPtr,
                vzPtr = VzPtr,
                mPtr  = MPtr;

            var resultV = Sse2.SetZeroVector128<double>();
            var div2V = Sse2.SetAllVector128(0.5);

            // Calls for optimization - use intstruction level parallelizm
            for (int i = 0, k = 2; i < 6; i += 2, mPtr += 2, vxPtr += 2, vyPtr+= 2, vzPtr+= 2, xPtr+= 2, yPtr+= 2, zPtr+= 2)
            {
                var mV = Sse2.LoadAlignedVector128(mPtr);
                var vxV = Sse2.LoadAlignedVector128(vxPtr);
                var vyV = Sse2.LoadAlignedVector128(vyPtr);
                var vzV = Sse2.LoadAlignedVector128(vzPtr);

                vxV = Sse2.Multiply(vxV, vxV);
                vyV = Sse2.Multiply(vyV, vyV);
                vzV = Sse2.Multiply(vzV, vzV);

                vxV = Sse2.Add(vxV, vyV);
                vxV = Sse2.Add(vxV, vzV);

                vxV = Sse2.Multiply(vxV, mV);
                vxV = Sse2.Multiply(div2V, vxV);
                resultV = Sse2.Add(resultV, vxV);

                var xV = Sse2.LoadAlignedVector128(xPtr);
                var yV = Sse2.LoadAlignedVector128(yPtr);
                var zV = Sse2.LoadAlignedVector128(zPtr);

                for (int z = 0; z < 2; z++, k++)
                {
                    if (z == 1 && k == 3)
                    {
                        break;
                    }

                    if (z == 0)
                    {
                        vxV = Sse2.UnpackLow(mV, mV);
                    }
                    else
                    {
                        vxV = Sse2.UnpackHigh(mV, mV);
                    }

                    resultV = EnergyInner(resultV, k, vxV, xV, yV, zV);
                }
            }

            resultV = Sse3.HorizontalAdd(resultV, resultV);
            result = Sse2.ConvertToDouble(resultV);

            return result;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public Vector128<double> EnergyInner(Vector128<double> resultV, int k, Vector128<double> mV, Vector128<double> xV, Vector128<double> yV, Vector128<double> zV)
        {
            // Calls for optimization - use intstruction level parallelizm
            for (int j = k; j < 6; j += 2)
            {
                var mLow = Sse2.LoadVector128(MPtr + j);
                var xLow = Sse2.LoadVector128(XPtr + j);
                var yLow = Sse2.LoadVector128(YPtr + j);
                var zLow = Sse2.LoadVector128(ZPtr + j);

                xLow = Sse2.Subtract(xV, xLow);
                yLow = Sse2.Subtract(yV, yLow);
                zLow = Sse2.Subtract(zV, zLow);

                mLow = Sse2.Multiply(mLow, mV);
                xLow = Sse2.Multiply(xLow, xLow);
                yLow = Sse2.Multiply(yLow, yLow);
                zLow = Sse2.Multiply(zLow, zLow);
                xLow = Sse2.Add(xLow, yLow);
                xLow = Sse2.Add(zLow, xLow);

                // Avoid very expensive Sqrt and Divide by replacing
                // them with ReciprocalSqrt and Multiplication. Use custom
                // double rsqrt implementation - intrinsics are missing double rsqrt
                // Custom rsqrt - 12.38 CPI, mul 0.5 / 1.0 CPI
                // Sse2 sqrt - 14 CPI, div 14.0 CPI (much faster on Broadwell / Skylake)
                // Instruction level parallelizm cannot be exploited:
                // latencies are always in range: div 14 - 20, sqrt 18 - 20
                yLow = ReciprocalSqrt(xLow);
                mLow = Sse2.Multiply(mLow, yLow);

                // Eliminate end of loop last column for j == 5
                // otherwise Solar data are computed multiple times
                if (j != 5)
                {
                    resultV = Sse2.Subtract(resultV, mLow);
                }
                else
                {
                    var e = Sse2.ConvertToDouble(mLow);
                    resultV = Sse2.Subtract(resultV, Sse2.SetVector128(e, 0));
                }
            }

            return resultV;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void Advance(double distance = 0.01d)
        {
            Vector128<double> disV = Sse2.SetAllVector128(distance);

            double*
                    xPtr = XPtr,
                    yPtr = YPtr,
                    zPtr = ZPtr,
                    vxPtr = VxPtr,
                    vyPtr = VyPtr,
                    vzPtr = VzPtr,
                    mPtr = MPtr;

            for (int i = 0, k = 2; i < 6; i++, k++, mPtr++, vxPtr++, vyPtr++, vzPtr++, xPtr++, yPtr++, zPtr++)
            {
                var mV = Sse3.LoadAndDuplicateToVector128(mPtr);
                var xV = Sse3.LoadAndDuplicateToVector128(xPtr);
                var yV = Sse3.LoadAndDuplicateToVector128(yPtr);
                var zV = Sse3.LoadAndDuplicateToVector128(zPtr);
                var vxV = Sse3.LoadAndDuplicateToVector128(vxPtr);
                var vyV = Sse3.LoadAndDuplicateToVector128(vyPtr);
                var vzV = Sse3.LoadAndDuplicateToVector128(vzPtr);

                for (int j = (k - k % 2); j < 6; j += 2)
                {
                    var xxV = Sse2.LoadAlignedVector128(XPtr + j);
                    var yyV = Sse2.LoadAlignedVector128(YPtr + j);
                    var zzV = Sse2.LoadAlignedVector128(ZPtr + j);

                    xxV = Sse2.Multiply(xxV, xV);
                    yyV = Sse2.Multiply(yyV, yV);
                    zzV = Sse2.Multiply(zzV, zV);

                    var mag = Get2D(xxV, yyV, zzV);
                    mag = Sse2.Multiply(Reciprocal(mag), ReciprocalSqrt(mag));
                    mag = Sse2.Multiply(mag, disV);

                    var imag = Sse2.Multiply(mV, mag);
                    Sse2.StoreAligned(VxPtr + j, Sse2.Subtract(Sse2.LoadAlignedVector128(VxPtr + j), Sse2.Multiply(imag, xxV)));
                    Sse2.StoreAligned(VyPtr + j, Sse2.Subtract(Sse2.LoadAlignedVector128(VyPtr + j), Sse2.Multiply(imag, yyV)));
                    Sse2.StoreAligned(VzPtr + j, Sse2.Subtract(Sse2.LoadAlignedVector128(VzPtr + j), Sse2.Multiply(imag, zzV)));

                    var jmag = Sse2.Multiply(Sse2.LoadAlignedVector128(MPtr + j), mag);
                    vxV = Sse2.Add(vxV, Sse2.Multiply(jmag, xxV));
                    vyV = Sse2.Add(vyV, Sse2.Multiply(jmag, yyV));
                    vzV = Sse2.Add(vzV, Sse2.Multiply(jmag, zzV));
                } // inner loop

                Sse2.StoreScalar(vxPtr, Sse3.HorizontalAdd(vxV, vxV));
                Sse2.StoreScalar(vxPtr, Sse3.HorizontalAdd(vxV, vxV));
                Sse2.StoreScalar(vxPtr, Sse3.HorizontalAdd(vxV, vxV));

                xV = Sse2.Add(xV, Sse2.Multiply(vxV, disV));
                yV = Sse2.Add(yV, Sse2.Multiply(vyV, disV));
                zV = Sse2.Add(zV, Sse2.Multiply(vzV, disV));

                Sse2.StoreScalar(xPtr, Sse3.HorizontalAdd(xV, xV));
                Sse2.StoreScalar(yPtr, Sse3.HorizontalAdd(yV, yV));
                Sse2.StoreScalar(zPtr, Sse3.HorizontalAdd(zV, zV));

                if (i == 0)
                {
                    i++;
                }

            } // outer loop

            //*(xPtr - 1) += (*(vxPtr - 1) * distance);
            //*(yPtr - 1) += (*(vyPtr - 1) * distance);
            //*(zPtr - 1) += (*(vzPtr - 1) * distance);

        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void AdvanceStatic(NBody* nBodyPtr, double distance = 0.01d)
        {
            Vector128<double> disV = Sse2.SetAllVector128(distance);

            double*
                    xPtr = nBodyPtr->XPtr,
                    yPtr = nBodyPtr->YPtr,
                    zPtr = nBodyPtr->ZPtr,
                    vxPtr = nBodyPtr->VxPtr,
                    vyPtr = nBodyPtr->VyPtr,
                    vzPtr = nBodyPtr->VzPtr,
                    mPtr = nBodyPtr->MPtr;

            double*
                    gxPtr = nBodyPtr->XPtr,
                    gyPtr = nBodyPtr->YPtr,
                    gzPtr = nBodyPtr->ZPtr,
                    gvxPtr = nBodyPtr->VxPtr,
                    gvyPtr = nBodyPtr->VyPtr,
                    gvzPtr = nBodyPtr->VzPtr,
                    gmPtr = nBodyPtr->MPtr;

            for (int i = 0, k = 2; i < 6; i++, k++, mPtr++, vxPtr++, vyPtr++, vzPtr++, xPtr++, yPtr++, zPtr++)
            {
                var mV = Sse3.LoadAndDuplicateToVector128(mPtr);
                var xV = Sse3.LoadAndDuplicateToVector128(xPtr);
                var yV = Sse3.LoadAndDuplicateToVector128(yPtr);
                var zV = Sse3.LoadAndDuplicateToVector128(zPtr);
                var vxV = Sse3.LoadAndDuplicateToVector128(vxPtr);
                var vyV = Sse3.LoadAndDuplicateToVector128(vyPtr);
                var vzV = Sse3.LoadAndDuplicateToVector128(vzPtr);

                for (int j = (k - k % 2); j < 6; j += 2)
                {
                    var xxV = Sse2.LoadAlignedVector128(gxPtr + j);
                    var yyV = Sse2.LoadAlignedVector128(gyPtr + j);
                    var zzV = Sse2.LoadAlignedVector128(gzPtr + j);

                    xxV = Sse2.Multiply(xxV, xV);
                    yyV = Sse2.Multiply(yyV, yV);
                    zzV = Sse2.Multiply(zzV, zV);

                    var mag = Get2D(xxV, yyV, zzV);
                    mag = Sse2.Multiply(Reciprocal(mag), ReciprocalSqrt(mag));
                    mag = Sse2.Multiply(mag, disV);

                    var imag = Sse2.Multiply(mV, mag);
                    Sse2.StoreAligned(gvxPtr + j, Sse2.Subtract(Sse2.LoadAlignedVector128(gvxPtr + j), Sse2.Multiply(imag, xxV)));
                    Sse2.StoreAligned(gvyPtr + j, Sse2.Subtract(Sse2.LoadAlignedVector128(gvyPtr + j), Sse2.Multiply(imag, yyV)));
                    Sse2.StoreAligned(gvzPtr + j, Sse2.Subtract(Sse2.LoadAlignedVector128(gvzPtr + j), Sse2.Multiply(imag, zzV)));

                    var jmag = Sse2.Multiply(Sse2.LoadAlignedVector128(gmPtr + j), mag);
                    vxV = Sse2.Add(vxV, Sse2.Multiply(jmag, xxV));
                    vyV = Sse2.Add(vyV, Sse2.Multiply(jmag, yyV));
                    vzV = Sse2.Add(vzV, Sse2.Multiply(jmag, zzV));
                } // inner loop

                Sse2.StoreScalar(vxPtr, Sse3.HorizontalAdd(vxV, vxV));
                Sse2.StoreScalar(vxPtr, Sse3.HorizontalAdd(vxV, vxV));
                Sse2.StoreScalar(vxPtr, Sse3.HorizontalAdd(vxV, vxV));

                xV = Sse2.Add(xV, Sse2.Multiply(vxV, disV));
                yV = Sse2.Add(yV, Sse2.Multiply(vyV, disV));
                zV = Sse2.Add(zV, Sse2.Multiply(vzV, disV));

                Sse2.StoreScalar(xPtr, Sse3.HorizontalAdd(xV, xV));
                Sse2.StoreScalar(yPtr, Sse3.HorizontalAdd(yV, yV));
                Sse2.StoreScalar(zPtr, Sse3.HorizontalAdd(zV, zV));

                if (i == 0)
                {
                    i++;
                }

            } // outer loop

            //*(xPtr - 1) += (*(vxPtr - 1) * distance);
            //*(yPtr - 1) += (*(vyPtr - 1) * distance);
            //*(zPtr - 1) += (*(vzPtr - 1) * distance);

        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static Vector128<double> Get2D(Vector128<double> dx, Vector128<double> dy, Vector128<double> dz)
        {
            dx = Sse2.Multiply(dx, dx);
            dy = Sse2.Multiply(dy, dy);
            dz = Sse2.Multiply(dz, dz);
            dx = Sse2.Add(dx, dy);
            dz = Sse2.Add(dx, dz);
            return dz;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static Vector128<double> Reciprocal(Vector128<double> value)
        {
            // Implementation of Reciprocal double based on
            // https://github.com/stgatilov/recip_rsqrt_benchmark/blob/4db33061300455585b092eacf0c824ddaaee0da9/routines_sse.h#L121
            // error = 8.33416e-015
            var one = Sse2.SetAllVector128(1.0);
            var x = Sse2.ConvertToVector128Double(Sse.Reciprocal(Sse2.ConvertToVector128Single(value)));
            var r = Sse2.Subtract(one, Sse2.Multiply(value, x));
            var r2 = Sse2.Multiply(r, r);
            var r1 = Sse2.Add(one, r);
            var r21 = Sse2.Add(one, r2);
            var poly = Sse2.Multiply(r1, r21);
            var result = Sse2.Multiply(poly, x);

            return result;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static Vector128<double> ReciprocalSqrt(Vector128<double> value)
        {
            // Implementation of ReciprocalSqrt double based on
            // https://github.com/stgatilov/recip_rsqrt_benchmark/blob/4db33061300455585b092eacf0c824ddaaee0da9/routines_sse.h#L159
            // error = 4.95501e-014
            var one = Sse2.SetAllVector128(1.0);
            var c1 = Sse2.SetAllVector128(0.5);
            var c2 = Sse2.SetAllVector128(3.0 / 8.0);
            var c3 = Sse2.SetAllVector128(15.0 / 48.0);
            var x = Sse2.ConvertToVector128Double(Sse.ReciprocalSqrt(Sse2.ConvertToVector128Single(value)));
            var r = Sse2.Subtract(one, Sse2.Multiply(Sse2.Multiply(value, x), x));
            var r2 = Sse2.Multiply(r, r);
            var t1 = Sse2.Add(Sse2.Multiply(c2, r), c1);
            var poly = Sse2.Add(Sse2.Multiply(r2, c3), t1);
            var result = Sse2.Add(Sse2.Multiply(Sse2.Multiply(x, r), poly), x);

            return result;
        }
    }
}
