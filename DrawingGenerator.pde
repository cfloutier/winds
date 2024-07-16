//<>// //<>// //<>// //<>// //<>//

class Line
{
  ArrayList<PVector> points = new ArrayList<PVector>();

  void draw()
  {
    current_graphics.noFill();
    current_graphics.beginShape();

    for (int i = 0; i < points.size(); i++)
    {
      PVector pA = points.get(i);
      current_graphics.vertex(pA.x, pA.y);
    }

    current_graphics.endShape();
  }

  float height(float x, float y)
  {
    return noise((x-width/2) * data.noise.total_scale()+ data.noise.pos.x, (y-height/2) * data.noise.total_scale() + data.noise.pos.y );
  }

  PVector dir(float x, float y)
  {
    /* float deltax = height(x-1, y) - height(x+1, y);
     float deltay = height(x, y-1) - height(x, y+1);
     
     PVector deltaV = new PVector(deltax, deltay);
     
     PVector tangent = deltaV.cross(new PVector(0,0,1));*/

    // return tangent.mult(100);

    float angle = height(x, y)*TWO_PI*data.main.curvitude;
    // print(height(x, y));

    return new PVector(cos(angle)*data.main.len_step, sin(angle)*data.main.len_step);
  }

  void build()
  {
    PVector pA = new PVector(random(0, width), random(0, height));
    points.add(pA);
    for (int index = 0; index < data.main.NbSteps; index ++)
    {
      PVector dir = dir(pA.x, pA.y);

      //dir = new PVector(random(-50,50) , random(-50,50));

      pA = PVector.add(pA, dir);

      //pA.add(dir);

      points.add(pA);

      if (pA.x > width || pA.y > height || pA.x < 0 || pA.y <0)
        break;
    }

    //  println("--------");
  }
}

class DrawingGenerator
{
  DrawingData data;

  PVector center = new PVector(400, 400);

  ArrayList<Line> lines = new ArrayList<Line>();

  // called only on UI or key pressed
  // build a the object to render
  void update()
  {
    lines.clear();
    noiseSeed(data.noise.seed);
    noiseDetail(data.noise.NoiseLod, data.noise.NoiseFalloff);

    randomSeed(data.noise.randomseed);

    if (data.main.NbLines < 1)
      data.main.NbLines = 1;

    int NbLines = data.main.NbLines;

    for (int index = 0; index < NbLines; index++)
    {
      Line l = new Line();
      l.build();
      lines.add(l);
    }
  }

  void draw()
  {
    boolean needUpdate = false;

    if (data.changed)
    {
      needUpdate = true;
      data.changed = false;
    }

    if (checkMove())
      needUpdate = true;

    if (needUpdate)
      update();

    for (int index= 0; index < lines.size(); index++)
    {
      lines.get(index).draw();
    }
  }
}
