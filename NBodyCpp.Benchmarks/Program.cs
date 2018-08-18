using System.Diagnostics;
using BenchmarkDotNet.Running;

namespace NBodyCpp.Benchmarks
{
    class Program
    {
        static void Main(string[] args)
        {
            Process.GetCurrentProcess().PriorityClass = ProcessPriorityClass.RealTime;
            var summary = BenchmarkRunner.Run<NBodyBench>(new CoreClrConfig());
        }
    }
}
