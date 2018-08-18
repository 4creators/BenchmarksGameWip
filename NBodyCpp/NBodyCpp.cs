
/* The Computer Language Benchmarks Game
   https://salsa.debian.org/benchmarksgame-team/benchmarksgame/

   contributed by Mark C. Lewis
   modified slightly by Chad Whipkey
   converted from java to c++,added sse support, by Branimir Maksimovic
   modified by Vaclav Zeman
*/

using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics.X86;
using static System.Runtime.Intrinsics.X86.Avx;
using static System.Runtime.Intrinsics.X86.Sse;
using static System.Runtime.Intrinsics.X86.Sse2;
using static System.Runtime.Intrinsics.X86.Sse3;
using VecD = System.Runtime.Intrinsics.Vector128<double>;
using VecQ = System.Runtime.Intrinsics.Vector256<double>;


[StructLayout(LayoutKind.Sequential, Pack = 16)]
public unsafe struct BodyVector
{
    public const double Pi = 3.141592653589793;
    public const double SolarMass = 4 * Pi * Pi;
    public const double DausPerYear = 365.24;
    public const int BodyVectorLength = 10;
    public const int BodyLength = 8;

    //[FieldOffset(0)]
    private fixed double x[BodyLength];

    public double* X { get { fixed (double* retPtr = x) { return retPtr; } } }

    //[FieldOffset(1 * BodyLength * sizeof(double))]
    private fixed double y[BodyLength];

    public double* Y { get { fixed (double* retPtr = y) { return retPtr; } } }

    //[FieldOffset(2 * BodyLength * sizeof(double))]
    private fixed double z[BodyLength];

    public double* Z { get { fixed (double* retPtr = z) { return retPtr; } } }

    //[FieldOffset(3 * BodyLength * sizeof(double))]
    private fixed double vx[BodyLength];

    public double* VX { get { fixed (double* retPtr = vx) { return retPtr; } } }

    //[FieldOffset(4 * BodyLength * sizeof(double))]
    private fixed double vy[BodyLength];

    public double* VY { get { fixed (double* retPtr = vy) { return retPtr; } } }

    //[FieldOffset(5 * BodyLength * sizeof(double))]
    private fixed double vz[BodyLength];

    public double* VZ { get { fixed (double* retPtr = vz) { return retPtr; } } }

    //[FieldOffset(6 * BodyLength * sizeof(double))]
    private fixed double mass[BodyLength];

    public double* Mass { get { fixed (double* retPtr = mass) { return retPtr; } } }

    public void OffsetMomentum(VecD px, VecD py, VecD pz)
    {
        VX[0] = - ConvertToDouble(HorizontalAdd(px, px)) / SolarMass;
        VX[5] = VX[0];

        VY[0] = -ConvertToDouble(HorizontalAdd(py, py)) / SolarMass;
        VY[5] = VY[0];

        VZ[0] = -ConvertToDouble(HorizontalAdd(pz, pz)) / SolarMass;
        VZ[5] = VZ[0];

    }
};

[StructLayout(LayoutKind.Sequential, Pack = 16, Size = 3 * 1024 * sizeof(double))]
public unsafe struct RS
{
    //[FieldOffset(0)]
    public fixed double dx[16];

    //[FieldOffset(1024 * sizeof(double))]
    public fixed double dy[16];

    //[FieldOffset(2 * 1024 * sizeof(double))]
    public fixed double dz[16];
};

[StructLayout(LayoutKind.Explicit)]
public unsafe partial struct NBodySystem
{
    public const int BodyCount = 5;
    public const int N = (BodyCount - 1) * BodyCount / 2;
    public static BodyVector* NBodyVector;

    public static void Initialize(BodyVector* bodyVector)
    {
        NBodyVector = bodyVector;

        double* x = NBodyVector->X;
        fixed(double* xSource = new [] { 0.0, 4.84143144246472090e+00, 8.34336671824457987e+00, 1.28943695621391310e+01, 1.53796971148509165e+01, 8.34336671824457987e+00, 1.28943695621391310e+01, 1.53796971148509165e+01, 1.28943695621391310e+01, 1.53796971148509165e+01 })
        {
            for (int i = 0; i < BodyVector.BodyLength; i += 2) StoreAligned(x + i, LoadVector128(xSource + i));
        }

        x = NBodyVector->Y;
        fixed (double* xSource = new[] { 0.0, -1.16032004402742839e+00, 4.12479856412430479e+00, -1.51111514016986312e+01, -2.59193146099879641e+01, 0.0, -1.16032004402742839e+00, 4.12479856412430479e+00, -1.51111514016986312e+01, -2.59193146099879641e+01 })
        {
            for (int i = 0; i < BodyVector.BodyLength; i += 2) StoreAligned(x + i, LoadVector128(xSource + +i));
        }

        x = NBodyVector->Z;
        fixed (double* xSource = new[] { 0.0, -1.03622044471123109e-01, -4.03523417114321381e-01, -2.23307578892655734e-01, 1.79258772950371181e-01, 0.0, -1.03622044471123109e-01, -4.03523417114321381e-01, -2.23307578892655734e-01, 1.79258772950371181e-01 })
        {
            for (int i = 0; i < BodyVector.BodyLength; i += 2) StoreAligned(x + i, LoadVector128(xSource + +i));
        }

        x = NBodyVector->VX;
        var daysPY = SetAllVector128(BodyVector.DausPerYear);
        fixed (double* xSource = new[] { 0.0, 1.66007664274403694e-03, -2.76742510726862411e-03, 2.96460137564761618e-03, 2.68067772490389322e-03, 0.0, 1.66007664274403694e-03, -2.76742510726862411e-03, 2.96460137564761618e-03, 2.68067772490389322e-03 })
        {
            for (int i = 0; i < BodyVector.BodyLength; i += 2) StoreAligned(x + i, Multiply(daysPY, LoadVector128(xSource + i)));
        }

        x = NBodyVector->VY;
        fixed (double* xSource = new[] { 0.0, 7.69901118419740425e-03, 4.99852801234917238e-03, 2.37847173959480950e-03, 1.62824170038242295e-03, 0.0, 7.69901118419740425e-03, 4.99852801234917238e-03, 2.37847173959480950e-03, 1.62824170038242295e-03 })
        {
            for (int i = 0; i < BodyVector.BodyLength; i += 2) StoreAligned(x + i, Multiply(daysPY, LoadVector128(xSource + i)));
        }

        x = NBodyVector->VZ;
        fixed (double* xSource = new[] { 0.0, -6.90460016972063023e-05, 2.30417297573763929e-05, -2.96589568540237556e-05, -9.51592254519715870e-05, 0.0, -6.90460016972063023e-05, 2.30417297573763929e-05, -2.96589568540237556e-05, -9.51592254519715870e-05 })
        {
            for (int i = 0; i < BodyVector.BodyLength; i += 2) StoreAligned(x + i, Multiply(daysPY, LoadVector128(xSource + i)));
        }

        x = NBodyVector->Mass;
        var mSol = SetAllVector128(BodyVector.SolarMass);
        fixed (double* xSource = new[] { 0.0, 9.54791938424326609e-04, 2.85885980666130812e-04, 4.36624404335156298e-05, 5.15138902046611451e-05, 0.0, 9.54791938424326609e-04, 2.85885980666130812e-04, 4.36624404335156298e-05, 5.15138902046611451e-05 })
        {
            for (int i = 0; i < BodyVector.BodyLength; i += 2) StoreAligned(x + i, Multiply(mSol, LoadVector128(xSource + i)));
        }

        *NBodyVector->Mass = BodyVector.SolarMass;
        *(NBodyVector->Mass + 6) = BodyVector.SolarMass;

        var px = SetZeroVector128<double>();
        var py = SetZeroVector128<double>();
        var pz = SetZeroVector128<double>();

        for (int i = 0; i < 6; i += 2)
        {
            var mass = LoadAlignedVector128(NBodyVector->Mass + i);
            px = Add(px, Multiply(LoadAlignedVector128(NBodyVector->VX + i), mass));
            py = Add(py, Multiply(LoadAlignedVector128(NBodyVector->VY + i), mass));
            pz = Add(pz, Multiply(LoadAlignedVector128(NBodyVector->VZ + i), mass));
        }

        NBodyVector->OffsetMomentum(px, py, pz);
    }

    [MethodImpl(MethodImplOptions.AggressiveInlining)]
    public static void AdvanceStaticIntr1(double dt, R* rPtr, double* magPtr, ref NBodySystem bodySystem, int count = 50000000)
    {
        Body* items = bodySystem.bodies;
        const int N = (BodyCount - 1) * BodyCount / 2;
        R* r = rPtr;
        double* mag = magPtr;

        {
            int k = 0;
            ref Body iBody = ref items[0];
            for (int j = 1; j < 5; ++j, ++k)
            {
                ref Body jBody = ref items[j];
                ref R rf = ref r[k];
                rf.dx = iBody.x - jBody.x;
                rf.dy = iBody.y - jBody.y;
                rf.dz = iBody.z - jBody.z;
            }

            iBody = ref items[1];
            for (int j = 2; j < 5; ++j, ++k)
            {
                ref Body jBody = ref items[j];
                ref R rf = ref r[k];
                rf.dx = iBody.x - jBody.x;
                rf.dy = iBody.y - jBody.y;
                rf.dz = iBody.z - jBody.z;
            }

            iBody = ref items[2];
            for (int j = 3; j < 5; ++j, ++k)
            {
                ref Body jBody = ref items[j];
                ref R rf = ref r[k];
                rf.dx = iBody.x - jBody.x;
                rf.dy = iBody.y - jBody.y;
                rf.dz = iBody.z - jBody.z;
            }

            iBody = ref items[3];
            for (int j = 4; j < 5; ++j, ++k)
            {
                ref Body jBody = ref items[j];
                ref R rf = ref r[k];
                rf.dx = iBody.x - jBody.x;
                rf.dy = iBody.y - jBody.y;
                rf.dz = iBody.z - jBody.z;
            }
        }

        for (int i = 0; i < N; i += 2)
        {
            VecD dx = default, dy = default, dz = default;
            dx = LoadLow(dx, &r[i].dx);
            dy = LoadLow(dy, &r[i].dy);
            dz = LoadLow(dz, &r[i].dz);

            dx = LoadHigh(dx, &r[i + 1].dx);
            dy = LoadHigh(dy, &r[i + 1].dy);
            dz = LoadHigh(dz, &r[i + 1].dz);

            dx = Multiply(dx, dx);
            dy = Multiply(dy, dy);
            dz = Multiply(dz, dz);
            dx = Add(dx, dy);
            VecD dSquared = Add(dx, dz);

            VecD distance = ConvertToVector128Double(ReciprocalSqrt(ConvertToVector128Single(dSquared)));

            distance = Subtract(Multiply(distance, SetAllVector128(1.5)),
                Multiply(Multiply(Multiply(Multiply(SetAllVector128(0.5), dSquared), distance), distance), distance));

            distance = Subtract(Multiply(distance, SetAllVector128(1.5)),
                Multiply(Multiply(Multiply(Multiply(SetAllVector128(0.5), dSquared), distance), distance), distance));

            VecD dmag = Multiply(Divide(SetAllVector128(dt), dSquared), distance);
            StoreAligned(&mag[i], dmag);
        }

        {
            ref Body iBody = ref items[0];
            int k = 0;
            for (int j = 1; j < BodyCount; ++j, ++k)
            {
                ref R rf = ref r[k];
                ref Body b = ref items[j];

                var bm = b.mass * mag[k];
                iBody.vx -= rf.dx * bm;
                iBody.vy -= rf.dy * bm;
                iBody.vz -= rf.dz * bm;

                var im = iBody.mass * mag[k];
                b.vx += rf.dx * im;
                b.vy += rf.dy * im;
                b.vz += rf.dz * im;
            }

            iBody = ref items[1];
            for (int j = 2; j < BodyCount; ++j, ++k)
            {
                ref R rf = ref r[k];
                ref Body b = ref items[j];

                var bm = b.mass * mag[k];
                iBody.vx -= rf.dx * bm;
                iBody.vy -= rf.dy * bm;
                iBody.vz -= rf.dz * bm;

                var im = iBody.mass * mag[k];
                b.vx += rf.dx * im;
                b.vy += rf.dy * im;
                b.vz += rf.dz * im;
            }

            iBody = ref items[2];
            for (int j = 3; j < BodyCount; ++j, ++k)
            {
                ref R rf = ref r[k];
                ref Body b = ref items[j];

                var bm = b.mass * mag[k];
                iBody.vx -= rf.dx * bm;
                iBody.vy -= rf.dy * bm;
                iBody.vz -= rf.dz * bm;

                var im = iBody.mass * mag[k];
                b.vx += rf.dx * im;
                b.vy += rf.dy * im;
                b.vz += rf.dz * im;
            }

            iBody = ref items[3];
            for (int j = 4; j < BodyCount; ++j, ++k)
            {
                ref R rf = ref r[k];
                ref Body b = ref items[j];

                var bm = b.mass * mag[k];
                iBody.vx -= rf.dx * bm;
                iBody.vy -= rf.dy * bm;
                iBody.vz -= rf.dz * bm;

                var im = iBody.mass * mag[k];
                b.vx += rf.dx * im;
                b.vy += rf.dy * im;
                b.vz += rf.dz * im;
            }
        }


        {
            ref Body body = ref items[0];
            body.x += dt * body.vx;
            body.y += dt * body.vy;
            body.z += dt * body.vz;

            body = ref items[1];
            body.x += dt * body.vx;
            body.y += dt * body.vy;
            body.z += dt * body.vz;

            body = ref items[2];
            body.x += dt * body.vx;
            body.y += dt * body.vy;
            body.z += dt * body.vz;

            body = ref items[3];
            body.x += dt * body.vx;
            body.y += dt * body.vy;
            body.z += dt * body.vz;

            body = ref items[4];
            body.x += dt * body.vx;
            body.y += dt * body.vy;
            body.z += dt * body.vz;
        }
    }

    [MethodImpl(MethodImplOptions.AggressiveInlining)]
    public static void AdvanceStaticIntr2(double dt, R* rPtr, double* magPtr, ref NBodySystem bodySystem, int count = 50000000)
    {
        Body* items = bodySystem.bodies;
        R* r = rPtr;
        double* mag = magPtr;

        AdvancePrecalculate(items, r);

        for (int i = 0; i < N; i += 2)
        {
            VecD dx = default, dy = default, dz = default;
            dx = LoadLow(dx, &r[i].dx);
            dy = LoadLow(dy, &r[i].dy);
            dz = LoadLow(dz, &r[i].dz);

            dx = LoadHigh(dx, &r[i + 1].dx);
            dy = LoadHigh(dy, &r[i + 1].dy);
            dz = LoadHigh(dz, &r[i + 1].dz);

            dx = Multiply(dx, dx);
            dy = Multiply(dy, dy);
            dz = Multiply(dz, dz);
            dx = Add(dx, dy);
            VecD dSquared = Add(dx, dz);

            VecD distance = ConvertToVector128Double(ReciprocalSqrt(ConvertToVector128Single(dSquared)));

            distance = Subtract(Multiply(distance, SetAllVector128(1.5)),
                Multiply(Multiply(Multiply(Multiply(SetAllVector128(0.5), dSquared), distance), distance), distance));

            distance = Subtract(Multiply(distance, SetAllVector128(1.5)),
                Multiply(Multiply(Multiply(Multiply(SetAllVector128(0.5), dSquared), distance), distance), distance));

            VecD dmag = Multiply(Divide(SetAllVector128(dt), dSquared), distance);
            StoreAligned(&mag[i], dmag);
        }

        {
            ref Body iBody = ref items[0];
            int k = 0;
            for (int j = 1; j < BodyCount; ++j, ++k)
            {
                ref R rf = ref r[k];
                ref Body b = ref items[j];

                var bm = b.mass * mag[k];
                iBody.vx -= rf.dx * bm;
                iBody.vy -= rf.dy * bm;
                iBody.vz -= rf.dz * bm;

                var im = iBody.mass * mag[k];
                b.vx += rf.dx * im;
                b.vy += rf.dy * im;
                b.vz += rf.dz * im;
            }

            iBody = ref items[1];
            for (int j = 2; j < BodyCount; ++j, ++k)
            {
                ref R rf = ref r[k];
                ref Body b = ref items[j];

                var bm = b.mass * mag[k];
                iBody.vx -= rf.dx * bm;
                iBody.vy -= rf.dy * bm;
                iBody.vz -= rf.dz * bm;

                var im = iBody.mass * mag[k];
                b.vx += rf.dx * im;
                b.vy += rf.dy * im;
                b.vz += rf.dz * im;
            }

            iBody = ref items[2];
            for (int j = 3; j < BodyCount; ++j, ++k)
            {
                ref R rf = ref r[k];
                ref Body b = ref items[j];

                var bm = b.mass * mag[k];
                iBody.vx -= rf.dx * bm;
                iBody.vy -= rf.dy * bm;
                iBody.vz -= rf.dz * bm;

                var im = iBody.mass * mag[k];
                b.vx += rf.dx * im;
                b.vy += rf.dy * im;
                b.vz += rf.dz * im;
            }

            iBody = ref items[3];
            for (int j = 4; j < BodyCount; ++j, ++k)
            {
                ref R rf = ref r[k];
                ref Body b = ref items[j];

                var bm = b.mass * mag[k];
                iBody.vx -= rf.dx * bm;
                iBody.vy -= rf.dy * bm;
                iBody.vz -= rf.dz * bm;

                var im = iBody.mass * mag[k];
                b.vx += rf.dx * im;
                b.vy += rf.dy * im;
                b.vz += rf.dz * im;
            }
        }


        {
            ref Body body = ref items[0];
            body.x += dt * body.vx;
            body.y += dt * body.vy;
            body.z += dt * body.vz;

            body = ref items[1];
            body.x += dt * body.vx;
            body.y += dt * body.vy;
            body.z += dt * body.vz;

            body = ref items[2];
            body.x += dt * body.vx;
            body.y += dt * body.vy;
            body.z += dt * body.vz;

            body = ref items[3];
            body.x += dt * body.vx;
            body.y += dt * body.vy;
            body.z += dt * body.vz;

            body = ref items[4];
            body.x += dt * body.vx;
            body.y += dt * body.vy;
            body.z += dt * body.vz;
        }
    }

    [MethodImpl(MethodImplOptions.AggressiveInlining)]
    public static void AdvancePrecalculate(Body* items, R* r)
    {
        double* rD = (double*)r;
        double* itemsPtr = (double*)items;

        if (!Avx.IsSupported)
        {
            VecD iVec1 = LoadAlignedVector128(itemsPtr);
            VecD iVec2 = LoadAlignedVector128(itemsPtr + 2);
            VecD iVec3 = LoadAlignedVector128(itemsPtr + 8);
            VecD iVec4 = LoadAlignedVector128(itemsPtr + 10);
            VecD iVec5 = LoadAlignedVector128(itemsPtr + 16);
            VecD iVec6 = LoadAlignedVector128(itemsPtr + 18);
            VecD iVec7 = LoadAlignedVector128(itemsPtr + 24);
            VecD iVec8 = LoadAlignedVector128(itemsPtr + 26);
            VecD iVec9 = LoadAlignedVector128(itemsPtr + 32);
            VecD iVec10 = LoadAlignedVector128(itemsPtr + 34);
            VecD rVec1 = default;
            VecD rVec2 = default;

            StoreAligned(rD, rVec1 = Subtract(iVec1, iVec3));
            StoreAligned(rD += 2, rVec2 = Subtract(iVec2, iVec4));
            StoreAligned(rD += 2, rVec1 = Subtract(iVec1, iVec5));
            StoreAligned(rD += 2, rVec2 = Subtract(iVec2, iVec6));
            StoreAligned(rD += 2, rVec1 = Subtract(iVec1, iVec7));
            StoreAligned(rD += 2, rVec2 = Subtract(iVec2, iVec8));
            StoreAligned(rD += 2, rVec1 = Subtract(iVec1, iVec9));
            StoreAligned(rD += 2, rVec2 = Subtract(iVec2, iVec10));

            StoreAligned(rD += 2, rVec1 = Subtract(iVec3, iVec5));
            StoreAligned(rD += 2, rVec2 = Subtract(iVec4, iVec6));
            StoreAligned(rD += 2, rVec1 = Subtract(iVec3, iVec7));
            StoreAligned(rD += 2, rVec2 = Subtract(iVec4, iVec8));
            StoreAligned(rD += 2, rVec1 = Subtract(iVec3, iVec9));
            StoreAligned(rD += 2, rVec2 = Subtract(iVec4, iVec10));

            StoreAligned(rD += 2, rVec1 = Subtract(iVec5, iVec7));
            StoreAligned(rD += 2, rVec2 = Subtract(iVec6, iVec8));
            StoreAligned(rD += 2, rVec1 = Subtract(iVec5, iVec9));
            StoreAligned(rD += 2, rVec2 = Subtract(iVec6, iVec10));

            StoreAligned(rD += 2, rVec1 = Subtract(iVec7, iVec9));
            StoreAligned(rD += 2, rVec2 = Subtract(iVec8, iVec10));
        }
        else
        {
            VecQ iVec1 = LoadAlignedVector256(itemsPtr);
            VecQ iVec2 = LoadAlignedVector256(itemsPtr + 8);
            VecQ iVec3 = LoadAlignedVector256(itemsPtr + 16);
            VecQ iVec4 = LoadAlignedVector256(itemsPtr + 24);
            VecQ iVec5 = LoadAlignedVector256(itemsPtr + 32);

            StoreAligned(rD, Subtract(iVec1, iVec2));
            StoreAligned(rD += 4, Subtract(iVec1, iVec3));
            StoreAligned(rD += 4, Subtract(iVec1, iVec4));
            StoreAligned(rD += 4, Subtract(iVec1, iVec5));

            StoreAligned(rD += 4, Subtract(iVec2, iVec3));
            StoreAligned(rD += 4, Subtract(iVec2, iVec4));
            StoreAligned(rD += 4, Subtract(iVec2, iVec5));

            StoreAligned(rD += 4, Subtract(iVec3, iVec4));
            StoreAligned(rD += 4, Subtract(iVec3, iVec5));

            StoreAligned(rD += 4, Subtract(iVec4, iVec5));
        }
    }

    [MethodImpl(MethodImplOptions.AggressiveInlining)]
    public static void AdvanceStaticIntrSoa(double dt, RS* rPtr, double* magPtr, int count = 50_000_000)
    {
        BodyVector* bodies = NBodyVector;
        RS* r = rPtr;
        double* mag = magPtr;

        {
            int k = 0;

            double* rfx = r->dx;
            double* rfy = r->dy;
            double* rfz = r->dz;
            VecD iX = LoadAndDuplicateToVector128(bodies->X);
            VecD iY = LoadAndDuplicateToVector128(bodies->Y);
            VecD iZ = LoadAndDuplicateToVector128(bodies->Z);

            // TODO-CQ Verify if implementation with LoadAligned and MaskStore will be faster
            // and use loop blocking for cache locality, try more aggressive loop unrolling
            for (int j = 1; j < 5; j += 2, k += 2)
            {
                StoreAligned(rfx + k, Subtract(iX, LoadVector128(bodies->X + j)));
                StoreAligned(rfy + k, Subtract(iY, LoadVector128(bodies->Y + j)));
                StoreAligned(rfz + k, Subtract(iZ, LoadVector128(bodies->Z + j)));
            }

            iX = LoadAndDuplicateToVector128(bodies->X + 1);
            iY = LoadAndDuplicateToVector128(bodies->Y + 1);
            iZ = LoadAndDuplicateToVector128(bodies->Z + 1);

            for (int j = 2; j < 5; j += 2, k += 2)
            {
                StoreAligned(rfx + k, Subtract(iX, LoadAlignedVector128(bodies->X + j)));
                StoreAligned(rfy + k, Subtract(iY, LoadAlignedVector128(bodies->Y + j)));
                StoreAligned(rfz + k, Subtract(iZ, LoadAlignedVector128(bodies->Z + j)));
            }

            iX = LoadAndDuplicateToVector128(bodies->X + 2);
            iY = LoadAndDuplicateToVector128(bodies->Y + 2);
            iZ = LoadAndDuplicateToVector128(bodies->Z + 2);
            --k;
            for (int j = 3; j < 5; j += 2, k += 2)
            {
                Store(rfx + k, Subtract(iX, LoadVector128(bodies->X + j)));
                Store(rfy + k, Subtract(iY, LoadVector128(bodies->Y + j)));
                Store(rfz + k, Subtract(iZ, LoadVector128(bodies->Z + j)));
            }

            iX = LoadAndDuplicateToVector128(bodies->X + 3);
            iY = LoadAndDuplicateToVector128(bodies->Y + 3);
            iZ = LoadAndDuplicateToVector128(bodies->Z + 3);

            var mask = StaticCast<ulong, byte>(SetVector128(0x0, 0xffffffffffffffff));
            MaskMove(StaticCast<double, byte>(Subtract(iX, LoadAlignedVector128(bodies->X + 4))), mask,(byte*) (rfx + k));
            MaskMove(StaticCast<double, byte>(Subtract(iY, LoadAlignedVector128(bodies->Y + 4))), mask, (byte*)(rfy + k));
            MaskMove(StaticCast<double, byte>(Subtract(iZ, LoadAlignedVector128(bodies->Z + 4))), mask, (byte*)(rfz + k));
        }

        for (int i = 0; i < N; i += 2)
        {
            VecD dx = LoadAlignedVector128(&r->dx[i]);
            VecD dy = LoadAlignedVector128(&r->dy[i]);
            VecD dz = LoadAlignedVector128(&r->dz[i]);

            dx = Multiply(dx, dx);
            dy = Multiply(dy, dy);
            dz = Multiply(dz, dz);
            dx = Add(dx, dy);
            VecD dSquared = Add(dx, dz);

            VecD distance = ConvertToVector128Double(ReciprocalSqrt(ConvertToVector128Single(dSquared)));

            distance = Subtract(Multiply(distance, SetAllVector128(1.5)),
                Multiply(Multiply(Multiply(Multiply(SetAllVector128(0.5), dSquared), distance), distance), distance));

            distance = Subtract(Multiply(distance, SetAllVector128(1.5)),
                Multiply(Multiply(Multiply(Multiply(SetAllVector128(0.5), dSquared), distance), distance), distance));

            VecD dmag = Multiply(Divide(SetAllVector128(dt), dSquared), distance);
            StoreAligned(&mag[i], dmag);
        }

        {
            VecD iX = default;
            double* rfx = default;

            {
                VecD bm1 = Multiply(LoadVector128(bodies->Mass), LoadAlignedVector128(mag));
                VecD bm2 = Multiply(LoadVector128(bodies->Mass + 2), LoadAlignedVector128(mag + 2));

                VecD im1 = Multiply(LoadVector128(bodies->Mass), Unsafe.Read<VecD>(mag));
                VecD im2 = Multiply(LoadVector128(bodies->Mass), Unsafe.Read<VecD>(mag + 2));

                iX = LoadAndDuplicateToVector128(bodies->VX);
                rfx = r->dx;

                StoreAligned(bodies->VX, Subtract(iX, Multiply(bm1, Unsafe.Read<VecD>(rfx))));
                Store(bodies->VX + 1, Add(Unsafe.Read<VecD>(bodies->VX + 1), Multiply(Unsafe.Read<VecD>(rfx), im1)));

                StoreAligned(bodies->VX, Subtract(iX, Multiply(bm2, Unsafe.Read<VecD>(rfx + 2))));
                Store(bodies->VX + 3, Add(Unsafe.Read<VecD>(bodies->VX + 3), Multiply(Unsafe.Read<VecD>(rfx + 2), im2)));

                iX = LoadAndDuplicateToVector128(bodies->VY);
                rfx = r->dy;

                StoreAligned(bodies->VY, Subtract(iX, Multiply(bm1, Unsafe.Read<VecD>(rfx))));
                Store(bodies->VY + 1, Add(Unsafe.Read<VecD>(bodies->VY + 1), Multiply(Unsafe.Read<VecD>(rfx), im1)));

                StoreAligned(bodies->VY, Subtract(iX, Multiply(bm2, Unsafe.Read<VecD>(rfx + 2))));
                Store(bodies->VY + 3, Add(Unsafe.Read<VecD>(bodies->VY + 3), Multiply(Unsafe.Read<VecD>(rfx + 2), im2)));

                iX = LoadAndDuplicateToVector128(bodies->VZ);
                rfx = r->dz;

                StoreAligned(bodies->VZ, Subtract(iX, Multiply(bm1, Unsafe.Read<VecD>(rfx))));
                Store(bodies->VZ + 1, Add(Unsafe.Read<VecD>(bodies->VZ + 1), Multiply(Unsafe.Read<VecD>(rfx), im1)));

                StoreAligned(bodies->VZ, Subtract(iX, Multiply(bm2, Unsafe.Read<VecD>(rfx + 2))));
                Store(bodies->VZ + 3, Add(Unsafe.Read<VecD>(bodies->VZ + 3), Multiply(Unsafe.Read<VecD>(rfx + 2), im2)));
            }
            // k = 4


            {
                VecD bm1 = Multiply(LoadVector128(bodies->Mass + 2), LoadAlignedVector128(mag + 4));
                VecD bm2 = Multiply(LoadVector128(bodies->Mass + 4), LoadAlignedVector128(mag + 6));

                VecD im1 = Multiply(LoadVector128(bodies->Mass), Unsafe.Read<VecD>(mag + 4));
                VecD im2 = Multiply(LoadVector128(bodies->Mass), Unsafe.Read<VecD>(mag + 6));

                iX = LoadAndDuplicateToVector128(bodies->VX + 1);
                rfx = r->dx;

                StoreAligned(bodies->VX, Subtract(iX, Multiply(bm1, Unsafe.Read<VecD>(rfx + 4))));
                StoreAligned(bodies->VX + 2, Add(Unsafe.Read<VecD>(bodies->VX + 2), Multiply(Unsafe.Read<VecD>(rfx + 4), im1)));

                StoreAligned(bodies->VX, Subtract(iX, Multiply(bm2, Unsafe.Read<VecD>(rfx + 6))));
                StoreAligned(bodies->VX + 4, Add(Unsafe.Read<VecD>(bodies->VX + 4), Multiply(Unsafe.Read<VecD>(rfx + 6), im2)));

                iX = LoadAndDuplicateToVector128(bodies->VY + 1);
                rfx = r->dy;

                StoreAligned(bodies->VY, Subtract(iX, Multiply(bm1, Unsafe.Read<VecD>(rfx + 4))));
                Store(bodies->VY + 2, Add(Unsafe.Read<VecD>(bodies->VY + 2), Multiply(Unsafe.Read<VecD>(rfx + 4), im1)));

                StoreAligned(bodies->VY, Subtract(iX, Multiply(bm2, Unsafe.Read<VecD>(rfx + 6))));
                Store(bodies->VY + 4, Add(Unsafe.Read<VecD>(bodies->VY + 4), Multiply(Unsafe.Read<VecD>(rfx + 6), im2)));

                iX = LoadAndDuplicateToVector128(bodies->VZ + 1);
                rfx = r->dz;

                StoreAligned(bodies->VZ, Subtract(iX, Multiply(bm1, Unsafe.Read<VecD>(rfx + 4))));
                Store(bodies->VZ + 2, Add(Unsafe.Read<VecD>(bodies->VZ + 2), Multiply(Unsafe.Read<VecD>(rfx + 4), im1)));

                StoreAligned(bodies->VZ, Subtract(iX, Multiply(bm2, Unsafe.Read<VecD>(rfx + 6))));
                Store(bodies->VZ + 4, Add(Unsafe.Read<VecD>(bodies->VZ + 4), Multiply(Unsafe.Read<VecD>(rfx + 6), im2)));
            }
            // k = 8

            {
                VecD bm1 = Multiply(LoadVector128(bodies->Mass + 4), LoadAlignedVector128(mag + 8));

                VecD im1 = Multiply(LoadVector128(bodies->Mass), Unsafe.Read<VecD>(mag + 8));

                iX = LoadAndDuplicateToVector128(bodies->VX + 2);
                rfx = r->dx;

                StoreAligned(bodies->VX, Subtract(iX, Multiply(bm1, Unsafe.Read<VecD>(rfx + 8))));
                Store(bodies->VX + 3, Add(Unsafe.Read<VecD>(bodies->VX + 3), Multiply(Unsafe.Read<VecD>(rfx + 8), im1)));

                iX = LoadAndDuplicateToVector128(bodies->VY + 2);
                rfx = r->dy;

                StoreAligned(bodies->VY, Subtract(iX, Multiply(bm1, Unsafe.Read<VecD>(rfx + 8))));
                Store(bodies->VY + 3, Add(Unsafe.Read<VecD>(bodies->VY + 3), Multiply(Unsafe.Read<VecD>(rfx + 8), im1)));

                iX = LoadAndDuplicateToVector128(bodies->VZ + 2);
                rfx = r->dz;

                StoreAligned(bodies->VZ, Subtract(iX, Multiply(bm1, Unsafe.Read<VecD>(rfx + 4))));
                Store(bodies->VZ + 3, Add(Unsafe.Read<VecD>(bodies->VZ + 3), Multiply(Unsafe.Read<VecD>(rfx + 8), im1)));
            }
            // k = 10
        }

        {
            VecD dtV = SetAllVector128(dt);

            Add(Unsafe.Read<VecD>(bodies->X), Multiply(dtV, Unsafe.Read<VecD>(bodies->VX)));
            Add(Unsafe.Read<VecD>(bodies->X + 2), Multiply(dtV, Unsafe.Read<VecD>(bodies->VX + 2)));
            Add(Unsafe.Read<VecD>(bodies->X + 4), Multiply(dtV, Unsafe.Read<VecD>(bodies->VX + 4)));

            Add(Unsafe.Read<VecD>(bodies->Y), Multiply(dtV, Unsafe.Read<VecD>(bodies->VY)));
            Add(Unsafe.Read<VecD>(bodies->Y + 2), Multiply(dtV, Unsafe.Read<VecD>(bodies->VY + 2)));
            Add(Unsafe.Read<VecD>(bodies->Y + 4), Multiply(dtV, Unsafe.Read<VecD>(bodies->VY + 4)));

            Add(Unsafe.Read<VecD>(bodies->Z), Multiply(dtV, Unsafe.Read<VecD>(bodies->VZ)));
            Add(Unsafe.Read<VecD>(bodies->Z + 2), Multiply(dtV, Unsafe.Read<VecD>(bodies->VZ + 2)));
            Add(Unsafe.Read<VecD>(bodies->Z + 4), Multiply(dtV, Unsafe.Read<VecD>(bodies->VZ + 4)));

        }
    }

    [MethodImpl(MethodImplOptions.AggressiveInlining)]
    public static VecD Get2D(VecD dx, VecD dy, VecD dz)
    {
        dx = Multiply(dx, dx);
        dy = Multiply(dy, dy);
        dz = Multiply(dz, dz);
        dx = Add(dx, dy);
        dz = Add(dx, dz);
        return dz;
    }

    public double Energy()
    {
        double e = 0.0;

        for (int i = 0; i < BodyCount; ++i)
        {
            ref Body iBody = ref bodies[i];
            double dx, dy, dz, distance;
            e += 0.5 * iBody.mass *
                (iBody.vx * iBody.vx
                    + iBody.vy * iBody.vy
                    + iBody.vz * iBody.vz);

            for (int j = i + 1; j < BodyCount; ++j)
            {
                ref Body jBody = ref bodies[j];
                dx = iBody.x - jBody.x;
                dy = iBody.y - jBody.y;
                dz = iBody.z - jBody.z;

                distance = Math.Sqrt(dx * dx + dy * dy + dz * dz);
                e -= (iBody.mass * jBody.mass) / distance;
            }
        }
        return e;
    }

    public static void Main(string[] args)
    {
        var time = Stopwatch.StartNew();
        int count = args.Length >= 1 ? int.Parse(args[0]) : 50_000_000;
        if (GC.TryStartNoGCRegion(2 * 1024 * 1024))
        {
            R* rPtr = stackalloc R[1024];
            Body* bodies = stackalloc Body[6];
            //RS* rsaPtr = stackalloc RS[1];
            double* bvPtr = stackalloc double[sizeof(BodyVector)/sizeof(double)];
            //double* rsdPtr = stackalloc double[3 * 1024];
            {
                double* dPtr = stackalloc double[1024];
                NBodySystem bodySystem = new NBodySystem(bodies);
                Console.WriteLine(bodySystem.Energy().ToString("F9"));

                while (count-- > 0)
                {
                    NBodySystem.AdvanceStaticIntr2(0.01, rPtr, dPtr, ref bodySystem, count);
                }

                Console.WriteLine(bodySystem.Energy().ToString("F9"));
            }
            time.Stop();
            Console.WriteLine($"NBodyCpp C# Elapsed Time AdvanceStaticIntr No GC {time.Elapsed}");
            GC.EndNoGCRegion();
        }
    }
}
