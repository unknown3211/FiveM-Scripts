import React, { useState, useEffect } from "react";
import "./App.css";
import { debugData } from "../utils/debugData";
import { useNuiEvent } from "../hooks/useNuiEvent";
import Svg2 from "./svg/Svg2";

debugData([
  {
    action: "setVisible",
    data: true,
  },
]);

const App: React.FC = () => {
  const [plate, setPlate] = useState<string>("");
  const [fuel, setFuel] = useState<number>(0);
  const [enginehealth, setEnginehealth] = useState<number>(0);
  const [bodyhealth, setBodyhealth] = useState<number>(0);
  const [vehtemp, setVehtemp] = useState<number>(0);
  const [tankhealth, setTankhealth] = useState<number>(0);
  const [displayName, setDisplayName] = useState<string>("");


  useNuiEvent("setVisible", (data: any) => { });

  useEffect(() => {
    const handleMessage = (event: any) => {
      if (event.data.action === "ShowData") {
        setPlate(event.data.data.plate);
        setFuel(Math.round(event.data.data.fuel));
        setEnginehealth(Math.round(event.data.data.engineHealth / 10));
        setBodyhealth(Math.round(event.data.data.bodyHealth / 10));
        setTankhealth(Math.round(event.data.data.tankHealth / 10));
        setVehtemp(Math.round(event.data.data.vehTemp));
        setDisplayName(event.data.data.displayName);
      }
    };
  
    window.addEventListener("message", handleMessage);
  
    return () => {
      window.removeEventListener("message", handleMessage);
    };
  }, []);

  return (
    <div id="root">
      <div className="app-container">
        <div className="side-background" />
        <div className="content-container">
          <div className="row-36">
            <div className="column-46">
              <div className="info-1">
                <div className="title-14">Vehicle</div>
                <div className="box-27">
                  <Svg2 />
                  Model: {displayName}
                  <br />
                  Plate: {plate}
                  <br />
                  Fuel: {fuel}%
                </div>
              </div>
              <div className="option-container">
                <div className="text-14">
                  <div className="title-22">Status</div>
                  <div className="description-30">
                    Current status of the parts
                  </div>
                </div>
                <div className="currentstatus-containerbox">
                  <div className="cs-line" />
                  <div className="cs-state">
                    <div className="description-30 status-list">
                      <div className="description-item">Engine Condition: {enginehealth}%</div>
                      <div className="description-item">Body Condition: {bodyhealth}%</div>
                      <div className="description-item">Tank Condition: {tankhealth}%</div>
                      <div className="description-item">Vehicle Temperature: {vehtemp}°F</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="footer-container">
        <div className="keybind-container">
          <div className="text-29">Exit</div>
          <div className="button-32">Escape</div>
        </div>
      </div>
    </div>
  );
};

export default App;