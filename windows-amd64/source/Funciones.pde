void setupSimWave() { // SETUP DE LA SIMULACION DE LA ONDA

  //se rellena el vector de cuerda principal
  //cada elemento es un vector que contiene [posX, posY]
  cuerda = new int[pMax][2];
  inY = new int[pMax]; // vector desplazamientos de la cuerda en t-1
  reY = new int[pMax]; // vector desplazamientos de la cuerda en t+1
  cuerdaC = new int[pMax]; // vector desplazamientos de la cuerda en t

  cuerda[0] = new int[]{xInicial, 0};
  cuerdaC[0] = cuerda[0][1]; //cuerdaC y cuerda[i][1] siempre son iguales
  //reY[0] = 0;
  inY[0] = 0; //inicializacion en 0 necesaria para todos los vectores

  for (int i = 1; i<pMax; i++) {
    int previousX = cuerda[i-1][0];
    cuerda[i] = new int[]{previousX+pointRadius, 0};
    cuerdaC[i] = cuerda[0][1];
    inY[i] = 0;
    //reY[i] = 0;
    //se inicializa la cuerda tensa de forma recta, en la mitad de la pantalla
  }
}

void setupGameWave() {// SETUP DEL JUEGO DE LA SIMULACION DE LA ONDA

  cuerdaS = new int[pMax][2];
  cuerdaS[0] = new int[]{xInicial, height/2};

  for (int i = 1; i<pMax; i++) {
    int previousX = cuerda[i-1][0];
    cuerdaS[i] = new int[]{previousX+pointRadius, 0};
    //se inicializa la cuerda tensa de forma recta, en la mitad de la pantalla
  }
}

void setupSimVariables() { // INICIALIZACION DE VARIABLES DE LA FRECUENCIA LIBRE

  frec = 0;
  amp = 0;
  lon = 1;

  amp_sl.setValue(1);
  frec_sl.setValue(1);
  lon_sl.setValue(1);
}

void setupNormalesVariables() { // INICIALIZACION DE VARIABLES DE MODO NORMAL

  armo = armo_sl.getValueI();
  tens = tens_sl_2.getValueF();
  niu = dens_sl_2.getValueF();
  amp = amp_sl_2.getValueF();
  lon = 40;
  pointRadius = 20;
}

void setupGameVariables() {
  startTimer = new Timer(35);
  puntaje = 0000;


  pointRadius = 20;
  niuS=(int)random(20, 70);
  niuS/=100;
  frecS=1.5;
  tensS=(int)random(7, 35);
  ampS=(int)random(4, 9)*10;

  cpfinal=0000;

  niu=0.3;
  frec=1.5;
  tens=1;
  amp=5;
  lon = 50;

  // Point Radius Simulada definida por la densidad lineal

  pointRadiusS = calcRadius(niuS);
}



void refresh() { // SUBRUTINA PARA LA ACTUALIZACION DE LA FRECUENCIA LIBRE
  float vel = 1;
  float dt = 1;
  float dx = dt*vel;

  float aceleracion = 1/((damp*dt/2)+1);
  float C = vel*(dt/dx), Csq = C*C;

  //Condiciones de la ecuacion
  inY[0] = cuerda[0][1];
  cuerda[lon-1][1] = 0;
  cuerdaC[lon-1] = 0;

  for (int i=1; i<lon-1; i++) {
    reY[i] = (int) (aceleracion * ( ( (damp*dt/2) - 1 ) * inY[ i ] + (2*(1-Csq)) * cuerdaC[ i ] + Csq * ( cuerdaC[ i + 1 ] + cuerdaC[ i - 1 ] ) ));
    //a * ( ( beta - 1 ) * yPasada[ i ] + c * yActual[ i ] + alphaSq * ( yActual[ i + 1 ] + yActual[ i - 1 ] ) )
    //Implementacion original

    ////aceleracion * ( ( (amort*dt/2) - 1 ) * yPasada[ i ] + (2*(1-Csq)) * yActual[ i ] + Csq * ( yActual[ i + 1 ] + yActual[ i - 1 ] ) )
    //Implementacion empleada

    //implementacion de la ecuacion de onda sacada de la universidad de colorado:
    //https://github.com/phetsims/wave-on-a-string/tree/main
  }

  int oldNext = reY[lon-1];

  int[] old = inY;
  inY = cuerdaC;
  cuerdaC = reY;
  reY = old;

  inY[lon-1] = 0;
  cuerdaC[lon-1] = 0;
  reY[lon-1] = oldNext;

  //Manejo de vectores implementado por la universidad de colorado
  //Actualiza los datos de cada vector de estados: el vector actual pasa a ser el antiguo,
  //el nuevo pasa a ser el actual...
  //las variables old son auxiliares

  for (int i = 0; i<lon; i++) {
    cuerda[i][1] = cuerdaC[i];
  }
  //Se pasan los datos del vector actual a la matriz para ser dibujada
}

void oscilateSim(float sim_speed) { // SUBRUTINA OSCILADOR DE FRECUENCIA LIBRE

  frecang = TWO_PI*frec;

  int onInc = (int)(amp*Math.sin(Math.toRadians(theta)));
  theta=(theta+frecang*sim_speed);

  cuerda[0][1] = onInc;
  cuerdaC[0] = onInc;
  //cuerdaC[1] = onInc;
}

float getFrameTime(float currentTime) { // OBTIENE EL TIEMPO
  float newTime = millis();
  float frameTime = newTime-currentTime;
  return frameTime;
}

void dataScreen(GWindow window) { // MUESTRA  LA INFORMACION EN PANTALLA
  // GUI

  window.image(pantalla, 1050, 245);

  PFont f = createFont("Georgia", 16);
  window.textFont(f);
  window.textSize(16);

  String s = "         Lambda:\n        λ(m): "+df.format(lamb);

  window.text(s, 1085, 320);

  String a = " Vel. Propagacion:\n        v(m/s): "+df.format(vel);

  window.text(a, 1085, 370);
}

void drawSim(GWindow window) { // DIBUJA LAS ONDAS EN FRECUENCIA LIBRE

  //grafica de cuerda tensionada
  strokeWeight(2);

  for (int i=0; i<lon; i++) { // Visualizacion de las elipses que representan las funciones
    int[] punto = cuerda[i]; // Igualacion de vectores
    if (i>0) { //lineas entre puntos
      int[] previous = cuerda[i-1];
      window.fill(255);
      window.line(punto[0], punto[1]+height/2, previous[0], previous[1]+height/2);
    }

    window.fill(255, 0, 0);
    window.ellipse(punto[0], inY[i]+height/2, (pointRadius-5)*mostInci, (pointRadius-5)*mostInci);

    window.fill(0, 0, 255);
    window.ellipse(punto[0], reY[i]+height/2, (pointRadius-5)*mostRefl, (pointRadius-5)*mostRefl);

    window.fill(255);
    window.ellipse(punto[0], punto[1]+height/2, pointRadius, pointRadius);
    window.image(mano, cuerda[lon][0]-15, (height/2)-110);
  }
  //grafica de generador de frecuencia
  window.image(manoindice, 28, cuerda[0][1]+7+height/2);

  strokeWeight(10);
}

void drawNorm() { // DIBUJA LAS ONDAS EN MODO NORMAL

  //grafica de cuerda tensionada
  strokeWeight(2);

  for (int i=0; i<lon; i++) { // Visualizacion de las elipses que representan las funciones
    int[] punto = cuerda[i]; // Igualacion de vectores
    if (i>0) { //lineas entre puntos
      int[] previous = cuerda[i-1];
      Normales.fill(255);
      Normales.line(punto[0], punto[1]+height/2, previous[0], previous[1]+height/2);
    }

    Normales.fill(255, 0, 0);
    Normales.ellipse(punto[0], inY[i]+height/2, (pointRadius-5)*mostInci, (pointRadius-5)*mostInci);

    Normales.fill(0, 0, 255);
    Normales.ellipse(punto[0], reY[i]+height/2, (pointRadius-5)*mostRefl, (pointRadius-5)*mostRefl);

    Normales.fill(255);
    Normales.ellipse(punto[0], punto[1]+height/2, pointRadius, pointRadius);
    Normales.image(mano, cuerda[lon][0]-15, (height/2)-110);
  }
  //grafica de generador de frecuencia
  strokeWeight(10);
}

int calcpunt(int aux, Boolean ampli) { // CALCULO DEL PUNTAJE
  int sum = 0;
  if (aux>=0 && aux<=20) { // El aux es definido por el valor absoluto previamente calculado del intervalo
    if (aux==0) { // Si lo hizo perfecto
      if (ampli) {
        sum+=20;
      } else {
        sum+=150;
        val_timep+=5;
        limiteTiempo();
      }
    } else if (aux>0&&aux<6 ) { // Si lo hizo en un margen casi bueno
      if (ampli) {
        sum+=15;
      } else {
        sum+=90+aux*10;
        val_timep+=3;
        limiteTiempo();
      }
    } else if (aux>=6 && aux<11) { // Si lo hizo en un margen normal
      if (ampli) {
        sum+=10;
      } else {
        sum+=75;
        val_timep+=2;
        limiteTiempo();
      }
    } else if (aux>=11 && aux<16) { // Si lo hizo en un margen malo
      if (ampli) {
        sum+=5;
      } else {
        sum+=25;
        val_timep+=1;
        limiteTiempo();
      }
    } else if (aux>=16) { // :skull:
      if (ampli == false) {
        sum+=10;
      }
    }
    suma+=val_timep;
    Time+=val_timep;

    int dec = (int)random(0, 2);
    switch(dec) {
    case 0:
      niuS=(int)random(50, 70);
      niuS/=100;
      tensS=(int)random(5, 15);
      ampS=(int)random(5, 6)*10;
      break;

    case 1:
      niuS=(int)random(20, 35);
      niuS/=100;
      tensS=(int)random(15, 25);
      ampS=(int)random(7, 9)*10;
      break;

    case 2:
      niuS=(int)random(35, 50);
      niuS/=100;
      tensS=(int)random(25, 35);
      ampS=(int)random(6, 8)*10;
      break;
    }

    pointRadiusS = calcRadius(niuS);
  }

  return sum;
}

int calcRadius(double dens) { // Calculo del radio dependiendo de la densidad lineal, a mayor D.L. menor es el radio y viceversa
  int aux = (int)(dens*100);
  int radio = 0;

  if (aux>=0&&aux<10) { // Rango de 10 a 19
    radio=26;
  } else if (aux>=10&&aux<20) { // Rango de 10 a 19
    radio=24;
  } else if (aux>=20&&aux<30) { // Rango de 20 a 29
    radio=22;
  } else if (aux>=30&&aux<40) { // Rango de 30 a 39
    radio=20;
  } else if (aux>=40&&aux<50) { // Rango de 40 a 49
    radio=18;
  } else if (aux>=50&&aux<60) { // Rango de 50 a 59
    radio=16;
  } else if (aux>=60&&aux<=75) { // Rango de 60 a 70
    radio=14;
  }

  return radio;
}

void gameWaveSimulada() { // CALCULO DE LA ONDA DE LA COMPUTADORA


  velS=sqrt((float)(tensS/ niuS));

  lamS=velS/frecS;

  kS =((float)(2*Math.PI))/lamS;

  frecangS=velS * kS;


  for (int i=0; i<lon; i++) {
    double onda;

    onda =(int) (ampS * Math.sin(Math.toRadians(kS*(cuerdaS[lon-1-i][0]-xInicial)))*Math.sin(Math.toRadians(frecangS*frameCount)));

    cuerdaS[i][1] = (int) onda + height/2;
  }
}

void gameWaveRefresh() { // CALCULO DE LA ONDA DEL JUGADOR

  frec=frecS;
  //g/m
  vel=sqrt((float) (tens/ niu));
  //m/s
  lamb=vel/frec;
  //lamb = m
  k = ((float)(2*Math.PI))/lamb;
  //k = rad/m
  frecang=vel * k;
  //w = m/s * rad/m
  //w = rad/s
  //se calculan los valores de las propiedades como visto en el enunciado y libro guia

  for (int i=0; i<lon; i++) {
    // A(senkx)senwt
    double onda;

    onda = (int)(amp * Math.sin(Math.toRadians(k*(cuerda[lon-i-1][0]-xInicial)))*Math.sin(Math.toRadians(frecang*frameCount)));

    cuerda[i][1] = (int) onda + height/2;
  }
}


void gameDrawGUI() { // INTERFAZ GRAFICA EN LA PANTALLA DEL JUEGO

  // Timer
  startTimer.countDown();

  if (Time<=0) { // Cuando el tiempo es

    UserNScore[1][pI] = String.valueOf(puntaje);
    auxPuntaje = String.valueOf(puntaje);

    startTimer.countUp();
    Juego.noLoop();
    Juego.setVisible(false);

    Puntaje.setVisible(true);
    Puntaje.loop();
  }


  // GUI
  Juego.image(frecConst, 0, 0);

  Juego.image(manoindice, 28, cuerda[0][1]+7);

  // Strings en pantalla, puntaje, tiempo, lambdas y velocidades

  PFont f = createFont("Calibri Bold", 16);
  Juego.textFont(f);
  Juego.textSize(16);

  String s = ""+df.format(velS);

  Juego.text(s, 220, 145);

  String a = ""+df.format(lamS);

  Juego.text(a, 220, 170);

  String d = ""+df.format(vel);

  Juego.text(d, 430, 145);

  String e = ""+df.format(lamb);

  Juego.text(e, 430, 170);

  Juego.textSize(40);

  String pun = ""+dfP.format(puntaje);

  Juego.text(pun, 1070, 120);

  // Borrar los puntos luego de que pasen 3 segundos

  if (b==1) {

    startTimerPuntaje.countDownP();

    Juego.text("+"+aux, 1070, 170);

    Juego.text("+"+suma, 835, 170);

    if (startTimerPuntaje.getTime()<=0) {

      suma = 0;
      val_timep=0;

      Juego.fill(31, 69, 40);

      Juego.noStroke();

      Juego.rect(1070, 140, 100, 32);
      Juego.rect(835, 140, 70, 32);

      Juego.fill(255);

      startTimerPuntaje.countUpP();
    }
  }

  // Switch solo para cambiar el color


  auxtimeI=(int)(Time*100);

  switch((int)Time) {
  case 10:
  case 8:
  case 6:
  case 4:
  case 2:
  case 0:
    Juego.fill(255, 0, 0);
    break;
  }

  // Switch para escuchar un sonido de alarma al final
  switch(auxtimeI) {
  case 1100:
  case 900:
  case 700:
  case 500:
  case 300:
  case 100:
    alarm.trigger();
    break;
  }

  String st = ""+dfT.format(startTimer.getTime());

  Juego.text(st, 835, 120);
  Juego.fill(255);
}

void gameWavesDraw() { // DIBUJO DE LAS ONDAS DEL JUEGO TANTO DEL JUGADOR COMO DE LA COMPUTADORA

  // Variable Point Radius dependiendo de la densidad lineal

  calcRadius(niu);

  //grafica de cuerda tensionada
  strokeWeight(2);

  for (int i=0; i<lon; i++) { // Visualizacion de las elipses que representan las funciones
    int[] punto = cuerda[i];
    int[] puntoS = cuerdaS[i];
    // Igualacion de vectores
    if (i>0) { //lineas entre puntos
      int[] previous = cuerda[i-1];
      int[] previouS = cuerdaS[i-1];

      Juego.stroke(243, 159, 90);
      Juego.line(puntoS[0], puntoS[1], previouS[0], previouS[1]);
      Juego.stroke(255);
      Juego.line(punto[0], punto[1], previous[0], previous[1]);
      Juego.stroke(0);
    }

    // Simulacion
    Juego.fill(144, 144, 144);

    Juego.ellipse(puntoS[0], puntoS[1], pointRadiusS, pointRadiusS);
    // Original

    Juego.fill(255);

    Juego.ellipse(punto[0], punto[1], pointRadius, pointRadius);
  }

  strokeWeight(10);
}

void jugar() { // INICIALIZA TODAS LAS SUBRUTINAS CUANDO SE VA A LA VENTANA JUGAR

  setupGameVariables();
  setupSimWave();
  setupGameWave();

  startTimer.countDown();
  Juego.loop();
  Juego.setVisible(true);
}


void indice() { // CALCULO DEL INDICE DEL GIF
  bor = frameCount - p;
  if (bor>=8) {
    p = frameCount;
    pumindex = (pumindex+1)%gif_frec_2.length;
    ampindex = (ampindex+1)%gif_amp.length;
    tensindex = (tensindex+1)%gif_tens.length;
    menuindex = (menuindex+1)%gif_menu.length;
  }
}

void loadMedia() { // SE CARGA TODOS LOS ARCHIVOS NECESARIOS PARA EL PROGRAMA
  // Audio
  minim = new Minim(this);

  player = minim.loadFile("camargopff.wav");
  bombo = minim.loadSample("BD.mp3", 512);
  btn = minim.loadSample("boton.wav", 250);
  btn2 = minim.loadSample("boton2.wav", 250);
  ring = minim.loadFile("ring.wav");
  verifi = minim.loadSample("verifie.wav");
  alarm = minim.loadSample("sonidoalarm.wav");

  // Imagenes
  frecConst = loadImage("frecConst.png");
  fondo = loadImage("Ondas.png");
  mano = loadImage("mano.png");
  manoindice = loadImage("manoindice.png");
  pantalla = loadImage("pantalla.png");
  menu= loadImage("menu.png");
  CSJ1= loadImage("CSJ1.png");
  CSJ2= loadImage("CSJ2.png");
  CSJ3= loadImage("CSJ3.png");
  pun = loadImage("puntaje.png");
  rod= loadImage("lambda.png");
  mod= loadImage("modos.png");
  fondo_armo= loadImage("fondo_armonico.png");
  userGUI = loadImage("user.png");
  ldb = loadImage("leaderboard.png");

  // Gifs
  for (pum=0; pum<5; pum++) {
    gif_frec_1[pum] = loadImage("ayudaf"+pum+".png");
    gif_frec_2[pum] = loadImage("ayudafrec"+pum+".png");
    gif_niu[pum] = loadImage("ayudad"+pum+".png");
  }
  for (pum = 0; pum<14; pum++) {
    gif_amp[pum]= loadImage("ayudaA"+pum+".png");
  }
  for (pum = 0; pum<8; pum++) {
    gif_tens[pum] = loadImage("ayudat"+pum+".png");
  }
  for (pum = 0; pum<6; pum++) {
    gif_menu[pum] = loadImage("menu"+pum+".png");
  }
}

void limpiar() { // Limpia los text areas en el Juego para que no se muestren con los valores anteriores
  Juego.noStroke();
  Juego.fill(31, 69, 40);

  Juego.rect(1070, 140, 100, 32);
  Juego.rect(835, 140, 70, 32);

  t_amp.setText("5.0");
  t_niu.setText("0.3");
  t_tens.setText("1.0");
}

void limiteTiempo() { // Se crea una subrutina reutilizable para el limite de tiempo asignado en el Juego (45)
  if (Time>=31) {
    val_timep=(int)(40-Time);
  }
}



void NormalWaveRefresh() { // ACTUALIZACION DE LA ONDA DE MODO NORMAL

  // Longitud Constante y Frecuencia Calculada
  lon = 40;
  vel = sqrt(tens/niu);
  lamb= ((float) (2*lon)/ (float) (armo));
  frec = vel/lamb;
  k = 3*((TWO_PI)/lamb);
  frecang = TWO_PI*frec;

  for (int i = 0; i<lon; i++) {//propagar onda incidente, se mueve de izq. a derecha
    double onInc = (amp * Math.sin(Math.toRadians(k*(cuerda[lon-i-1][0]-xInicial)
      + frecang*(millis()))));
    inY[i] = (int) onInc;

    double onRef = (amp * Math.sin(Math.toRadians(k*(cuerda[lon-i-1][0]-xInicial) -
      frecang*(millis()))));
    reY[i] = (int) onRef;

    int onda = (int)(onInc + onRef);

    cuerda[i][1] = onda;
  }
}

void leaderboard() {
  String top1, top2, top3, top_pI, top, p1, p2, p3, p_pI, p;

  PFont f = createFont("Calibri Bold", 50);
  Leaderboard.textFont(f);
  Leaderboard.textSize(50);

  top1=UserNScore[0][0];
  top2=UserNScore[0][1];
  top3=UserNScore[0][2];
  top_pI=UserNScore[0][pI];
  top=UserNScore[0][pos];

  p1=UserNScore[1][0];
  p2=UserNScore[1][1];
  p3=UserNScore[1][2];
  p_pI=UserNScore[1][pI];
  p=UserNScore[1][pos];

  Leaderboard.text("1. "+top1, 340, 267);
  Leaderboard.text("2. "+top2, 340, 353);
  Leaderboard.text("3. "+top3, 340, 437);
  Leaderboard.text(""+(pI+1)+". "+top_pI, 340, 540);

  Leaderboard.text(""+p1, 800, 267);
  Leaderboard.text(""+p2, 800, 353);
  Leaderboard.text(""+p3, 800, 437);
  Leaderboard.text(""+p_pI, 800, 540);

  PFont s = createFont("Calibri Bold", 24);
  Leaderboard.textFont(s);
  Leaderboard.textSize(24);

  Leaderboard.text(""+(pos+1)+". "+top, 1040, 630);
  Leaderboard.text(""+p, 1040, 680);
}

int calcTime(int aux) {

  return aux;
}
