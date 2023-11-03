class Timer {
  

  Timer(float set) { // Constructor cuando creas un nuevo timer
    Time = set;
  }

  float getTime() { // te da el tiempo actual
    return(Time);
  }

  void setTime(float set) { // Le doy un valor cualquiera al timer
    Time = set;
  }
  void countUp() { // Actualiza el timer contando hacia abajo, trabaja llamandose desde void draw() para que trabaje
    Time += 0.5/frameRate;
  }
  void countDown() { // Actualiza el timer contando hacia abajo, trabaja llamandose desde void draw() para que trabaje
    Time -= 0.5/frameRate;
  }
  void countSum5() { //
    Time+=5;
  }
  void countSum4() { //
    Time+=4;
  }
  void countSum3() { //
    Time+=3;
  }
  void countSum2() { //
    Time+=2;
  }
}

class TimerPuntaje {

  

  TimerPuntaje(float set) { // Constructor cuando creas un nuevo timer
    Time2 = set;
  }
  float getTime() { // te da el tiempo actual
    return(Time2);
  }
  
  void countUpP() { // Actualiza el timer contando hacia abajo, trabaja llamandose desde void draw() para que trabaje
    Time2 += 0.5/frameRate;
  }
  void countDownP() { // Actualiza el timer contando hacia abajo, trabaja llamandose desde void draw() para que trabaje
    Time2 -= 0.5/frameRate;
  }
  
}
