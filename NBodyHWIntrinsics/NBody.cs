using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;

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

        private const double Pi = 3.141592653589793;
        private const double Solarmass = 4 * Pi * Pi;
        private const double DaysPerYear = 365.24;

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
            NBody nBody = new NBody();
            NBody* nBodyPtr = (NBody*)nBody.x;
            nBody.Initialize(nBodyPtr);

            Console.Out.WriteLineAsync(nBody.Energy().ToString("F9"));

            int iterations = args.Length > 0 ? Int32.Parse(args[0]) : 50000000;

            while(iterations-- > 0)
            {
                nBody.Advance();
            }

            Console.Out.WriteLineAsync(nBody.Energy().ToString("F9"));
        }

        private void Initialize(NBody* nbodyPtr)
        {
            // Align fixed Array to 16 bytes
            ulong alignOffset = (ulong)nbodyPtr % 16;
            ulong dataAddr = alignOffset == 0 ? (ulong)nbodyPtr : (ulong)nbodyPtr + (16 - alignOffset);
            double* dataPtr = (double*)(dataAddr);

            XPtr  = dataPtr;
            YPtr  = (double*)(dataAddr + YOffset);
            ZPtr  = (double*)(dataAddr + ZOffset);
            VxPtr = (double*)(dataAddr + VXOffset);
            VyPtr = (double*)(dataAddr + VYOffset);
            VzPtr = (double*)(dataAddr + VZOffset);
            MPtr  = (double*)(dataAddr + MOffset);

            XPtr[0] = 4.84143144246472090e+00;
            XPtr[1] = 8.34336671824457987e+00;
            XPtr[2] = 1.28943695621391310e+01;
            XPtr[3] = 1.53796971148509165e+01;

            YPtr[0] = -1.16032004402742839e+00;
            YPtr[1] =  4.12479856412430479e+00;
            YPtr[2] = -1.51111514016986312e+01;
            YPtr[3] = -2.59193146099879641e+01;

            ZPtr[0] = -1.03622044471123109e-01;
            ZPtr[1] = -4.03523417114321381e-01;
            ZPtr[2] = -2.23307578892655734e-01;
            ZPtr[3] =  1.79258772950371181e-01;

            VxPtr[0] = 1.66007664274403694e-03;
            VxPtr[1] = -2.76742510726862411e-03;
            VxPtr[2] = 2.96460137564761618e-03;
            VxPtr[3] = 2.68067772490389322e-03;

            VyPtr[0] = 7.69901118419740425e-03;
            VyPtr[1] = 4.99852801234917238e-03;
            VyPtr[2] = 2.37847173959480950e-03;
            VyPtr[3] = 1.62824170038242295e-03;

            VzPtr[0] = -6.90460016972063023e-05;
            VzPtr[1] = 2.30417297573763929e-05;
            VzPtr[2] = -2.96589568540237556e-05;
            VzPtr[3] = -9.51592254519715870e-05;

            MPtr[4] = Solarmass;

            if (Sse3.IsSupported)
            {

                Vector128<double> vx = Sse2.SetZeroVector128<double>();
                Vector128<double> vy = Sse2.SetZeroVector128<double>();
                Vector128<double> vz = Sse2.SetZeroVector128<double>();
                Vector128<double> yearInDays = Sse2.SetAllVector128(DaysPerYear);
                Vector128<double> mSol = Sse2.SetAllVector128(Solarmass);

                double* mInitData = stackalloc double[] { 9.54791938424326609e-04, 2.85885980666130812e-04, 4.36624404335156298e-05, 5.15138902046611451e-05 };

                for (int i = 0; i < 4; i += 2)
                {
                    Vector128<double> vxV = Unsafe.Read<Vector128<double>>(VxPtr + i);
                    Vector128<double> vyV = Unsafe.Read<Vector128<double>>(VyPtr + i);
                    Vector128<double> vzV = Unsafe.Read<Vector128<double>>(VzPtr + i);

                    // Initialize v(xyz) vectors
                    vxV = Sse2.Multiply(vxV, yearInDays);
                    vyV = Sse2.Multiply(vyV, yearInDays);
                    vzV = Sse2.Multiply(vzV, yearInDays);

                    // Save initialized v(xyz) vectors
                    Unsafe.Write(VxPtr + i, vxV);
                    Unsafe.Write(VyPtr + i, vyV);
                    Unsafe.Write(VzPtr + i, vzV);

                    // Initialize and save m vector
                    Vector128<double> mV = Unsafe.Read<Vector128<double>>(mInitData + i);
                    mV = Sse2.Multiply(mV, mSol);
                    Unsafe.Write(MPtr + i, mV);

                    // Try to use RM second op overload
                    var vxmV = Sse2.Multiply(mV, vxV);
                    var vymV = Sse2.Multiply(mV, vyV);
                    var vzmV = Sse2.Multiply(mV, vzV);

                    vx = Sse2.Add(vx, vxmV);
                    vy = Sse2.Add(vy, vymV);
                    vz = Sse2.Add(vz, vzmV);
                }

                vx = Sse3.HorizontalAdd(vx, vy);
                vx = Sse2.Divide(vx, mSol);
                vz = Sse3.HorizontalAdd(vz, vz);
                vz = Sse2.Divide(vz, mSol);

                VxPtr[4] = Sse2.ConvertToDouble(vx);
                vx = Sse.StaticCast<byte, double>(Sse2.ShiftRightLogical128BitLane(Sse.StaticCast<double, byte>(vx), 8));
                VyPtr[4] = Sse2.ConvertToDouble(vx);
                VzPtr[4] = Sse2.ConvertToDouble(vz);
            }
        }

        private double Energy()
        {
            double result = 0.0;
            double*
                xPtr  = XPtr + 4,
                yPtr  = YPtr + 4,
                zPtr  = ZPtr + 4,
                vxPtr = VxPtr + 4,
                vyPtr = VyPtr + 4,
                vzPtr = VzPtr + 4,
                mPtr  = MPtr + 4;

            var resultV = Sse2.SetZeroVector128<double>();
            var div2V = Sse2.SetAllVector128(0.5);

            for (int i = 5, k = 0; i == 5 || i < 4; i += 2, mPtr += 2, vxPtr += 2, vyPtr+= 2, vzPtr+= 2, xPtr+= 2, yPtr+= 2, zPtr+= 2)
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
                    if (z == 0)
                    {
                        vxV = Sse2.UnpackLow(mV, mV);
                    }
                    else
                    {
                        vxV = Sse2.UnpackHigh(mV, mV);
                    }

                    resultV = EnergyInner(resultV, k, vxV, xV, yV, zV);
                    if (i == 5) break;
                }


                if (i == 5)
                {
                    xPtr = XPtr - 2;
                    yPtr = YPtr - 2;
                    zPtr = ZPtr - 2;
                    vxPtr = VxPtr - 2;
                    vyPtr = VyPtr - 2;
                    vzPtr = VzPtr - 2;
                    mPtr = MPtr - 2;
                    i = -2;
                    k++;
                }
            }

            resultV = Sse3.HorizontalAdd(resultV, resultV);
            result = Sse2.ConvertToDouble(resultV);

            return result;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private Vector128<double> EnergyInner(Vector128<double> resultV, int k, Vector128<double> mV, Vector128<double> xV, Vector128<double> yV, Vector128<double> zV)
        {
            for (int j = k; j < 4; j += 2)
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

                // Eliminate end of loop last column for j == 3
                // otherwise Solar data are computed multiple times
                if (j != 3)
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
        private void Advance(double distance = 0.01d)
        {
            //unchecked
            //{
            //    for (NBody* bi = ptrSun; bi < ptrEnd; ++bi)
            //    {

            //        // Dereference common variables now so they're likely to
            //        // get stored in registers. The performance advantage is
            //        // lost if pointers are dereferenced every time. Accounts for ~7%.

            //        double
            //            ix = bi->x,
            //            iy = bi->y,
            //            iz = bi->z,
            //            ivx = bi->vx,
            //            ivy = bi->vy,
            //            ivz = bi->vz,
            //            imass = bi->mass;
            //        for (NBody* bj = bi + 1; bj <= ptrEnd; ++bj)
            //        {
            //            double
            //                dx = bj->x - ix,
            //                dy = bj->y - iy,
            //                dz = bj->z - iz,
            //                jmass = bj->mass,
            //                var dd = GetD2(dx, dy, dz);
            //                var drs = ReciprocalSqrt(dd);
            //                mag = distance * drs / dd ; // check how expensive is recirpocal dd

            //            bj->vx = bj->vx - dx * imass * mag;
            //            bj->vy = bj->vy - dy * imass * mag;
            //            bj->vz = bj->vz - dz * imass * mag;
            //            ivx = ivx + dx * jmass * mag;
            //            ivy = ivy + dy * jmass * mag;
            //            ivz = ivz + dz * jmass * mag;
            //        }
            //        bi->vx = ivx;
            //        bi->vy = ivy;
            //        bi->vz = ivz;
            //        bi->x = ix + ivx * distance;
            //        bi->y = iy + ivy * distance;
            //        bi->z = iz + ivz * distance;
            //    }
            //    ptrEnd->x = ptrEnd->x + ptrEnd->vx * distance;
            //    ptrEnd->y = ptrEnd->y + ptrEnd->vy * distance;
            //    ptrEnd->z = ptrEnd->z + ptrEnd->vz * distance;
            //}

            double*
                xPtr = XPtr + 4,
                yPtr = YPtr + 4,
                zPtr = ZPtr + 4,
                vxPtr = VxPtr + 4,
                vyPtr = VyPtr + 4,
                vzPtr = VzPtr + 4,
                mPtr = MPtr + 4;

            for (int i = 5, k = 0; i == 5 || i < 4; i += 2, mPtr += 2, vxPtr += 2, vyPtr += 2, vzPtr += 2, xPtr += 2, yPtr += 2, zPtr += 2)
            {


            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private Vector128<double> Get2D(Vector128<double> dx, Vector128<double> dy, Vector128<double> dz)
        {
            dx = Sse2.Multiply(dx, dx);
            dy = Sse2.Multiply(dy, dy);
            dz = Sse2.Multiply(dz, dz);
            dx = Sse2.Add(dx, dz);
            dy = Sse2.Add(dx, dy);
            return dy;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private Vector128<double> Reciprocal(Vector128<double> value)
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
        private Vector128<double> ReciprocalSqrt(Vector128<double> value)
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
