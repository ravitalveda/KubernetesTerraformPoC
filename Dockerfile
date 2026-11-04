# Stage 1: Build/Publish
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY *.csproj ./
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /app/publish /p:UseAppHost=false

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080
COPY --from=build /app/publish .

# Security best practice: Run as non-root user
RUN useradd -u 10001 appuser && chown -R appuser:appuser /app
USER appuser

ENTRYPOINT ["dotnet", "KubernetesTerraformPoC.dll"]