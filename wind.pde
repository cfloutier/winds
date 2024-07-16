import controlP5.*; //<>// //<>//
import processing.pdf.*;
import processing.dxf.*;
import processing.svg.*;


DrawingData data;
DataGUI dataGui;
DrawingGenerator drawer;

PGraphics current_graphics;
ControlP5 cp5;

String url = "https://pix10.agoda.net/hotelImages/5871009/-1/cc6a9504ad5eddf5c7e54f4f97b99922.jpg?s=1024x768";

PImage webImg;

void setup() 
{
  size(1200, 800);

  drawer =  new DrawingGenerator();
  data = new DrawingData();
  dataGui = new DataGUI();
  
  setupControls();

  // on startup default is saved
  // it can be saved with UI for overloading 
  data.LoadJson("./Saved/default.json");
  data.name = "default";

  dataGui.setGUIValues();
  surface.setResizable(true);
  
  surface.setResizable(true);
}

void setupControls()
{ 
  cp5 = new ControlP5(this); 
  cp5.getTab("default").setLabel("Hide GUI");

  dataGui.setupControls( cp5);     
  addFileTab();
  
  // Load image from a web server
  webImg = loadImage(url, "png");
}


void draw()
{
  start_draw();

  if (data.changed)
  {
    dataGui.updateUI();
  }
  
  drawer.center = new PVector(width/2, height/2);

  drawer.data = data;
  drawer.draw();

  end_draw();
}
