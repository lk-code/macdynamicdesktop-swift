using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Extensions.Configuration;

namespace MacDynamicDesktop.SharedViewModels;

public abstract partial class OverviewViewModelBase : ObservableObject
{
    private readonly IConfiguration _configuration;

    [ObservableProperty]
    ObservableCollection<WallpaperArchiveViewModel> _wallpaperCollection = new();

    [ObservableProperty]
    WallpaperArchiveViewModel? _selectedWallpaper = null;

    protected OverviewViewModelBase(IConfiguration configuration)
    {
        _configuration = configuration ?? throw new ArgumentNullException(nameof(configuration));
    }

    [RelayCommand]
    public async Task OnViewAppearingAsync(CancellationToken cancellationToken)
    {
        // TODO: load data
        this.WallpaperCollection.Clear();
        
        this.WallpaperCollection.Add(new WallpaperArchiveViewModel("Windows 10",
            "/Users/larskramer/Downloads/Windows10.jpg"));
        this.WallpaperCollection.Add(new WallpaperArchiveViewModel("Windows 11",
            "/Users/larskramer/Downloads/Windows11.jpg"));
        this.WallpaperCollection.Add(new WallpaperArchiveViewModel("macOS",
            "/Users/larskramer/Downloads/Rider.png"));
        
        this.SelectedWallpaper = this.WallpaperCollection[1];
    }
}