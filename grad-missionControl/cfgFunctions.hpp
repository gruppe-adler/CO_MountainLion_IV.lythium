class grad_missionControl {

	class client {
		  file = grad-missionControl\functions\client;

      class addModules;
      class addVehicleMarker;
      class createBloodEffect;
      class droneFeed;
      class dropZeusEars;
      class setMyFrequency;
      class setGroupFrequencies;
      class stopMusic;
  };

	class server {
		  file = grad-missionControl\functions\server;

      class addApacheDestruction;
      class addFortifications;
      class addIntel;
      class alertUnits;
      class createChairCircle;
      class createTruckReinforcements;
      class despawn;
      class destroyTires;
      class disableChargeMode;
      class enableChargeMode;
      class fapper;
      class fillSupplyBox;
      class getPosInCircle;   
      class isInsideHouse;
      class ownerShipHandler { postInit = 1; };
      class readIntel;
      class sitDown;
  };
};