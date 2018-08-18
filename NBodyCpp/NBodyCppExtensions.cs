using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Text;
using static System.Runtime.Intrinsics.X86.Sse;
using static System.Runtime.Intrinsics.X86.Sse2;
using static System.Runtime.Intrinsics.X86.Sse3;
using VecD = System.Runtime.Intrinsics.Vector128<double>;



public unsafe partial struct NBodySystem
{
    [FieldOffset(0)]
    private Body* bodies;

    public enum BodyNames
    {
        Sun,
        Jupiter,
        Saturn,
        Neptune,
        Uranus,
    }


    public NBodySystem(Body* ptr)
    {
        bodies = ptr;

        ref Body p = ref bodies[0];
        p.mass = Body.SolarMass;

        p = ref bodies[1];
        p.x = 4.84143144246472090e+00;
        p.y = -1.16032004402742839e+00;
        p.z = -1.03622044471123109e-01;
        p.vx = 1.66007664274403694e-03 * Body.DaysPerYear;
        p.vy = 7.69901118419740425e-03 * Body.DaysPerYear;
        p.vz = -6.90460016972063023e-05 * Body.DaysPerYear;
        p.mass = 9.54791938424326609e-04 * Body.SolarMass;

        p = ref bodies[2];
        p.x = 8.34336671824457987e+00;
        p.y = 4.12479856412430479e+00;
        p.z = -4.03523417114321381e-01;
        p.vx = -2.76742510726862411e-03 * Body.DaysPerYear;
        p.vy = 4.99852801234917238e-03 * Body.DaysPerYear;
        p.vz = 2.30417297573763929e-05 * Body.DaysPerYear;
        p.mass = 2.85885980666130812e-04 * Body.SolarMass;

        p = ref bodies[3];
        p.x = 1.28943695621391310e+01;
        p.y = -1.51111514016986312e+01;
        p.z = -2.23307578892655734e-01;
        p.vx = 2.96460137564761618e-03 * Body.DaysPerYear;
        p.vy = 2.37847173959480950e-03 * Body.DaysPerYear;
        p.vz = -2.96589568540237556e-05 * Body.DaysPerYear;
        p.mass = 4.36624404335156298e-05 * Body.SolarMass;

        p = ref bodies[4];
        p.x = 1.53796971148509165e+01;
        p.y = -2.59193146099879641e+01;
        p.z = 1.79258772950371181e-01;
        p.vx = 2.68067772490389322e-03 * Body.DaysPerYear;
        p.vy = 1.62824170038242295e-03 * Body.DaysPerYear;
        p.vz = -9.51592254519715870e-05 * Body.DaysPerYear;
        p.mass = 5.15138902046611451e-05 * Body.SolarMass;

        double px = 0.0, py = 0.0, pz = 0.0;
        for (int i = 0; i < BodyCount; ++i)
        {
            p = ref bodies[i];
            px += p.vx * p.mass;
            py += p.vy * p.mass;
            pz += p.vz * p.mass;
        }

        bodies[0].offsetMomentum(px, py, pz);
    }

    [MethodImpl(MethodImplOptions.AggressiveInlining)]
    public void Advance(double dt, R* rPtr, double* magPtr, int count = 50000000)
    {
        R* r = rPtr;
        double* mag = magPtr;


        for (int i = 0, k = 0; i < BodyCount - 1; ++i)
        {
            ref Body iBody = ref bodies[i];
            for (int j = i + 1; j < 5; ++j, ++k)
            {
                ref Body jBody = ref bodies[j];
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


            VecD dSquared = Get2D(dx, dy, dz);

            VecD distance = ConvertToVector128Double(ReciprocalSqrt(ConvertToVector128Single(dSquared)));
            for (int j = 0; j < 2; ++j)
            {
                distance = Subtract(Multiply(distance, SetAllVector128(1.5)),
                    Multiply(Multiply(Multiply(Multiply(SetAllVector128(0.5), dSquared), distance), distance), distance));
            }

            VecD dmag = Multiply(Divide(SetAllVector128(dt), (dSquared)), distance);
            StoreAligned(&mag[i], dmag);
        }

        for (int i = 0, k = 0; i < BodyCount - 1; ++i)
        {
            ref Body iBody = ref bodies[i];

            for (int j = i + 1; j < BodyCount; ++j, ++k)
            {
                ref R rf = ref r[k];
                ref Body b = ref bodies[j];

                iBody.vx -= rf.dx * b.mass * mag[k];
                iBody.vy -= rf.dy * b.mass * mag[k];
                iBody.vz -= rf.dz * b.mass * mag[k];

                b.vx += rf.dx * iBody.mass * mag[k];
                b.vy += rf.dy * iBody.mass * mag[k];
                b.vz += rf.dz * iBody.mass * mag[k];
            }
        }

        for (int i = 0; i < BodyCount; ++i)
        {
            ref Body body = ref bodies[i];
            body.x += dt * body.vx;
            body.y += dt * body.vy;
            body.z += dt * body.vz;
        }
    }

    public static void AdvanceStatic(double dt, R* rPtr, double* magPtr, ref NBodySystem bodySystem, int count = 50000000)
    {
        Body* bodies = bodySystem.bodies;
        const int N = (BodyCount - 1) * BodyCount / 2;
        R* r = rPtr;
        double* mag = magPtr;


        for (int i = 0, k = 0; i < BodyCount - 1; ++i)
        {
            ref Body iBody = ref bodies[i];
            for (int j = i + 1; j < 5; ++j, ++k)
            {
                ref Body jBody = ref bodies[j];
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


            VecD dSquared = Get2D(dx, dy, dz);

            VecD distance = ConvertToVector128Double(ReciprocalSqrt(ConvertToVector128Single(dSquared)));
            for (int j = 0; j < 2; ++j)
            {
                distance = Subtract(Multiply(distance, SetAllVector128(1.5)),
                    Multiply(Multiply(Multiply(Multiply(SetAllVector128(0.5), dSquared), distance), distance), distance));
            }

            VecD dmag = Multiply(Divide(SetAllVector128(dt), (dSquared)), distance);
            StoreAligned(&mag[i], dmag);
        }

        for (int i = 0, k = 0; i < BodyCount - 1; ++i)
        {
            ref Body iBody = ref bodies[i];

            for (int j = i + 1; j < BodyCount; ++j, ++k)
            {
                ref R rf = ref r[k];
                ref Body b = ref bodies[j];

                iBody.vx -= rf.dx * b.mass * mag[k];
                iBody.vy -= rf.dy * b.mass * mag[k];
                iBody.vz -= rf.dz * b.mass * mag[k];

                b.vx += rf.dx * iBody.mass * mag[k];
                b.vy += rf.dy * iBody.mass * mag[k];
                b.vz += rf.dz * iBody.mass * mag[k];
            }
        }

        for (int i = 0; i < BodyCount; ++i)
        {
            ref Body body = ref bodies[i];
            body.x += dt * body.vx;
            body.y += dt * body.vy;
            body.z += dt * body.vz;
        }
    }

    public static string DumpBodyVector(int count)
    {
        StringBuilder sb = new StringBuilder(count * 256);
        sb.AppendLine("{");
        for (int i = 0; i < count; i++)
        {
            sb.AppendLine($"    {(BodyNames)i}: {{")
                .AppendLine($"        x: {*(NBodyVector->X + i)},")
                .AppendLine($"        y: {*(NBodyVector->Y + i)},")
                .AppendLine($"        z: {*(NBodyVector->Z + i)},")
                .AppendLine($"       vx: {*(NBodyVector->VX + i)},")
                .AppendLine($"       vy: {*(NBodyVector->VY + i)},")
                .AppendLine($"       vz: {*(NBodyVector->VZ + i)},")
                .AppendLine($"     mass: {*(NBodyVector->Mass + i)}")
                .AppendLine($"        }},");
        }
        sb.AppendLine("}");
        return sb.ToString();
    }

    public static string DumpBodies(Body* bodies, int count)
    {
        StringBuilder sb = new StringBuilder(count * 256);
        sb.AppendLine("{");
        for (int i = 0; i < count; i++)
        {
            ref Body b = ref bodies[i];
            sb.AppendLine($"    {(BodyNames)i}: {{")
                .AppendLine($"        x: {b.x},")
                .AppendLine($"        y: {b.y},")
                .AppendLine($"        z: {b.z},")
                .AppendLine($"       vx: {b.vx},")
                .AppendLine($"       vy: {b.vy},")
                .AppendLine($"       vz: {b.vz},")
                .AppendLine($"     mass: {b.mass}")
                .AppendLine($"        }},");
        }
        sb.AppendLine("}");
        return sb.ToString();
    }
}

[StructLayout(LayoutKind.Explicit)]
public unsafe struct Body
{
    public const double Pi = 3.141592653589793;
    public const double SolarMass = 4 * Pi * Pi;
    public const double DaysPerYear = 365.24;

    [FieldOffset(0)]
    public double x;
    [FieldOffset(1 * sizeof(double))]
    public double y;
    [FieldOffset(2 * sizeof(double))]
    public double z;
    [FieldOffset(3 * sizeof(double))]
    public double filler;
    [FieldOffset(4 * sizeof(double))]
    public double vx;
    [FieldOffset(5 * sizeof(double))]
    public double vy;
    [FieldOffset(6 * sizeof(double))]
    public double vz;
    [FieldOffset(7 * sizeof(double))]
    public double mass;

    public void offsetMomentum(double px, double py, double pz)
    {
        vx = -px / SolarMass;
        vy = -py / SolarMass;
        vz = -pz / SolarMass;
    }
};

[StructLayout(LayoutKind.Sequential, Pack = 16)]
public struct R
{
    //[FieldOffset(0)]
    public double dx;
    //[FieldOffset(1 * sizeof(double))]
    public double dy;
    //[FieldOffset(2 * sizeof(double))]
    public double dz;
    //[FieldOffset(3 * sizeof(double))]
    public double filler;
};
