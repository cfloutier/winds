void keyPressed() {

  if (key == CODED) {  
    if (keyCode == UP) 
       data.move.y = -1;
    else if (keyCode == DOWN)
      data.move.y = 1;
    else if (keyCode == LEFT)
      data.move.x = -1;
    else if (keyCode == RIGHT)
      data.move.x = 1;
  }
  else if (key == '-') {
    data.move.z = -1;
  }
  else if (key == '+') {
    data.move.z = 1;
  }
}  

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) 
      data.move.y = 0;
    else if (keyCode == DOWN)
      data.move.y = 0;
    else if (keyCode == LEFT)
      data.move.x = 0;
    else if (keyCode == RIGHT)
      data.move.x = 0;
   
  }
  else if (key == '-') {
    data.move.z = 0;
  }
  else if (key == '+') {
    data.move.z = 0;
  }
}



int lastUpdate  = 0;

boolean checkMove( )
{
  if (data.move.x != 0 || data.move.y != 0 || data.move.z != 0)
  {
    int delta_ms =  millis() - lastUpdate;
    data.noise.pos.x += data.move.x * delta_ms * data.noise.moveSpeed * data.noise.total_scale() ;
    data.noise.pos.y += data.move.y * delta_ms  * data.noise.moveSpeed *  data.noise.total_scale();     
    
    data.noise.perlinScale *= 1+0.001*data.move.z* delta_ms;
    
    noise_ui.setGUIValues();

    lastUpdate =  millis();

    return true;
  }


  lastUpdate =  millis();

  return false;
}    
