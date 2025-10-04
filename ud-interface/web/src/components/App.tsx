import React from "react";
import "./App.css";
import { debugData } from "../utils/debugData";
import { useNuiEvent } from "../hooks/useNuiEvent";
import Notify from "./pages/notifications/Notify";
import CircularProgressbar from "./pages/progressbar/Progressbar";
import Statushud from "./pages/statushud/Statushud";

debugData([
  {
    action: "setVisible",
    data: true,
  },
]);

const App: React.FC = () => {
  useNuiEvent("setVisible", (data: any) => {});
  return (
    <div className="App">
      <Notify />
      <CircularProgressbar />
      <Statushud />
    </div>
  );
};

export default App;
