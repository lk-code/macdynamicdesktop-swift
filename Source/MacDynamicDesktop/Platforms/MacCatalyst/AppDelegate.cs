using Foundation;

namespace MacDynamicDesktop;

[Register("AppDelegate")]
public class AppDelegate : MauiUIApplicationDelegate
{
    protected override MauiApp CreateMauiApp() => MauiProgram.CreateMauiApp();
}

[Register("SceneDelegate")]
public class SceneDelegate : MauiUISceneDelegate
{
}