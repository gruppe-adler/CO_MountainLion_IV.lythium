class GRAD_fortificationTransport {

	class client {
        file = grad-fortificationTransport\functions\client;

		class addInteraction;
        class configureUH60;
        class addSpeedLimiter {postInit = 1;};
        class limitSpeed;
        class loadItem;
        class unloadItem;
    };

    class server {
        file = grad-fortificationTransport\functions\server;

        class addFortification;
        class configureForVehicle;
        class getAttachVector;
    };
};