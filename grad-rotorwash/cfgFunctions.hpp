class GRAD_rotorwash {

	class client {
		file = grad-rotorwash\functions\client;

		class adjustParams {};
		class clientLoop {};
		class createLingerEmitter {};
		class createStoneEmitter {};
		class createWashEmitter {};
		class emitterActivate {};
		class emitterDeactivate {};
		class hideEmitter {};
		
	};

	class server {
		file = grad-rotorwash\functions\server;
		
		class addVehicle {};
		class autoInit { postinit = 1; };
		class getSurfaceColor {};
		class getWashOrigin {};
		class isActive {};
		class removeVehicle {};
		class serverLoop {};

	};
};