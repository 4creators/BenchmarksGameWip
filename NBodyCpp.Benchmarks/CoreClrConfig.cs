using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Diagnosers;
using BenchmarkDotNet.Jobs;
using BenchmarkDotNet.Toolchains.CustomCoreClr;

namespace NBodyCpp.Benchmarks
{
    public class CoreClrConfig : ManualConfig
    {
        public CoreClrConfig()
        {
            var job = Job.MediumRun.With(
                CustomCoreClrToolchain.CreateBuilder()
                .UseCoreClrNuGet("3.0.0-preview1-26814-05", "https://dotnet.myget.org/F/dotnet-core/api/v3/index.json")
                .UseCoreFxNuGet("4.6.0-preview1-26814-05", "https://dotnet.myget.org/F/dotnet-core/api/v3/index.json")
                .TargetFrameworkMoniker("netcoreapp3.0")
                .DisplayName("Net Core 3.0")
                .RuntimeIdentifier("win-x64")
                .ToToolchain())
                .WithGcServer(true)
                .WithIterationCount(23)
                .WithLaunchCount(1)
                .WithWarmupCount(5);

            Add(job.With(
                new List<EnvironmentVariable>() {
                    new EnvironmentVariable("COMPlus_EnableAVX", "0"),
                    new EnvironmentVariable("COMPlus_TieredCompilation", "0")
                }));

            //DefaultConfig.Instance.With()
            Add(DefaultConfig.Instance.GetExporters().ToArray());
            Add(DefaultConfig.Instance.GetLoggers().ToArray());
            Add(DefaultConfig.Instance.GetColumnProviders().ToArray());

            var diagnoser = new DisassemblyDiagnoserConfig(
                printAsm: true, printSource: true, printPrologAndEpilog: true, recursiveDepth: 2);
            Add(DisassemblyDiagnoser.Create(diagnoser));
        }
    }
}
