class GRAD_fortificationTransport {

	class client {
        file = grad-fortificationTransport\functions\client;

		class addInteraction;
        class configureUH60;
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