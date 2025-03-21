---
title: FuGetGallery
emoji: 🔥
colorFrom: purple
colorTo: indigo
sdk: docker
pinned: false
license: mit
short_description: An alternative web UI for browsing nuget packages
---

[FuGet Gallery](https://5cover-fugetgallery.hf.space/)

This site is a nuget package browser combined with an API browser. The package browser uses the nuget.org API to display all the packages in their index. The API browser combines the XML documentation and the metadata of the package's assemblies to help you explore and learn. Try the API search box to quickly find code, and use the code tab to see how the library works. You can also diff two package versions to see what's changed.

## Running

This is a standard ASP.NET Core app that can be run with:

```bash
ASPNETCORE_ENVIRONMENT=Development dotnet watch run
```
