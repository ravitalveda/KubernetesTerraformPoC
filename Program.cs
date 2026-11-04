var builder = WebApplication.CreateBuilder(args);

// Add health checks for Kubernetes probes
builder.Services.AddHealthChecks();

var app = builder.Build();

// Native Kubernetes health endpoints
app.MapHealthChecks("/health/live");
app.MapHealthChecks("/health/ready");

// Root endpoint returning app status
app.MapGet("/", () => new {
    environment = app.Environment.EnvironmentName,
    message = "Hello from .NET 10 Platform Architecture PoC!",
    timestamp = DateTime.UtcNow
});

app.Run();