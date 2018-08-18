using System;
using System.Runtime.InteropServices;
using BenchmarkDotNet.Attributes;

namespace NBodyCpp.Benchmarks
{
    public unsafe class NBodyBench
    {
        private Body* bodyPtr;
        public BodyVector* nBodyPtr;
        public IntPtr nBodyPP;
        public R* rPtr;
        public RS* rsPtr;
        public double* magPtr;
        public NBodySystem bodySystem;

        [GlobalSetup]
        public void BenchSetup()
        {
            bodyPtr = (Body *) Marshal.AllocHGlobal(Marshal.SizeOf<Body>() * 6);
            rsPtr = (RS*)Marshal.AllocHGlobal(3 * 1024 * sizeof(double));
            nBodyPP = Marshal.AllocHGlobal(Marshal.SizeOf<BodyVector>() * 12);
            nBodyPtr = (BodyVector*)((ulong)nBodyPP - ((ulong)nBodyPP + 16) % 16);
            rPtr = (R*)Marshal.AllocHGlobal(Marshal.SizeOf<R>() * 1024);
            magPtr = (double*) Marshal.AllocHGlobal(sizeof(double) * 1024);
            bodySystem = new NBodySystem(bodyPtr);
            NBodySystem.Initialize(nBodyPtr);
        }

        [GlobalCleanup]
        public void BenchTearDown()
        {
            Marshal.FreeHGlobal((IntPtr)bodyPtr);
            Marshal.FreeHGlobal(nBodyPP);
            Marshal.FreeHGlobal((IntPtr)rPtr);
            Marshal.FreeHGlobal((IntPtr)rsPtr);
            Marshal.FreeHGlobal((IntPtr)magPtr);
        }

        [Benchmark()]
        public void AdvanceStaticIntr2()
        {
            NBodySystem.AdvanceStaticIntr2(0.01, rPtr, magPtr, ref bodySystem);
        }

        [Benchmark(Baseline = true)]
        public void Advance()
        {
            bodySystem.Advance(0.01, rPtr, magPtr);
        }

        [Benchmark()]
        public void AdvanceStaticIntr1()
        {
            NBodySystem.AdvanceStaticIntr1(0.01, rPtr, magPtr, ref bodySystem);
        }

        //[Benchmark()]
        //public void AdvanceStaticIntrSoa()
        //{
        //    NBodySystem.AdvanceStaticIntrSoa(0.01, rsPtr, magPtr);
        //}
    }
}
