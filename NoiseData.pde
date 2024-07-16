


class NoiseData
{
    float perlinScale = 1;
  int scaleMul = 10;
  
  float total_scale()
  {
    return scaleMul*perlinScale/1000;
  }
  
  int seed; 
  int NoiseLod = 4;
  float NoiseFalloff = 0.5;
  
  int randomseed = 0;
  
  PVector pos = new PVector(0, 0);
  
  float moveSpeed = 1;
  
  void setSeed()
  {
    seed = (int) (millis()*1000);
  }
  
  void setRandomSeed()
  {
    randomseed = (int) (millis()*1000);
  }
  
  void LoadJson(JSONObject src)
  {  
    if (src == null)
      return;

    seed = src.getInt("seed", seed);
    
    randomseed = src.getInt("randomseed", randomseed);
    NoiseLod = src.getInt("NoiseLod", NoiseLod);
    NoiseFalloff = src.getFloat("NoiseFalloff", NoiseFalloff);
  
    perlinScale = src.getFloat("perlinScale", perlinScale);
    scaleMul = src.getInt("scaleMul", scaleMul);
    
    pos = new PVector(
      src.getFloat("pos_x", pos.x), 
      src.getFloat("pos_y", pos.y));
      
    moveSpeed = src.getFloat("moveSpeed", moveSpeed);
  }
  
  JSONObject SaveJson()
  {
    JSONObject dest = new JSONObject();

    dest.setFloat("perlinScale", perlinScale);
    dest.setInt("scaleMul", scaleMul);

    dest.setInt("seed", seed);
    dest.setInt("randomseed", randomseed);
    dest.setInt("NoiseLod", NoiseLod);
    dest.setFloat("NoiseFalloff", NoiseFalloff);
    
    dest.setFloat("pos_x", pos.x);
    dest.setFloat("pos_y", pos.y);
    
    dest.setFloat("moveSpeed", moveSpeed);

    return dest;
  }
}



class NoiseGUI extends GUIPanel
{

  NoiseData noisedata;

  Slider perlinScale;
  Slider scaleMul;

  Button seedBt;
  Button randomseedBt;
  
  Textlabel seedLabel;
  Textlabel randomseedLabel;
  

  Slider NoiseLod;
  Slider NoiseFalloff;
  Slider moveSpeed;

  void setGUIValues()
  {
    perlinScale.setValue(noisedata.perlinScale);
    scaleMul.setValue(noisedata.scaleMul);
    seedLabel.setText("seed : " + noisedata.seed);
    randomseedLabel.setText("random seed : " + noisedata.randomseed);

    NoiseLod.setValue(noisedata.NoiseLod);
    NoiseFalloff.setValue(noisedata.NoiseFalloff);
    moveSpeed.setValue(noisedata.moveSpeed);
  }

  void setupControls(ControlP5 cp5)
  {
    super.Init("Noise", cp5);
    
    this.noisedata = data.noise;

    addLabel("Noise");

    perlinScale = addSlider("perlinScale", "Scale", noisedata, 0.01, 1, false);
    scaleMul = addIntSlider("scaleMul", "Multiplier", noisedata, 1, 100, false);

    //addLabel("Random");  

    seedLabel = addLabel("Random");

    seedBt = addButton("Set Noise seed");
    seedBt.plugTo(noisedata, "setSeed"); 
    
    randomseedLabel = addLabel("Random");
    
    randomseedBt = addButton("Set Random Seed");
    randomseedBt.plugTo(noisedata, "setRandomSeed"); 
    

    NoiseLod = addIntSlider("NoiseLod", "Noise Harmonics", noisedata, 1, 8, false);
    NoiseFalloff = addSlider("NoiseFalloff", "NoiseFalloff", noisedata, 0, 1, false);
    
    addLabel("Use Arrows to move");
    moveSpeed = addSlider("moveSpeed", "Move Speed", noisedata, 0, 2, false);
  }

  void update()
  {
    seedLabel.setText("seed : " + noisedata.seed);
    randomseedLabel.setText("random Seed : " + noisedata.randomseed);
  
  }
}
