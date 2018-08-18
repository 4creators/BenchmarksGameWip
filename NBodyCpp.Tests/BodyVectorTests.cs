using System;
using Xunit;

namespace NBodyCpp.Tests
{
    public class BodyVectorTests
    {
        [Fact]
        public unsafe void Initialize()
        {
            double* bvPtr = stackalloc double[sizeof(BodyVector) / sizeof(double)];
            NBodySystem.Initialize((BodyVector*)bvPtr);
        }

        [Fact]
        public unsafe void InitializeVerify()
        {
            double* bvPtr = stackalloc double[sizeof(BodyVector) / sizeof(double)];
            NBodySystem.Initialize((BodyVector*)bvPtr);

            Body* bodies = stackalloc Body[5];
            NBodySystem bodySystem = new NBodySystem(bodies);

            var result = NBodySystem.DumpBodyVector(5);
            Assert.NotNull(result);

            var expected = NBodySystem.DumpBodies(bodies, 5);
            Assert.NotNull(expected);

            Assert.Equal(expected, result);
        }

        [Fact]
        public unsafe void AdvanceByOne()
        {
            double* bvPtr = stackalloc double[sizeof(BodyVector) / sizeof(double)];
            NBodySystem.Initialize((BodyVector*)bvPtr);

            Body* bodies = stackalloc Body[5];
            NBodySystem bodySystem = new NBodySystem(bodies);

            // Other data structures
            RS* rsaPtr = stackalloc RS[1];
            R* rPtr = stackalloc R[1024];
            double* magPtr = stackalloc double[1024];
            double* mag2Ptr = stackalloc double[1024];

            NBodySystem.AdvanceStaticIntrSoa(0.01, rsaPtr, magPtr);
            var result = NBodySystem.DumpBodyVector(5);

            NBodySystem.AdvanceStaticIntr2(0.01, rPtr, mag2Ptr, ref bodySystem);
            var expected = NBodySystem.DumpBodies(bodies, 5);

            Assert.Equal(expected, result);

        }
    }
}
