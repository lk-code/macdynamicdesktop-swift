using MacDynamicDesktop.ViewModels;

namespace MacDynamicDesktop.Views;

public partial class OverviewPage : ContentPage
{
    private readonly OverviewViewModel _viewModel;
    
    public OverviewPage(OverviewViewModel viewModel)
    {
        InitializeComponent();
        
        BindingContext = _viewModel = viewModel;
    }

    // private void Button_OnClicked(object sender, EventArgs e)
    // {
    //     var secondWindow = new Window {Page = new OverviewPage(_viewModel){}};
    //
    //     secondWindow.MinimumHeight = 800;
    //     secondWindow.MinimumWidth = 600;
    //
    //     Application.Current.OpenWindow(secondWindow);
    // }
}