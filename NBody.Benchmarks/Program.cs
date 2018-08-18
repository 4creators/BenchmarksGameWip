using System;
using System.Collections.Generic;
using System.Text;
using BenchmarkDotNet.Running;

namespace NBody.Benchmarks
{
    public class Program
    {
        static void Main(string[] args)
        {
            var summary = BenchmarkRunner.Run<NBodyBenchInitialize>();
        }
    }
}
