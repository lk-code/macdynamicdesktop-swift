using CommunityToolkit.Mvvm.ComponentModel;

namespace MacDynamicDesktop.SharedViewModels;

public partial class WallpaperArchiveViewModel : ObservableObject
{
    [ObservableProperty]
    string name = string.Empty;
    
    [ObservableProperty]
    string thumbnail = string.Empty;

    public WallpaperArchiveViewModel(string name,
        string thumbnail)
    {
        Name = name;
        Thumbnail = thumbnail;
    }
}