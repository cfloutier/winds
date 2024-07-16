
class MainData
{

  int NbLines = 1;
  int NbSteps = 100;
  float len_step = 1;
  float curvitude = 1;

  void LoadJson(JSONObject src)
  {  
    if (src == null)
      return;

    NbLines = src.getInt("NbLines", NbLines); 
    NbSteps = src.getInt("NbSteps", NbSteps); 
    len_step = src.getFloat("len_step", len_step); 
    curvitude = src.getFloat("curvitude", curvitude); 
  }

  JSONObject SaveJson()
  {
    JSONObject dest = new JSONObject();

    dest.setInt("NbLines", NbLines);
    dest.setInt("NbSteps", NbSteps);
    dest.setFloat("len_step", len_step);
    dest.setFloat("curvitude", curvitude);



    return dest;
  }
}

class MainGUI extends GUIPanel
{
  MainData main;

  Slider NbLines;
  Slider NbSteps;
  Slider len_step;
  Slider curvitude;

  void setGUIValues()
  {
    NbSteps.setValue(main.NbSteps);
    NbLines.setValue(main.NbLines);
    len_step.setValue(main.len_step);
    curvitude.setValue(main.curvitude);

      
  }

  void setupControls(ControlP5 cp5)
  {
    super.Init("Main", cp5);

    main = data.main;

    addLabel("Lines");

    //addLabel("---------- Rotation");
    NbLines = addSlider("NbLines", "Nb Lines", main, 1, 5000, false);
    NbSteps = addSlider("NbSteps", "Nb Steps", main, 1, 200, false);
    len_step = addSlider("len_step", "lenght Steps", main, 0, 200, false);
    addLabel("Curvitude");
    curvitude = addSlider("curvitude", "Curvitude", main, 0, 10, false);

   
  }

  void update()
  {
  }
}
