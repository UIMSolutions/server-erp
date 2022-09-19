import vibe.vibe;
import servers.erp;

mixin DefaultConfig!("server-erp");
mixin ReadConfig;
void main(string[] args) {
  readConfig();
  mixin GetoptConfig;
  
	auto router = new URLRouter;	
  mixin(SetRouterDefault!());

  auto app = serverErp;
  app.repository(OOPRepository(dbString).connect);
	app.rootPath("/").registerApp(router);

	router
		.get("/login", &app.login.request)
		.get("/logout", &app.logout.request);

  mixin(SetHTTP!());
	runApplication();
}