using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Text.Json;

// Modern C# record type
public record Player(string Name, int Level, double Score, DateTime JoinDate)
{
    public string Rank => Score switch
    {
        >= 1000 => "🏆 Master",
        >= 500 => "⭐ Expert", 
        >= 100 => "🎯 Advanced",
        _ => "🌱 Beginner"
    };
    
    public bool IsVeteran => DateTime.Now - JoinDate > TimeSpan.FromDays(30);
}

// Game statistics class
public class GameStats
{
    private List<Player> players = new();
    private Random random = new();
    
    // Async method to simulate loading players
    public async Task LoadPlayersAsync(int count)
    {
        Console.WriteLine($"🎮 Loading {count} players...");
        
        string[] names = { "Alex", "Jordan", "Casey", "Morgan", "Riley", "Quinn", "Sage", "Rowan" };
        
        for (int i = 0; i < count; i++)
        {
            // Simulate network delay
            await Task.Delay(100);
            
            var player = new Player(
                Name: $"{names[random.Next(names.Length)]}{random.Next(100, 999)}",
                Level: random.Next(1, 51),
                Score: random.NextDouble() * 1500,
                JoinDate: DateTime.Now.AddDays(-random.Next(1, 100))
            );
            
            players.Add(player);
            
            // Show progress
            if ((i + 1) % 3 == 0)
            {
                Console.WriteLine($"   Loaded {i + 1}/{count} players...");
            }
        }
        
        Console.WriteLine("✅ All players loaded!\n");
    }
    
    // LINQ queries and advanced features
    public void AnalyzeData()
    {
        Console.WriteLine("📊 GAME ANALYTICS DASHBOARD");
        Console.WriteLine(new string('=', 50));
        
        // Basic statistics
        Console.WriteLine($"Total Players: {players.Count}");
        Console.WriteLine($"Average Level: {players.Average(p => p.Level):F1}");
        Console.WriteLine($"Highest Score: {players.Max(p => p.Score):F0}");
        Console.WriteLine($"Veterans: {players.Count(p => p.IsVeteran)}");
        
        Console.WriteLine("\n🏅 TOP 5 PLAYERS:");
        var topPlayers = players
            .OrderByDescending(p => p.Score)
            .Take(5)
            .Select((p, index) => new { Rank = index + 1, Player = p });
            
        foreach (var item in topPlayers)
        {
            Console.WriteLine($"   #{item.Rank} {item.Player.Name} - {item.Player.Score:F0} pts ({item.Player.Rank})");
        }
        
        Console.WriteLine("\n📈 RANK DISTRIBUTION:");
        var rankGroups = players
            .GroupBy(p => p.Rank)
            .OrderByDescending(g => g.Count());
            
        foreach (var group in rankGroups)
        {
            var percentage = (group.Count() * 100.0 / players.Count);
            var bar = new string('█', (int)(percentage / 5)); // Visual bar
            Console.WriteLine($"   {group.Key}: {group.Count()} players ({percentage:F1}%) {bar}");
        }
        
        Console.WriteLine("\n🎯 LEVEL ANALYSIS:");
        var levelStats = players
            .Where(p => p.Level >= 25) // High level players only
            .GroupBy(p => p.Level / 10 * 10) // Group by decade (20s, 30s, 40s)
            .Select(g => new { 
                LevelRange = $"{g.Key}-{g.Key + 9}", 
                Count = g.Count(),
                AvgScore = g.Average(p => p.Score)
            });
            
        foreach (var stat in levelStats.OrderBy(s => s.LevelRange))
        {
            Console.WriteLine($"   Level {stat.LevelRange}: {stat.Count} players, Avg Score: {stat.AvgScore:F0}");
        }
    }
    
    // Interactive mini-game
    public async Task PlayGuessingGameAsync()
    {
        Console.WriteLine("\n🎲 MINI-GAME: Guess the Player's Level!");
        Console.WriteLine("I'll describe a player, you guess their level (1-50)\n");
        
        for (int round = 1; round <= 3; round++)
        {
            var player = players[random.Next(players.Count)];
            
            Console.WriteLine($"Round {round}/3:");
            Console.WriteLine($"Player: {player.Name}");
            Console.WriteLine($"Score: {player.Score:F0}");
            Console.WriteLine($"Rank: {player.Rank}");
            Console.WriteLine($"Veteran: {(player.IsVeteran ? "Yes" : "No")}");
            
            Console.Write("Your guess (1-50): ");
            
            if (int.TryParse(Console.ReadLine(), out int guess))
            {
                int difference = Math.Abs(guess - player.Level);
                
                Console.WriteLine($"Actual Level: {player.Level}");
                
                string result = difference switch
                {
                    0 => "🎯 PERFECT! Exactly right!",
                    <= 2 => "🔥 Excellent! Very close!",
                    <= 5 => "👍 Good guess!",
                    <= 10 => "🤔 Not bad, getting warmer...",
                    _ => "❄️ Quite far off, but nice try!"
                };
                
                Console.WriteLine(result);
                
                // Simulate processing time
                await Task.Delay(1000);
            }
            else
            {
                Console.WriteLine("Invalid input! Skipping this round...");
            }
            
            Console.WriteLine();
        }
        
        Console.WriteLine("🎮 Mini-game complete! Thanks for playing!\n");
    }
    
    // Export data as JSON
    public void ExportToJson()
    {
        var summary = new
        {
            GeneratedAt = DateTime.Now,
            TotalPlayers = players.Count,
            Statistics = new
            {
                AverageLevel = players.Average(p => p.Level),
                AverageScore = players.Average(p => p.Score),
                HighestScore = players.Max(p => p.Score),
                VeteranCount = players.Count(p => p.IsVeteran)
            },
            TopPlayers = players
                .OrderByDescending(p => p.Score)
                .Take(3)
                .Select(p => new { p.Name, p.Level, Score = Math.Round(p.Score, 0), p.Rank })
        };
        
        var json = JsonSerializer.Serialize(summary, new JsonSerializerOptions 
        { 
            WriteIndented = true 
        });
        
        Console.WriteLine("📄 EXPORTED JSON DATA:");
        Console.WriteLine(json);
    }
}

// Main program
public class Program
{
    public static async Task Main(string[] args)
    {
        Console.WriteLine("🚀 Welcome to Advanced C# Gaming Analytics!");
        Console.WriteLine("Showcasing: Records, Pattern Matching, LINQ, Async/Await, JSON");
        Console.WriteLine(new string('=', 60));
        
        var gameStats = new GameStats();
        
        try
        {
            // Load data asynchronously
            await gameStats.LoadPlayersAsync(15);
            
            // Analyze with LINQ
            gameStats.AnalyzeData();
            
            // Interactive game
            await gameStats.PlayGuessingGameAsync();
            
            // Export data
            gameStats.ExportToJson();
            
            Console.WriteLine("\n✨ Features demonstrated:");
            Console.WriteLine("• Record types with computed properties");
            Console.WriteLine("• Pattern matching with switch expressions"); 
            Console.WriteLine("• Async/await programming");
            Console.WriteLine("• LINQ queries and grouping");
            Console.WriteLine("• JSON serialization");
            Console.WriteLine("• Interactive console input");
            Console.WriteLine("• Task delays and progress reporting");
            
        }
        catch (Exception ex)
        {
            Console.WriteLine($"❌ Error: {ex.Message}");
        }
        
        Console.WriteLine("\nPress any key to exit...");
        Console.ReadKey();
    }
}