class GRAD_enhancedDust {

	class client {
		file = grad-enhancedDust\functions\client;

		class adjustParams;
		class addEmitter;
		class initEmitters;
	};

	class server {
		file = grad-enhancedDust\functions\server;

		class autoInit { postInit = 1; };

	};
};