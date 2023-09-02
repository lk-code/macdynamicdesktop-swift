using MacDynamicDesktop.SharedViewModels;
using Microsoft.Extensions.Configuration;

namespace MacDynamicDesktop.ViewModels;

public partial class OverviewViewModel : OverviewViewModelBase
{
    public OverviewViewModel(IConfiguration configuration)
        : base(configuration)
    {
    }
}