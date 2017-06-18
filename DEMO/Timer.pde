class Timer
{
  
  long startTime ; // time in msecs that timer started
  long timeSoFar ; // use to hold total time of run so far, useful in
  // conjunction with pause and continueRunning
  boolean running ;
  int x, y ; // location of timer output
  Timer(int inX, int inY, long tempTotalTime)
  {
     x = inX ;
     y = inY ;
     running = false ;
     timeSoFar = tempTotalTime ;
  }
  int currentTime()
  { 
     if ( running )
        return ( (int) ( (millis() - startTime) / 1000.0) ) ;
     else
        return ( (int) (timeSoFar / 1000.0) ) ;
  }
  void start()
  {
     running = true ;
     startTime = millis() ;
  }
  
  boolean isFinished(){
    int passedTime =(int)((millis() - startTime));
       if(passedTime > timeSoFar){
         return true;
       }
       else{
         return false;
       }
    }

  void restart()
  // reset the timer to zero and restart, identical to start
  {
     start() ;
  }
  void pause()
  {
     if (running)
     {
        timeSoFar = millis() - startTime ;
        running = false ;
     }
// else do nothing, pause already called
  }
  void continueRunning()
// called after stop to restart the timer running
// no effect if already running
  {
    if (!running)
    {
        startTime = millis() - timeSoFar ;
        running = true ;
    }
  }
  void DisplayTime()
  {
    background(0);
     int theTime ;
     String output = "";
     theTime = currentTime() ;
     output = output + theTime ;
     // println("output = " + output) ;
     fill(150,0,200) ;
     PFont font ;
     font = loadFont("Arial-Black-48.vlw") ;
     textFont(font) ;
     text(output,x,y) ;
  }
}