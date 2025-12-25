using System;
using System.Diagnostics;
using System.IO;
using Andastra.Parsing.Formats.TPC;
using Andastra.Parsing.Resource;

class TestKaitaiValidation
{
    static void Main()
    {
        Console.WriteLine("Testing Kaitai parser validation...");

        // Create a test TPC file
        var testTpc = CreateTestTPC();
        byte[] tpcBytes = TPCAuto.BytesTpc(testTpc, ResourceType.TPC);
        string tempFile = Path.Combine(Path.GetTempPath(), "test_kaitai_tpc.tpc");

        try
        {
            File.WriteAllBytes(tempFile, tpcBytes);
            Console.WriteLine($"Created test TPC file: {tempFile}");

            // Run the validation script
            string validationScript = Path.Combine(
                Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location),
                "validate_kaitai_parser.py");

            if (!File.Exists(validationScript))
            {
                Console.WriteLine($"Validation script not found: {validationScript}");
                return;
            }

            var processInfo = new ProcessStartInfo
            {
                FileName = "python",
                Arguments = $"\"{validationScript}\" \"{tempFile}\"",
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                UseShellExecute = false,
                CreateNoWindow = true
            };

            using (var process = Process.Start(processInfo))
            {
                if (process != null)
                {
                    string stdout = process.StandardOutput.ReadToEnd();
                    string stderr = process.StandardError.ReadToEnd();
                    process.WaitForExit();

                    Console.WriteLine("Validation Results:");
                    Console.WriteLine(stdout);

                    if (!string.IsNullOrEmpty(stderr))
                    {
                        Console.WriteLine("Errors:");
                        Console.WriteLine(stderr);
                    }

                    if (process.ExitCode == 0)
                    {
                        Console.WriteLine("SUCCESS: Kaitai parser validation passed!");
                    }
                    else
                    {
                        Console.WriteLine($"FAILED: Validation failed with exit code {process.ExitCode}");
                    }
                }
            }
        }
        finally
        {
            if (File.Exists(tempFile))
            {
                File.Delete(tempFile);
            }
        }
    }

    static TPC CreateTestTPC()
    {
        var tpc = new TPC();
        tpc.AlphaTest = 0.5f;
        tpc.IsCubeMap = false;
        tpc.IsAnimated = false;

        byte[] testData = new byte[64 * 64 * 4]; // RGBA format, 64x64 pixels
        tpc.SetSingle(testData, TPCTextureFormat.RGBA, 64, 64);

        var layer = new TPCLayer();
        int width = 64;
        int height = 64;
        int bytesPerPixel = 4; // RGBA
        byte[] textureData = new byte[width * height * bytesPerPixel];

        // Fill with simple pattern
        for (int i = 0; i < textureData.Length; i += bytesPerPixel)
        {
            textureData[i] = 255;     // R
            textureData[i + 1] = 128; // G
            textureData[i + 2] = 64;  // B
            textureData[i + 3] = 255; // A
        }

        var mipmap = new TPCMipmap(width, height, TPCTextureFormat.RGBA, textureData);
        layer.Mipmaps.Add(mipmap);
        tpc.Layers.Add(layer);

        return tpc;
    }
}
