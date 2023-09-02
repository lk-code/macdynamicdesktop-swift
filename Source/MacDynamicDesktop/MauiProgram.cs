using System.Reflection;
using CommunityToolkit.Maui;
using FluentMAUI.Configuration;
using FluentMAUI.UI;
using Microsoft.Extensions.Logging;

namespace MacDynamicDesktop;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .UseMauiCommunityToolkit()
            .UseFluentConfiguration(options =>
            {
                options.LoadAppsettingsFrom = Assembly.GetExecutingAssembly();
            })
            .UseFluentUi(options =>
            {
                
            })
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            });

#if DEBUG
        builder.Logging.AddDebug();
#endif
        
        // add views and viewmodels
        builder.Services.AddSingleton<Views.OverviewPage>();
        builder.Services.AddSingleton<ViewModels.OverviewViewModel>();

        return builder.Build();
    }
}