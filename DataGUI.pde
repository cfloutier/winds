import controlP5.*;  //<>//


StyleGUI style_ui = new StyleGUI();
MainGUI main_ui = new MainGUI(); 
NoiseGUI noise_ui = new NoiseGUI();

class DataGUI
{

  void updateUI()
  {
    if (!data.changed)
      return;

    main_ui.update();
    noise_ui.update();
    style_ui.update();
  }

  void setupControls(ControlP5 cp5)
  { 
    cp5.addTab("Main");
    cp5.addTab("Noise");
    cp5.addTab("Style");
    
    main_ui.setupControls( cp5 );    
    noise_ui.setupControls( cp5 ) ;
    style_ui.setupControls( cp5 );   
    
    cp5.getTab("Main").bringToFront();
  }
  
  void setGUIValues()
  {
    style_ui.setGUIValues();
    main_ui.setGUIValues();
    noise_ui.setGUIValues();
  }
}
