# Use the official ASP.NET Core runtime as the base image
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Use the official .NET SDK as the build environment
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["FuGetGallery.csproj", "./"]
RUN dotnet restore

# Copy the rest of the application files and build the project
COPY . .
RUN dotnet publish -c Release -o /app/publish

# Install libcap for setcap
RUN apt-get update && apt-get install -y libcap2-bin

# Allow the app to bind to low ports
RUN setcap 'cap_net_bind_service=+ep' "$(readlink -f "$(which dotnet)")"

# Create the final image with the built app
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "FuGetGallery.dll"]
