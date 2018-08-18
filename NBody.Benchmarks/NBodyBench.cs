using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using BenchmarkDotNet.Attributes;

namespace NBody.Benchmarks
{
    public class NBodyBenchInitialize
    {
        private NBodyBench BenchStruct;
        private GCHandle handle;

        [Benchmark]
        public void NBodyHW_Initialize()
        {
            BenchStruct.NBodyHW_Initialize();
        }

        [Benchmark]
        public void NBodyBaseline_Initialize()
        {
            BenchStruct.NBodyBaseline_Initialize();
        }

        public NBodyBenchInitialize()
        {
        }

        [GlobalSetup]
        public void BenchSetup()
        {
            BenchStruct = new NBodyBench();
            GCHandle handle = GCHandle.Alloc(BenchStruct);
        }

        [GlobalCleanup]
        public void BenchTearDown()
        {
            handle.Free();
        }
    }

    [StructLayout(LayoutKind.Explicit)]
    public unsafe struct NBodyBench
    {
        [FieldOffset(0)]
        public fixed byte hwNBody[NBodyHWIntrinsics.NBody.NBodySize];

        [FieldOffset(0)]
        public NBodyHWIntrinsics.NBody* hwBodyPtr;

        [FieldOffset(NBodyHWIntrinsics.NBody.NBodySize + 8)]
        public fixed byte blNBody[5 * 7 * 8];

        [FieldOffset(NBodyHWIntrinsics.NBody.NBodySize + 8)]
        public NBodyBaseline.NBodyPtr2.NBody* blNBodyPtr;

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void NBodyHW_Initialize()
        {
            this.hwBodyPtr->Initialize(hwBodyPtr);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void NBodyBaseline_Initialize()
        {
            NBodyBaseline.NBodyPtr2.InitBodies(this.blNBodyPtr, (this.blNBodyPtr += 5));
        }
    }
}
