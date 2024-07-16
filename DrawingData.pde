import controlP5.*; 


class DrawingData
{
  String name = "";

  // this field is modified by the UIPanel
  // on any UI change
  boolean changed = true;
  
  PVector move = new PVector(0, 0);

  Style style = new Style();
  MainData main = new MainData();
  NoiseData noise = new NoiseData();

  float width = 800;
  float height = 600;

  void setSize(float width, float height)
  {
    if (this.width != width)
    {
      changed = true;
      this.width = width;
    }

    if (this.height != height)
    {
      changed = true;
      this.height = height;
    }
  }

  void LoadJson(String path)
  {
    print("path" + path);
    
    JSONObject json = loadJSONObject(path);

    main.LoadJson(json.getJSONObject("Main"));
    noise.LoadJson(json.getJSONObject("Noise"));
    style.LoadJson(json.getJSONObject("Style"));
  }

  void SaveJson(String path)
  {
    JSONObject json = new JSONObject();

    json.setJSONObject("Style", style.SaveJson());
    json.setJSONObject("Main", main.SaveJson());
    json.setJSONObject("Noise", noise.SaveJson());

    saveJSONObject(json, path);
  }
}
