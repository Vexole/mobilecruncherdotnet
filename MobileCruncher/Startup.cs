using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MobileCruncher.Startup))]
namespace MobileCruncher
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
